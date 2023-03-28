import 'package:flutter/material.dart';

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
                padding: const EdgeInsets.all(5),
                child: NeuBox(
                  child: ListTile(
                    title: const Text(
                      'Upload',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    trailing: const Icon(
                      Icons.settings,
                      size: 28,
                      color: Colors.black,
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: NeuBox(
                  child: ListTile(
                    title: Text('Settings'),
                    trailing: Icon(Icons.settings),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: NeuBox(
                  child: ListTile(
                    title: Text('Settings'),
                    trailing: Icon(Icons.settings),
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
