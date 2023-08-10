import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gui_yt_dlp/preferences/model_theme.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool theme = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        theme = themeNotifier.isDark;
        return Scaffold(
          appBar: AppBar(
            title: Text("Settings",
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold, fontSize: 25)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            themeNotifier.isDark ? Colors.white : Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Dark Theme",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Switch(
                          value: theme,
                          onChanged: (bool value) {
                            theme = value;
                            themeNotifier.isDark
                                ? themeNotifier.isDark = false
                                : themeNotifier.isDark = true;
                          },
                        ),
                      )
                    ],
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
