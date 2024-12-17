import 'package:flutter/material.dart';
import 'package:fm/functions/contextProvider.dart';
import 'package:fm/ui_modules/app_drawer.dart';
import 'package:fm/ui_modules/ui_modules.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final void Function() registerTap;

  const HomeScreen({required this.registerTap});

  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<ContextProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Taps: ${contextProvider.taps}"),
          Text("Multiplier: ${contextProvider.multiplier}"),
        ],
      )),
      drawer: appDrawer(context: context),
      body: Center(
        child: TapButton(
            color: contextProvider.color,
            child: Text("Tap"),
            onPressed: () => registerTap()),
      ),
    );
  }

  void showCustomPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Match Result"),
        content: Text(message),
        actions: [
          CustomButton(
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop()),
        ],
      ),
    );
  }

  void _showFinishDayPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Finish Day"),
          content: Text("Do you wish to Finish your day?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                registerTap(); // Run the simulation logic
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
