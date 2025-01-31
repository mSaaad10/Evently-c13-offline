import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:evently_c13_offline/model/category_DM.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {super.key, required this.categoryDM, required this.isSelected});

  final CategoryDM categoryDM;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: ColorsManager.white)),
      child: Row(
        children: [
          Icon(categoryDM.iconName,
              color: isSelected ? ColorsManager.primary : ColorsManager.white),
          SizedBox(
            width: 8,
          ),
          Text(
            categoryDM.name,
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    isSelected ? ColorsManager.primary : ColorsManager.white),
          ),
        ],
      ),
    );
  }
}
