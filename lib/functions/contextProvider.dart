import 'package:flutter/material.dart';

class ContextProvider extends ChangeNotifier {
  int _day = 0;

  int get day => _day;
  int get dayNumber => _day + 1;
  int get teamSize => _team.length;
  List<Map<String, String>> get team => _team;

  void incrementDay() {
    _day++;
    notifyListeners();
  } 

  final List<Map<String, String>> _team = [
    {
      "name": "Lionel Messi",
      "nationality": "Argentina",
      "age": "36",
      "position": "Forward"
    },
    {
      "name": "Cristiano Ronaldo",
      "nationality": "Portugal",
      "age": "38",
      "position": "Forward"
    },
    {
      "name": "Kevin De Bruyne",
      "nationality": "Belgium",
      "age": "32",
      "position": "Midfielder"
    },
    {
      "name": "Virgil van Dijk",
      "nationality": "Netherlands",
      "age": "32",
      "position": "Defender"
    },
    {
      "name": "Alisson Becker",
      "nationality": "Brazil",
      "age": "31",
      "position": "Goalkeeper"
    },
  ];
}
