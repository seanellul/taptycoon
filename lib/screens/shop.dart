import 'package:flutter/material.dart';
import 'package:fm/data/shop_item.dart';
import 'package:fm/functions/contextProvider.dart';
import 'package:fm/ui_modules/ui_modules.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<ContextProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Shop")),
      body: Column(
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Your Taps: ${contextProvider.taps}",
                  style: TextStyle(fontSize: 20)),
              Text("Total Taps: ${contextProvider.actualTaps}",
                  style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 10),
          ShopBuilder(shopItems: shopItems),
        ],
      ),
    );
  }
}

class ShopBuilder extends StatelessWidget {
  final List<ShopItem> shopItems;
  const ShopBuilder({
    super.key,
    required this.shopItems,
  });

  @override
  Widget build(BuildContext context) {
    final shopItemList = shopItems
        .map((item) => ShopButton(item: item))
        .toList();

    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: shopItemList,
      ),
    );
  }
}

class ShopButton extends StatelessWidget {
  final ShopItem item;

  const ShopButton({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<ContextProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      onPressed: () => contextProvider.buyItem(item),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 35, color: Colors.grey),
          SizedBox(height: 20),
          Text(item.name,
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
