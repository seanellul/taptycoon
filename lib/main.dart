import 'package:flutter/material.dart';
import 'package:fm/functions/contextProvider.dart';
import 'package:fm/screens/homescreen.dart';
import 'package:fm/screens/shop.dart';
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

    return MaterialApp(
      theme: ThemeData.light(), // Define your light theme here
      darkTheme: ThemeData.dark(), // Define your dark theme here
      themeMode: themeProvider.themeMode, // Use theme from provider
      routes: {
        '/': (context) => HomeScreen(registerTap: () => registerTap(context)),
        '/homescreen': (context) =>
            HomeScreen(registerTap: () => registerTap(context)),
        '/teamSheet': (context) => TeamSheetScreen(),
        '/shop': (context) => ShopScreen(),
        '/office': (context) =>
            HomeScreen(registerTap: () => registerTap(context)),
        '/startMatch': (context) =>
            HomeScreen(registerTap: () => registerTap(context)),
      },
    );
  }

  void registerTap(BuildContext context) {
    final contextProvider =
        Provider.of<ContextProvider>(context, listen: false);
    contextProvider.registerTap();
  }
}
