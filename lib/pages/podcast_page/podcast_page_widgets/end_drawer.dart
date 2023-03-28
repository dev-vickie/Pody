import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../utils/neumorphic_box.dart';
import '../upload_podcast.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.mainAppColor,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.flutter_dash,
                    color: Colors.blueAccent,
                    size: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeuBox(
                  child: ListTile(
                    title: Text(
                      'About',
                      style: GoogleFonts.openSans(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.lightbulb),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeuBox(
                  child: ListTile(
                    title: Text(
                      'Favorites',
                      style: GoogleFonts.openSans(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.favorite,
                      size: 28,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeuBox(
                  child: ListTile(
                    title: Text(
                      'Settings',
                      style: GoogleFonts.openSans(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.settings,
                      size: 28,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: NeuBox(
                  child: ListTile(
                    title: Text(
                      'Upload',
                      style: GoogleFonts.openSans(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.cloud_upload_rounded,
                      size: 28,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UploadPodcastPage(),
                      ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
