import 'package:flutter/material.dart';
import 'package:gui_yt_dlp/screens/homescreen.dart';
import 'package:gui_yt_dlp/screens/settings.dart';
import 'package:gui_yt_dlp/screens/video_downloader.dart';
import 'package:sidebarx/sidebarx.dart';

class ScreenSelector extends StatelessWidget {
  const ScreenSelector({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return const VideoDownloader();
          case 1:
            return const SettingsScreen();
          default:
            return Text(
              pageTitle,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Settings';
    default:
      return 'Not found page';
  }
}
