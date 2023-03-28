import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:podcast_app/models/podcast_model.dart';

import '../providers/firebase_providers.dart';

final podcastRepositoryProvider = Provider(
  (ref) => PodcastRepository(
    firestore: ref.read(firestoreProvider),
    storage: ref.read(
      storageProvider,
    ),
  ),
);

class PodcastRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  PodcastRepository({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _storage = storage;

  Future<Either<String, String>> uploadPodcast({
    required String name,
    required String producer,
    required String date,
    required File audioFile,
  }) async {
    try {
      //Generate a uid for the podcast item
      final String podcastId = _firestore.collection('podcasts').doc().id;

      //Upload the audio file to Firebase Storage
      final String audioPath =
          'podcasts/$podcastId/${audioFile.path.split('/').last}';
      final UploadTask task =
          _storage.ref().child(audioPath).putFile(audioFile);
      final TaskSnapshot snapshot = await task;
      //Get the download url for the audio file
      final String audioUrl = await snapshot.ref.getDownloadURL();

      final podcastData = PodcastItem(
        podcastId: podcastId,
        name: name,
        producer: producer,
        date: date,
        audioUrl: audioUrl,
        audioPath: audioPath,
      );
      await _firestore
          .collection('podcasts')
          .doc(podcastId)
          .set(podcastData.toMap());

      return right('Podcast uploaded successfully');
    } catch (e) {
      return left('Error uploading podcast: $e');
    }
  }

  Stream<List<PodcastItem>> getPodcasts() {
    return _firestore.collection('podcasts').snapshots().map((events) {
      List<PodcastItem> podcasts = [];
      for (var podcast in events.docs) {
        podcasts.add(
          PodcastItem.fromMap(podcast.data()),
        );
      }
      return podcasts;
    });
  }

  Future<Either<String, String>> deletePodcast(
      String podcastId, String audioPath) async {
    try {
      //Delete the podcast from firestore
      await _firestore.collection('podcasts').doc(podcastId).delete();

      //Delete the podcast audio storage
      await _storage.ref().child(audioPath).delete();

      return right('Podcast deleted successfully');
    } catch (e) {
      return left('Error deleting podcast: $e');
    }
  }
}
