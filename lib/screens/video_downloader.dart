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
  List<Format> videoFormats = [];
  List<Format> audioFormats = [];

  void getResolutions(String link) async {
    var result = await Process.run("yt-dlp", ["--dump-json", link], runInShell: true);
    var resultModel = ytDlpVideoDataFromJson(result.stdout);
    for (var i = 0; i < resultModel.formats.length; i++) {
      Format currentModel = resultModel.formats[i];
      if (currentModel.container == "webm_dash") {
        if (currentModel.formatNote == "144p" && currentModel.fps == 30) {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "240p") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "360p") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "480p") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "720p") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "720p60") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "1080p") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "1080p60") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "1440p") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "1440p60") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "2160p") {
          videoFormats.add(currentModel);
        }
        if (currentModel.formatNote == "2160p60") {
          videoFormats.add(currentModel);
        }
      }
      if (currentModel.formatNote == "medium" && currentModel.audioExt == "webm") {
        videoFormats.add(currentModel);
      }
    }
    log(videoFormats.toString());
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
              Padding(
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
              (videoFormats.isNotEmpty)
                  ? StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: 400,
                          width: 600,
                          child: ListView.builder(itemCount: videoFormats.length, itemBuilder: (BuildContext context, int index) {}),
                        );
                      })
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
