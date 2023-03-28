import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'podcast_repository.dart';

final podcastControllerProvider =
    StateNotifierProvider<PodcastController, bool>(
  (ref) => PodcastController(
    ref.read(podcastRepositoryProvider),
  ),
);

class PodcastController extends StateNotifier<bool> {
  final PodcastRepository _podcastRepository;
  PodcastController(final PodcastRepository podcastRepository)
      : _podcastRepository = podcastRepository,
        super(false);

  Future<void> uploadPodcast({
    required String name,
    required String producer,
    required String date,
    required File audioFile,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _podcastRepository.uploadPodcast(
      name: name,
      producer: producer,
      date: date,
      audioFile: audioFile,
    );
    state = false;
    //errors go left,success goes right
    res.fold(
      (l) {
        Navigator.of(context).pop();
        showSnackbar(context, l.toString());
      },
      (r) => showSnackbar(context, r.toString()),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:podcast_app/logic/podcast_repository.dart';

// final podcastRepositoryProvider = Provider((ref) => PodcastRepository(
//       firestore: FirebaseFirestore.instance,
//       storage: FirebaseStorage.instance,
//     ));

// final podcastControllerProvider = StateNotifierProvider.autoDispose((ref) => PodcastController(ref.read));

// class PodcastController extends StateNotifier<AsyncValue<List<Podcast>>> {
  

//   PodcastController(this._read) : super(AsyncValue.loading()) {
//     getPodcasts();
//   }

//   Future<void> getPodcasts() async {
//     state = AsyncValue.loading();
//     final result = await _read(podcastRepositoryProvider).getPodcasts();

//     state = result.fold(
      
//     );
//   }

//   Future<void> uploadPodcast({
//     required String title,
//     required String description,
//     required File audioFile,
//   }) async {
//     state = AsyncValue.loading();
//     final result = await _read(podcastRepositoryProvider).uploadPodcast(
//       title: title,
//       description: description,
//       audioFile: audioFile,
//     );

//     if (result.isRight()) {
//       // If the upload was successful, refresh the list of podcasts
//       getPodcasts();
//     } else {
//       state = AsyncValue.error(result.left);
//     }
//   }

//   Future<void> deletePodcast(String podcastId, String audioPath) async {
//     state = AsyncValue.loading();
//     final result = await _read(podcastRepositoryProvider).deletePodcast(podcastId, audioPath);

//     if (result.isRight()) {
//       // If the delete was successful, refresh the list of podcasts
//       getPodcasts();
//     } else {
//       state = AsyncValue.error(result.left);
//     }
//   }
// }
