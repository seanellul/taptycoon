import 'package:flutter/material.dart';
import 'package:fm/functions/contextProvider.dart';
import 'package:fm/ui_modules/ui_modules.dart';
import 'package:provider/provider.dart';
import '../functions/themeProvider.dart'; // Import your ThemeProvider

class HomeScreen extends StatelessWidget {
  final void Function() passDay;

  const HomeScreen({required this.passDay});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final contextProvider = Provider.of<ContextProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Football Manager Simulator")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Navigation",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // Drawer Items
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Team Sheet"),
              onTap: () {
                Navigator.pushNamed(context, '/teamSheet');
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text("Team Data"),
              onTap: () {
                Navigator.pushNamed(context, '/teamData');
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text("Office"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text("Start Match"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Header(title: "Day ${contextProvider.dayNumber}"),
                SizedBox(width: 10),
                CustomButton(
                    child: Icon(Icons.settings),
                    onPressed: () => themeProvider.toggleTheme()),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                  child: Text("Team Sheet"),
                  onPressed: () => Navigator.pushNamed(context, '/teamSheet')),
              CustomButton(
                  child: Text("Team Data"),
                  onPressed: () => Navigator.pushNamed(context, '/teamData')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(child: Text("Office"), onPressed: () {}),
              CustomButton(
                  child: Text("Start Match"),
                  onPressed: () => showCustomPopup(context, "You Won!")),
            ],
          ),
          SizedBox(height: 20),

          // Expanded(
          //   child: ScrollableList(players: team),
          // ),

          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
              label: Text("Finish Day"),
              icon: Icon(Icons.done_all),
              onPressed: () => _showFinishDayPopup(context),
            ),
          ),
          SizedBox(height: 0),
        ],
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
                passDay(); // Run the simulation logic
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
