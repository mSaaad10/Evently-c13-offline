import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:evently_c13_offline/model/category_DM.dart';
import 'package:evently_c13_offline/presentation/main_layout/home/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var categories = CategoryDM.getCategories();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              color: ColorsManager.primary),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back ✨',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.white),
                ),
                Text('Muhammed Saad!',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.white)),
                SizedBox(
                  height: 16,
                ),
                DefaultTabController(
                  length: categories.length,
                  child: TabBar(
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {});
                      },
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.symmetric(horizontal: 10),
                      indicatorPadding: EdgeInsets.zero,
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: categories
                          .map(
                            (category) => TabWidget(
                                categoryDM: category,
                                isSelected: categories.indexOf(category) ==
                                    selectedIndex),
                          )
                          .toList()),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
