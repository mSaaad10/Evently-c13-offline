import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:evently_c13_offline/core/widgets/tab_bar_widget.dart';
import 'package:evently_c13_offline/model/category_DM.dart';
import 'package:evently_c13_offline/model/eventDM.dart';
import 'package:evently_c13_offline/model/user_DM.dart';
import 'package:evently_c13_offline/presentation/main_layout/home/events_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late CategoryDM selectedCategory;

  List<EventDM> events = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategory = CategoryDM.allCategories[0];
  }

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
              color: Theme.of(context).primaryColor),
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
                Text(UserDM.currentUser!.userName,
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.white)),
                SizedBox(
                  height: 16,
                ),
                // DefaultTabController(
                //   length: CategoryDM.allCategories.length,
                //   child: TabBar(
                //       onTap: (index) {
                //         selectedIndex = index;
                //         print(selectedIndex);
                //         setState(() {});
                //       },
                //       tabAlignment: TabAlignment.start,
                //       labelPadding: EdgeInsets.symmetric(horizontal: 10),
                //       indicatorPadding: EdgeInsets.zero,
                //       isScrollable: true,
                //       indicatorColor: Colors.transparent,
                //       dividerColor: Colors.transparent,
                //       tabs: CategoryDM.allCategories
                //           .map(
                //             (category) => TabWidget(
                //                 selectedContentColor: ColorsManager.primary,
                //                 unSelectedContentColor: ColorsManager.white,
                //                 selectedBgColor: ColorsManager.white,
                //                 unSelectedBgColor: Colors.transparent,
                //                 categoryDM: category,
                //                 isSelected: CategoryDM.allCategories.indexOf(category) ==
                //                     selectedIndex),
                //           )
                //           .toList()),
                // ),
                TabBarWidget(
                  categories: CategoryDM.allCategories,
                  onTabClicked: onCategoryTabClicked,
                  selectedBg: ColorsManager.ofWhite,
                  unSelectedBg: Colors.transparent,
                  selectedContentColor: ColorsManager.primary,
                  unSelectedContentColor: ColorsManager.white,
                ),
              ],
            ),
          ),
        ),
        EventsListWidget(
          categoryName: selectedCategory.name,
        ),
        // Expanded(
        //     child: ListView.builder(
        //   itemBuilder: (context, index) => EventCard(eventDM: ,),
        //   itemCount: 10,
        // ))
      ],
    );
  }

  void onCategoryTabClicked(CategoryDM categoryDm) {
    selectedCategory = categoryDm;
    setState(() {});
  }
}
