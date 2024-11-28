import 'package:flutter/material.dart';
import 'package:fm/functions/contextProvider.dart';
import 'package:fm/screens/mainScreen.dart';
import 'package:fm/screens/teamData.dart';
import 'package:fm/screens/teamSheet.dart';
import 'package:provider/provider.dart';
import 'functions/themeProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ContextProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final contextProvider = Provider.of<ContextProvider>(context);
    
    return MaterialApp(
      theme: ThemeData.light(), // Define your light theme here
      darkTheme: ThemeData.dark(), // Define your dark theme here
      themeMode: themeProvider.themeMode, // Use theme from provider
      routes: {
        '/': (context) => HomeScreen(passDay: () => simulateNextDay(context)),
        '/teamSheet': (context) => TeamSheetScreen(),
        '/teamData': (context) => TeamDataScreen(),
        '/office': (context) => HomeScreen(passDay: () => simulateNextDay(context)),
        '/startMatch': (context) => HomeScreen(passDay: () => simulateNextDay(context)),
      },
    );
  }

  void simulateNextDay(BuildContext context) {


    final contextProvider = Provider.of<ContextProvider>(context, listen: false);
    contextProvider.incrementDay();
    print("Simulating the next day...");



  }
}
