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
          children: []
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
