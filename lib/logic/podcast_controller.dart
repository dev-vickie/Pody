import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/snackbar.dart';
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
      (error) {
        showErrorSnackbar(context, error.toString());
      },
      (r) => showSnackbar(context, r.toString()),
    );
  }


}
