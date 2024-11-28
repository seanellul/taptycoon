import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Widget child; // Accepts any widget: Text, Icon, etc.
  final VoidCallback onPressed;

  const CustomButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 18),
      ),
      child: child,
    );
  }
}

class ScrollableListPlayers extends StatelessWidget {
  final List<Map<String, String>> players;

  const ScrollableListPlayers({required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Text(player["name"] ?? "",
                      style: TextStyle(fontSize: 16))),
              Expanded(
                  flex: 2,
                  child: Text(player["nationality"] ?? "",
                      style: TextStyle(fontSize: 16))),
              Expanded(
                  flex: 1,
                  child: Text(player["age"] ?? "",
                      style: TextStyle(fontSize: 16))),
              Expanded(
                  flex: 2,
                  child: Text(player["position"] ?? "",
                      style: TextStyle(fontSize: 16))),
            ],
          ),
        );
      },
    );
  }
}
