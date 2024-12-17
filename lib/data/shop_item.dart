import 'package:flutter/material.dart';

class ShopItem {
  final String name;
  final int tapPrice;
  final IconData icon;
  final String uniqueTrait;
  final int multiplier;
  ShopItem({
    required this.name,
    required this.tapPrice,
    required this.icon,
    required this.uniqueTrait,
    required this.multiplier,
  });
}

final List<ShopItem> shopItems = [
  ShopItem(
      name: "Tap Multiplier",
      tapPrice: 100,
      icon: Icons.tap_and_play,
      uniqueTrait: "multiplier",
      multiplier: 1),
  ShopItem(
      name: "Tap Multiplier x2",
      tapPrice: 200,
      icon: Icons.tap_and_play,
      uniqueTrait: "multiplier",
      multiplier: 2),
  ShopItem(
      name: "Tap Multiplier x3",
      tapPrice: 300,
      icon: Icons.tap_and_play,
      uniqueTrait: "multiplier",
      multiplier: 3),
  ShopItem(
      name: "Tap Multiplier x4",
      tapPrice: 400,
      icon: Icons.tap_and_play,
      uniqueTrait: "multiplier",
      multiplier: 4),
  ShopItem(
      name: "Tap Multiplier x5",
      tapPrice: 500,
      icon: Icons.tap_and_play,
      uniqueTrait: "multiplier",
      multiplier: 5),
  ShopItem(
      name: "Tap Multiplier x6",
      tapPrice: 600,
      icon: Icons.arrow_forward,
      uniqueTrait: "multiplier",
      multiplier: 6),
];
