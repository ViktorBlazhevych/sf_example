import 'package:flutter/material.dart';
import 'package:sf_example/screens/detailsScreen.dart';
import 'package:sf_example/sf_localization/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final userName = "Alisa Moon";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.MainScreen.titleScreen),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 24,
          children: [
            Text(AppLocalizations.of(context)!
                .MainScreen
                .helloUser
                .replaceFirst("{USER}", userName)),
            Text(AppLocalizations.of(context)!.MainScreen.yourTodayTask),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailsScreen()),
                  );
                },
                child: Text(
                    AppLocalizations.of(context)!.MainScreen.Buttons.details))
          ],
        ),
      ),
    );
  }
}
