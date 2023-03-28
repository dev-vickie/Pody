import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/constants/constants.dart';
import 'package:podcast_app/logic/podcast_controller.dart';
import 'package:podcast_app/utils/neumorphic_box.dart';

class UploadPodcastPage extends ConsumerStatefulWidget {
  const UploadPodcastPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadPodcastPageState();
}

class _UploadPodcastPageState extends ConsumerState<UploadPodcastPage> {
  final nameController = TextEditingController();
  final producerController = TextEditingController();
  final dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    producerController.dispose();
    dateController.dispose();
    super.dispose();
  }

  File? podcastFile;
  String? pickedFileName;

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null) {
      setState(() {
        podcastFile = File(result.files.first.path!);
        pickedFileName = result.files.first.name;
      });
    }
  }

  void uploadPodcast(WidgetRef ref) async {
    if (podcastFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Please select file"),
        ),
      );
    } else {
      debugPrint("uploading");
      await ref
          .read(podcastControllerProvider.notifier)
          .uploadPodcast(
            name: nameController.text.trim(),
            producer: producerController.text.trim(),
            date: dateController.text.trim(),
            audioFile: podcastFile!,
            context: context,
          )
          .then((value) => Navigator.of(context).pop());
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = ref.watch(podcastControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.mainAppColor,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const NeuBox(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                          const Text("U P L O A D"),
                          const Text("P O D C A S T"),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                debugPrint("Validated");
                                uploadPodcast(ref);
                              }
                            },
                            child: NeuBox(
                                child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                "Upload",
                                style: GoogleFonts.openSans(fontSize: 18),
                              ),
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          debugPrint("Picking files");
                          pickFile();
                        },
                        child: NeuBox(
                          child: SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: podcastFile != null
                                ? Center(
                                    child: Row(
                                      children: [
                                        const NeuBox(
                                          child: SizedBox(
                                            width: 100,
                                            child: Icon(
                                              Icons.mic,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: SizedBox(
                                            child: Text(
                                              pickedFileName!,
                                              style: GoogleFonts.openSans(
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Select file",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.add,
                                          size: 40,
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildTextField(
                          controller: nameController,
                          hintText: "Podcast Title"),
                      const SizedBox(height: 20),
                      buildTextField(
                          controller: producerController,
                          hintText: "Producer Name"),
                      const SizedBox(height: 20),
                      buildTextField(
                          controller: dateController, hintText: "Date"),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

Widget buildTextField(
    {required TextEditingController controller, required String hintText}) {
  return NeuBox(
    child: TextFormField(
      maxLines: 1,
      style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 19),
      cursorColor: Colors.black54,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: GoogleFonts.openSans(fontSize: 18),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please fill in this");
        }

        return null;
      },
    ),
  );
}
