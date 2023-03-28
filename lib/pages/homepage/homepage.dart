import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podcast_app/constants/constants.dart';
import 'package:podcast_app/models/podcast_model.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/featuring.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/featuring_podcast.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/greetings.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/podcast_name.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/popular_name.dart';

import '../../logic/podcast_controller.dart';
import 'homepage_widgets/popular_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.mainAppColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //greetings
              const Greetings(username: 'melisa'),
              const SizedBox(
                height: 10,
              ),
              //podcast header name
              const PodcastHeader(),
              const SizedBox(
                height: 40,
              ),

              //featuring
              const FeaturingPodcast(),
              const SizedBox(height: 20),

              //featuring podcast card
              const FeaturingPodcastCard(
                podcastName: 'CODE LIFE BALANCE',
                producerName: 'Victor Mutethia',
              ),
              const SizedBox(
                height: 15,
              ),

              // popular and view all text
              const PopularName(),
              const SizedBox(height: 10),

              //popular list
              buildPopularList(ref),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildPopularList(WidgetRef ref) {
  return SizedBox(
    height: 300,
    child: ref.watch(getPodcastsProvider).when(
          data: (podcasts) {
            List<PodcastItem> popularPodcasts = podcasts.take(3).toList();
            return ListView.builder(
              itemCount: popularPodcasts.length,
              itemBuilder: (context, index) {
                final podcast = popularPodcasts[index];
                return PopularPodcastsList(
                  podcast: podcast,
                );
              },
            );
          },
          error: (error, stackTrace) =>
              const Center(child: Text("Something happened")),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
  );
}
