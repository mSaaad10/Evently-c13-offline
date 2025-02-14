import 'package:evently_c13_offline/model/category_DM.dart';
import 'package:evently_c13_offline/presentation/main_layout/home/widget/tab_widget.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final List<CategoryDM> categories;
  final Function(CategoryDM) onTabClicked;
  final Color selectedBg;
  final Color unSelectedBg;
  final Color selectedContentColor;
  final Color unSelectedContentColor;

  const TabBarWidget(
      {super.key,
      required this.categories,
      required this.onTabClicked,
      required this.selectedBg,
      required this.unSelectedBg,
      required this.selectedContentColor,
      required this.unSelectedContentColor});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedIndex = 0;

  //CategoryDM selectedCategory

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
          onTap: (index) {
            widget.onTabClicked(widget.categories[index]);
            selectedIndex = index;
            setState(() {});
          },
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.symmetric(horizontal: 10),
          indicatorPadding: EdgeInsets.zero,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          tabs: widget.categories
              .map(
                (category) => TabWidget(
                    selectedContentColor: widget.selectedContentColor,
                    unSelectedContentColor: widget.unSelectedContentColor,
                    selectedBgColor: widget.selectedBg,
                    unSelectedBgColor: widget.unSelectedBg,
                    categoryDM: category,
                    isSelected:
                        widget.categories.indexOf(category) == selectedIndex),
              )
              .toList()),
    );
  }
}
