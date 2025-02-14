import 'package:evently_c13_offline/core/assets_manager.dart';
import 'package:flutter/material.dart';

class CategoryDM {
  final String id;
  final String name;
  final String imagePath;
  final IconData iconName;

  const CategoryDM(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.iconName});

  static List<CategoryDM> allCategories = getAllCategories();
  static List<CategoryDM> categories = getCategories();

  static List<CategoryDM> getAllCategories() => [
        CategoryDM(
          id: '0',
          name: "All",
          imagePath: AssetsManager.football,
          iconName: Icons.all_inbox_outlined,
        ),
        CategoryDM(
          id: '1',
          name: "Sports",
          imagePath: AssetsManager.football,
          iconName: Icons.sports,
        ),
        CategoryDM(
          id: '2',
          name: "BirthDay",
          imagePath: AssetsManager.football,
          iconName: Icons.cake_outlined,
        ),
        CategoryDM(
          id: '3',
          name: "Meeting",
          imagePath: AssetsManager.football,
          iconName: Icons.meeting_room_outlined,
        ),
        CategoryDM(
          id: '4',
          name: "Gaming",
          imagePath: AssetsManager.football,
          iconName: Icons.games_outlined,
        ),
        CategoryDM(
          id: '5',
          name: "Eating",
          imagePath: AssetsManager.football,
          iconName: Icons.food_bank_outlined,
        ),
        CategoryDM(
          id: '6',
          name: "Holiday",
          imagePath: AssetsManager.football,
          iconName: Icons.holiday_village_outlined,
        ),
        CategoryDM(
          id: '7',
          name: "Book Club",
          imagePath: AssetsManager.football,
          iconName: Icons.book_online_outlined,
        ),
        CategoryDM(
          id: '8',
          name: "work Shop",
          imagePath: AssetsManager.football,
          iconName: Icons.workspaces_outline,
        ),
        CategoryDM(
          id: '9',
          name: "Exhibition ",
          imagePath: AssetsManager.football,
          iconName: Icons.next_plan_outlined,
        ),
      ];

  static List<CategoryDM> getCategories() => [
        CategoryDM(
          id: '1',
          name: "Sports",
          imagePath: AssetsManager.football,
          iconName: Icons.sports,
        ),
        CategoryDM(
          id: '2',
          name: "BirthDay",
          imagePath: AssetsManager.football,
          iconName: Icons.cake_outlined,
        ),
        CategoryDM(
          id: '3',
          name: "Meeting",
          imagePath: AssetsManager.football,
          iconName: Icons.meeting_room_outlined,
        ),
        CategoryDM(
          id: '4',
          name: "Gaming",
          imagePath: AssetsManager.football,
          iconName: Icons.games_outlined,
        ),
        CategoryDM(
          id: '5',
          name: "Eating",
          imagePath: AssetsManager.football,
          iconName: Icons.food_bank_outlined,
        ),
        CategoryDM(
          id: '6',
          name: "Holiday",
          imagePath: AssetsManager.football,
          iconName: Icons.holiday_village_outlined,
        ),
        CategoryDM(
          id: '7',
          name: "Book Club",
          imagePath: AssetsManager.football,
          iconName: Icons.book_online_outlined,
        ),
        CategoryDM(
          id: '8',
          name: "work Shop",
          imagePath: AssetsManager.football,
          iconName: Icons.workspaces_outline,
        ),
        CategoryDM(
          id: '9',
          name: "Exhibition ",
          imagePath: AssetsManager.football,
          iconName: Icons.next_plan_outlined,
        ),
      ];
}
