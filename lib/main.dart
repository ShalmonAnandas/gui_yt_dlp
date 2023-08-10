import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gui_yt_dlp/preferences/model_theme.dart';
import 'package:gui_yt_dlp/screens/screen_selector.dart';
import 'package:gui_yt_dlp/widgets/sidebar.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

bool theme = false;

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
            theme: themeNotifier.isDark
                ? ThemeData.dark(useMaterial3: true)
                : ThemeData.light(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              key: _key,
              appBar: AppBar(
                title: Text("GUI YT DLP",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold, fontSize: 30)),
                centerTitle: true,
              ),
              drawer: SideBarWidget(controller: _controller),
              body: ScreenSelector(controller: _controller),
            ),
          );
        },
      ),
    );
  }
}
