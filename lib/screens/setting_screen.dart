import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;

  // get the saved theme mode
  void getThemeMode() async{
    // get the saved theme mode
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    // check if the saved theme mode is dark
    if(savedThemeMode == AdaptiveThemeMode.dark){
      setState(() {
        isDarkMode = true;
      });
    }else{
      setState(() {
        isDarkMode = false;
      });
    }
  }

  @override
  void initState(){
    getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SwitchListTile(
            title: const Text("Change Theme"),
            secondary: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              child: Icon(
                isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                color: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            value: isDarkMode,
            onChanged: (value){
              setState(() {
                isDarkMode = value;
              });
              if(value){
                AdaptiveTheme.of(context).setDark();
              }else{
                AdaptiveTheme.of(context).setLight();
              }
            }),
        ),
      ),
    );
  }
}
