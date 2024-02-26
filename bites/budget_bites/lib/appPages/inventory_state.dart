import 'package:flutter/material.dart';

const int maxSlots = 60;

class InventoryItem {
  int? index;
  String name;
  String icon; // Path to PNG asset
  String buttonMode; // Either "add" or "delete"

  InventoryItem({
    this.index,
    required this.name,
    required this.icon,
    required this.buttonMode,
  });
}

List<InventoryItem> items = List.generate(
  maxSlots,
  (index) => InventoryItem(
    index: null,
    name: 'Test',
    icon: 'assets/icons/default.png', // Default path to the PNG asset
    buttonMode: 'add', // Default button mode is "add"
  ),
);
