import 'package:flutter/material.dart';
import 'package:podcast_app/constants/constants.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/featuring.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/featuring_podcast.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/greetings.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/podcast_name.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/popular_name.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/search.dart';

import '../../models/podcast_model.dart';
import 'homepage_widgets/popular_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppColor,
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

              //search
              const Search(),
              const SizedBox(height: 40),

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
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: podcasts.length,
                    itemBuilder: (context, index) {
                      Podcast podcast = podcasts[index];
                      return PopularPodcastsList(
                          podcastName: podcast.name,
                          producerName: podcast.producer,
                          pictureUrl: podcast.pictureUrl);
                    }),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
