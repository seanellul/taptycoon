import 'package:flutter/material.dart';
import 'package:fm/functions/contextProvider.dart';
import 'package:provider/provider.dart';

class TeamSheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<ContextProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Team Sheet")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2, child: Text("Name", style: _headerTextStyle())),
                Expanded(
                    flex: 2,
                    child: Text("Nationality",
                        style: _headerTextStyle(),
                        textAlign: TextAlign.center)),
                Expanded(
                    flex: 1,
                    child: Text("Age",
                        style: _headerTextStyle(),
                        textAlign: TextAlign.center)),
                Expanded(
                    flex: 2,
                    child: Text("Position",
                        style: _headerTextStyle(), textAlign: TextAlign.right)),
              ],
            ),
            Divider(thickness: 1.5),
            // Player List
            Expanded(
              child: ListView.builder(
                itemCount: contextProvider.teamSize,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                                contextProvider.team[index]["name"] ?? "",
                                style: _rowTextStyle(Colors.white))),
                        Expanded(
                            flex: 2,
                            child: Text(
                              contextProvider.team[index]["nationality"] ?? "",
                              style: _rowTextStyle(Colors.grey),
                              textAlign: TextAlign.center,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                                contextProvider.team[index]["age"] ?? "",
                                style: _rowTextStyle(Colors.white),
                                textAlign: TextAlign.center)),
                        Expanded(
                            flex: 2,
                            child: Text(
                                contextProvider.team[index]["position"] ?? "",
                                style: _rowTextStyle(Colors.white),
                                textAlign: TextAlign.right)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _headerTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[300]);
  }

  TextStyle _rowTextStyle(Color color) {
    return TextStyle(fontSize: 14, color: color ?? Colors.white);
  }
}
