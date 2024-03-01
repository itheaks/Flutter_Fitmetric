import 'package:flutter/material.dart';
import 'package:scratch/samples/ui/rive_app/models/tab_item.dart';

class MenuItemModel {
  MenuItemModel({
    this.id,
    this.title = "",
    required this.riveIcon,
  });

  UniqueKey? id = UniqueKey();
  String title;
  TabItem riveIcon;

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      title: "Energy Calculator",
      riveIcon: TabItem(stateMachine: "STAR_Interactivity", artboard: "LIKE/STAR"),
    ),
    MenuItemModel(
      title: "Nutrition",
      riveIcon: TabItem(stateMachine: "STAR_Interactivity", artboard: "LIKE/STAR"),
    ),
    MenuItemModel(
      title: "Mental Health",
      riveIcon: TabItem(stateMachine: "STAR_Interactivity", artboard: "LIKE/STAR"),
    ),
    MenuItemModel(
      title: "Games",
      riveIcon: TabItem(stateMachine: "STAR_Interactivity", artboard: "LIKE/STAR"),
    ),
  ];

  static List<MenuItemModel> menuItems2 = [
    MenuItemModel(
      title: "Prescription Analysis",
      riveIcon: TabItem(stateMachine: "TIMER_Interactivity", artboard: "TIMER"),
    ),
    MenuItemModel(
      title: "Medicine Suggestion",
      riveIcon: TabItem(stateMachine: "TIMER_Interactivity", artboard: "TIMER"),
    ),
    MenuItemModel(
      title: "Know Your Disease",
      riveIcon: TabItem(stateMachine: "TIMER_Interactivity", artboard: "TIMER"),
    ),
    MenuItemModel(
      title: "Health Monitoring",
      riveIcon: TabItem(stateMachine: "TIMER_Interactivity", artboard: "TIMER"),
    ),
  ];

  static List<MenuItemModel> menuItems3 = [
    MenuItemModel(
      title: "Settings",
      riveIcon:
          TabItem(stateMachine: "SETTINGS_Interactivity", artboard: "SETTINGS"),
    ),
  ];
}
