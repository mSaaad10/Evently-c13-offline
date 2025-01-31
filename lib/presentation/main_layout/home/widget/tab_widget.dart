import 'package:evently_c13_offline/model/category_DM.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {super.key,
      required this.categoryDM,
      required this.isSelected,
      required this.selectedBgColor,
      required this.unSelectedBgColor,
      required this.selectedContentColor,
      required this.unSelectedContentColor});

  final CategoryDM categoryDM;
  final bool isSelected;
  final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color selectedContentColor;
  final Color unSelectedContentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? selectedBgColor : unSelectedBgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: selectedBgColor)),
      child: Row(
        children: [
          Icon(categoryDM.iconName,
              color:
                  isSelected ? selectedContentColor : unSelectedContentColor),
          SizedBox(
            width: 8,
          ),
          Text(
            categoryDM.name,
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    isSelected ? selectedContentColor : unSelectedContentColor),
          ),
        ],
      ),
    );
  }
}
