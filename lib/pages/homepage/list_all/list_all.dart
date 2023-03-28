import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/constants/constants.dart';
import 'package:podcast_app/logic/podcast_controller.dart';
import 'package:podcast_app/pages/homepage/homepage_widgets/popular_list.dart';
import 'package:podcast_app/utils/neumorphic_box.dart';

class ViewAll extends ConsumerWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.mainAppColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: NeuBox(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "P O D C A S T S",
                  style: GoogleFonts.openSans(fontSize: 25),
                ),
                backgroundColor: AppColors.mainAppColor,
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: NeuBox(
                      child: Icon(
                        Icons.favorite,
                      ),
                    ),
                  )
                ],
                expandedHeight: 70,
              ),
              ref.watch(getPodcastsProvider).when(
                    data: (podcasts) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: podcasts.length,
                        (context, index) {
                          final podcast = podcasts[index];
                          return PopularPodcastsList(podcast: podcast);
                        },
                      ),
                    ),
                    error: (error, stackTrace) => const Center(
                      child: Text("Something happened"),
                    ),
                    loading: () => const CircularProgressIndicator(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
