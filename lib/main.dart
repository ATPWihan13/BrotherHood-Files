import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:brotherhood/authentication/login_screen.dart';
import 'package:brotherhood/providers/authentication_provider.dart';
// import 'package:brotherhood/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ],
        child: MyApp(savedThemeMode: savedThemeMode),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurpleAccent,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurpleAccent,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brotherhood Files',
        theme: theme,
        darkTheme: darkTheme,
        home: const LoginScreen(),
      ),
    );
  }
}