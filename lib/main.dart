import 'package:flutter/material.dart';
import 'package:sf_example/screens/mainScreen.dart';
import 'package:sf_example/sf_localization/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"), // const Locale("de"), OR const Locale("it"),
      home: const MainScreen(),
    );
  }
}
