import 'package:flutter/material.dart';
import 'package:podcast_app/constants/constants.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/featuring.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/featuring_podcast.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/greetings.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/podcast_name.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/popular_name.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/search.dart';

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
            children: const [
              //greetings
              Greetings(username: 'melisa'),
              SizedBox(
                height: 10,
              ),
              //podcast header name
              PodcastHeader(),
              SizedBox(
                height: 40,
              ),

              //search
              Search(),
              SizedBox(height: 40),

              //featuring
              FeaturingPodcast(),
              SizedBox(height: 20),

              //featuring podcast card
              FeaturingPodcastCard(
                podcastName: 'CODE LIFE BALANCE',
                producerName: 'Victor Mutethia',
              ),
              SizedBox(
                height: 15,
              ),

              // popular and view all text
              PopularName(),
              SizedBox(height: 10),

              //popular list
              PopularPodcastsList(
                podcastName: 'Building Scrollable Experiences',
                producerName: 'victor Mutethia',
              ),
              PopularPodcastsList(
                podcastName: 'Flutter : The iOS way',
                producerName: 'Victor Mutethia',
              ),
              PopularPodcastsList(
                podcastName: 'Flutter for beginners',
                producerName: 'Victor Mutethia',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
