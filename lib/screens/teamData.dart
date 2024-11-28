import 'package:flutter/material.dart';
import 'package:fm/functions/contextProvider.dart';
import 'package:provider/provider.dart';

class TeamDataScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<ContextProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Team Data")),
      body: Center(
        child: Text("Day ${contextProvider.dayNumber}"),
      ),
    );
  }
}
