/*

  Project: Tasks
  
  Date created: 27 July 2024 | 15:01

  Created by StringFly. Copyright © StringFly. All rights reserved.

*/

// --------------------------------------------------------------
// --------------------------------------------------------------
// 1. add to pubspec.yaml
/*             
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: any
*/
// 
// 2. in main dart
//
/*
return MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: MyApplicationHome(),
);
*/
//  
// 3. It's all. No need generate or copy/move/paste, ARB and other manipulation
//
// --------------------------------------------------------------
// --------------------------------------------------------------

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

class AppLocalizations extends SFLanguageGroup {
  AppLocalizations(String locale, Map<String, String> super.map)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale("en", "US"),
    Locale("de", "DE"),
    Locale("it", "IT"),

  ];
}

// --------------------------------------------------------------
// --------------------------------------------------------------

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    LanguageMap languageMap = Map_enUS();

    switch (locale.toLanguageTag()) {
      case "en-US":
        languageMap = Map_enUS();
      case "de-DE":
        languageMap = Map_deDE();
      case "it-IT":
        languageMap = Map_itIT();
      default:
    }

    
    return SynchronousFuture<AppLocalizations>(
        AppLocalizations(locale.languageCode, languageMap.map));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>["en", "de", "it", ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

// --------------------------------------------------------------
// --------------------------------------------------------------

extension AppLocalizationsEx on AppLocalizations {
  SFMainScreen get MainScreen => SFMainScreen(map);
  SFSecondScreen get SecondScreen => SFSecondScreen(map);

}

// --------------------------------------------------------------
// -------  LANGUAGES MAPS  -------------------------------------
// --------------------------------------------------------------

abstract class LanguageMap {
  abstract Map<String, String> map;
}

// en-US - English
class Map_enUS implements LanguageMap {
  @override
  Map<String, String> map = {
    "MainScreen.titleScreen": "Main App Screen",
    "MainScreen.helloUser": "Hello, {USER}",
    "MainScreen.yourTodayTask": "You have more tasks today.",
    "MainScreen.Buttons.details": "Show Tasks",
    "SecondScreen.titleScreen": "Task Description",
    "SecondScreen.taskDescription": "**Your tasks for today:**\n- Drink coffee.\n- Use [app.stringfly.app](https://app.stringfly.app) to save your time.\n- Say *thank you*.\n- Grab a _pizza_ and go hang out with friends.",
    "SecondScreen.Buttons.complete": "Done",
    "SecondScreen.Buttons.later": "..will do Later"
  };
}
// de-DE - German
class Map_deDE implements LanguageMap {
  @override
  Map<String, String> map = {
    "MainScreen.titleScreen": "Hauptbildschirm der App",
    "MainScreen.helloUser": "Hallo, {USER}",
    "MainScreen.yourTodayTask": "Sie haben heute mehr Aufgaben.",
    "MainScreen.Buttons.details": "Aufgaben anzeigen",
    "SecondScreen.titleScreen": "Aufgaben",
    "SecondScreen.taskDescription": "**Deine Aufgaben für heute:**\n- Kaffee trinken.\n- Verwenden Sie [app.stringfly.app](https://app.stringfly.app), um Zeit zu sparen.\n- Sag *Danke*.\n- Schnapp dir eine _Pizza_ und hänge mit Freunden ab.",
    "SecondScreen.Buttons.complete": "Fertig",
    "SecondScreen.Buttons.later": ".. werde später tun"
  };
}
// it-IT - Italian
class Map_itIT implements LanguageMap {
  @override
  Map<String, String> map = {
    "MainScreen.titleScreen": "Schermata principale dell'app",
    "MainScreen.helloUser": "Buongiorno, {USER}",
    "MainScreen.yourTodayTask": "Oggi hai più compiti.",
    "MainScreen.Buttons.details": "Mostra attività",
    "SecondScreen.titleScreen": "Descrizione dell'attività",
    "SecondScreen.taskDescription": "**I tuoi compiti per oggi:**\n- Bevi caffè.\n- Utilizzare [app.stringfly.app](https://app.stringfly.app) per risparmiare tempo.\n- Dì *grazie*.\n- Prendi una pizza e vai a uscire con gli amici.",
    "SecondScreen.Buttons.complete": "Fatto",
    "SecondScreen.Buttons.later": ".. lo farà più tardi"
  };
}


// --------------------------------------------------------------
// -------  LANGUAGES GROUPS  -----------------------------------
// --------------------------------------------------------------

class SFLanguageGroup {
  SFLanguageGroup(this.map) : super();
  Map<String, String>? map;

  String getValueFor(String valueName) {
    if (map != null && map!.containsKey(valueName)) {
      return map![valueName] ?? "";
    } else {
      return "";
    }
  }
}

class SFMainScreen extends SFLanguageGroup {
  SFMainScreen(super.map);
  /// value:
  ///**'Main App Screen'**
  String get titleScreen => getValueFor("MainScreen.titleScreen");
  /// value:
  ///**'Hello, {USER}'**
  String get helloUser => getValueFor("MainScreen.helloUser");
  /// value:
  ///**'You have more tasks today.'**
  String get yourTodayTask => getValueFor("MainScreen.yourTodayTask");
  SFMainScreenButtons get Buttons => SFMainScreenButtons(map);
}

class SFMainScreenButtons extends SFLanguageGroup {
  SFMainScreenButtons(super.map);
  /// value:
  ///**'Show Tasks'**
  String get details => getValueFor("MainScreen.Buttons.details");
}

class SFSecondScreen extends SFLanguageGroup {
  SFSecondScreen(super.map);
  /// value:
  ///**'Task Description'**
  String get titleScreen => getValueFor("SecondScreen.titleScreen");
  /// value:
  ///**'**Your tasks for today:**\n- Drink coffee.\n- Use [app.stringfly.app](https://app.stringfly.app) to save your time.\n- Say *thank you*.\n- Grab a _pizza_ and go hang out with friends.'**
  String get taskDescription => getValueFor("SecondScreen.taskDescription");
  SFSecondScreenButtons get Buttons => SFSecondScreenButtons(map);
}

class SFSecondScreenButtons extends SFLanguageGroup {
  SFSecondScreenButtons(super.map);
  /// value:
  ///**'Done'**
  String get complete => getValueFor("SecondScreen.Buttons.complete");
  /// value:
  ///**'..will do Later'**
  String get later => getValueFor("SecondScreen.Buttons.later");
}



