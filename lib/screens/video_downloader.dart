import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gui_yt_dlp/models/video_data.dart';
import 'package:gui_yt_dlp/preferences/model_theme.dart';
import 'package:gui_yt_dlp/utils/staticvariables.dart';
import 'package:provider/provider.dart';

class VideoDownloader extends StatefulWidget {
  const VideoDownloader({super.key});

  @override
  State<VideoDownloader> createState() => _VideoDownloaderState();
}

class _VideoDownloaderState extends State<VideoDownloader> {
  bool theme = false;
  final TextEditingController _videoLinkController = TextEditingController();
  List<Format> videoFormat = [];
  List<Format> audioFormatsSet = [];
  final List<bool> _selectedResultions = [];
  List<Widget> resolutions = [];
  String thumbnailUrl = '';
  int counter = 0;

  Future<String> getResolutions(String link) async {
    if (counter == 0) {
      videoFormat.clear();
      audioFormatsSet.clear();
      var result = await Process.run("yt-dlp", ["--dump-json", link], runInShell: true);
      var resultModel = ytDlpVideoDataFromJson(result.stdout);
      for (var i = 0; i < resultModel.formats.length; i++) {
        Format currentModel = resultModel.formats[i];
        if (currentModel.container == "webm_dash") {
          if (currentModel.formatNote == "144p" && currentModel.fps == 30) {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "240p") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "360p") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "480p") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "720p") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "720p60") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "1080p") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "1080p60") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "1440p") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "1440p60") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "2160p") {
            videoFormat.add(currentModel);
          }
          if (currentModel.formatNote == "2160p60") {
            videoFormat.add(currentModel);
          }
        }
        if (currentModel.formatNote == "medium" && currentModel.audioExt == "webm") {
          audioFormatsSet.add(currentModel);
        }
      }
      thumbnailUrl = resultModel.thumbnail;
      counter++;
    }
    for (var i = 0; i < videoFormat.length; i++) {
      _selectedResultions.add(false);
      resolutions.add(Text(videoFormat[i].formatNote ?? ""));
    }
    print(videoFormat);

    return Future.delayed(const Duration(seconds: 1), () {
      return "Data loaded";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        theme = themeNotifier.isDark;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Video Downloader",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 120,
                      width: 3000,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: themeNotifier.isDark ? Colors.white : Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextField(
                                  decoration: InputDecoration(hintText: "Paste Link", hintStyle: GoogleFonts.quicksand(fontWeight: FontWeight.bold)),
                                  controller: _videoLinkController,
                                  style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: StaticVar.submitColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    getResolutions(_videoLinkController.text);
                                  });
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10),
                                    Text("Get"),
                                    Text("Download"),
                                    Text("Links"),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: FutureBuilder<String>(
                    future: getResolutions(''),
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 400,
                          width: 4000,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: themeNotifier.isDark ? Colors.white : Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: ResizeImage(
                                          NetworkImage(
                                            thumbnailUrl,
                                          ),
                                          width: (MediaQuery.of(context).size.width * 0.6).round()),
                                    ),
                                  ),
                                  ToggleButtons(
                                    direction: Axis.vertical,
                                    onPressed: (int index) {
                                      setState(() {
                                        _selectedResultions[index] = !_selectedResultions[index];
                                      });
                                    },
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    selectedBorderColor: Colors.green[700],
                                    selectedColor: Colors.white,
                                    fillColor: Colors.green[200],
                                    color: Colors.green[400],
                                    constraints: const BoxConstraints(
                                      minHeight: 40.0,
                                      minWidth: 80.0,
                                    ),
                                    isSelected: _selectedResultions,
                                    children: resolutions,
                                  ),
                                  Text(
                                    videoFormat[0].formatNote! ?? "",
                                    style: GoogleFonts.quicksand(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ],
                              ),
                              // ListView.builder(
                              //   itemCount: snapshot.data?.length,
                              //   itemBuilder: (BuildContext context, int index) {
                              //     return Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: Container(
                              //         decoration: BoxDecoration(
                              //           border: Border.all(color: themeNotifier.isDark ? Colors.white : Colors.black),
                              //           borderRadius: BorderRadius.circular(10),
                              //         ),
                              //         child: Row(
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Image(
                              //                 image: ResizeImage(
                              //                     NetworkImage(
                              //                       thumbnailUrl,
                              //                     ),
                              //                     width: 250),
                              //               ),
                              //             ),
                              //             Text(
                              //               snapshot.data?[index].formatNote! ?? "",
                              //               style: GoogleFonts.quicksand(fontWeight: FontWeight.bold, fontSize: 20),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
