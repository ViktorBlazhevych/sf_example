import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sf_example/sf_localization/app_localizations.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.SecondScreen.titleScreen),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MarkdownBody(
                styleSheet: MarkdownStyleSheet(textAlign: WrapAlignment.center),
                data:
                    AppLocalizations.of(context)!.SecondScreen.taskDescription,
                fitContent: false,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!
                      .SecondScreen
                      .Buttons
                      .complete))
            ],
          ),
        ),
      ),
    );
  }
}
