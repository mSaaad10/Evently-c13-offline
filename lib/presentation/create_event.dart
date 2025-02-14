import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:evently_c13_offline/core/dialog_utils.dart';
import 'package:evently_c13_offline/core/utils/date_utils.dart';
import 'package:evently_c13_offline/core/widgets/custom_elvated_button.dart';
import 'package:evently_c13_offline/core/widgets/custom_text_form_field.dart';
import 'package:evently_c13_offline/core/widgets/tab_bar_widget.dart';
import 'package:evently_c13_offline/firebase_helpers/firestore/firestore_helpers.dart';
import 'package:evently_c13_offline/model/category_DM.dart';
import 'package:evently_c13_offline/model/eventDM.dart';
import 'package:evently_c13_offline/model/user_DM.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedIndex = 0;
  late TextEditingController titleController;

  late TextEditingController descriptionController;
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  DateTime finalTime = DateTime.now();
  late CategoryDM selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategory = CategoryDM.categories[0];
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  width: double.infinity,
                  height: 203,
                  decoration: BoxDecoration(
                    color: ColorsManager.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(selectedCategory.imagePath)),
              SizedBox(
                height: 8,
              ),
              // DefaultTabController(
              //   length: CategoryDM.categories.length,
              //   child: TabBar(
              //       isScrollable: true,
              //       indicatorColor: Colors.transparent,
              //       dividerColor: Colors.transparent,
              //       tabAlignment: TabAlignment.start,
              //       labelPadding: EdgeInsets.symmetric(horizontal: 6),
              //       onTap: (index) {
              //         selectedIndex = index;
              //         setState(() {});
              //       },
              //       tabs: CategoryDM.categories
              //           .map(
              //             (category) => TabWidget(
              //             selectedContentColor: ColorsManager.white,
              //             unSelectedContentColor: ColorsManager.primary,
              //             selectedBgColor: ColorsManager.primary,
              //             unSelectedBgColor: Colors.transparent,
              //             categoryDM: category,
              //             isSelected:
              //             CategoryDM.categories.indexOf(category) ==
              //                 selectedIndex),
              //       )
              //           .toList()),
              // ),
              TabBarWidget(
                categories: CategoryDM.categories,
                onTabClicked: onCategoryTabClicked,
                selectedBg: ColorsManager.primary,
                unSelectedBg: Colors.transparent,
                selectedContentColor: ColorsManager.white,
                unSelectedContentColor: ColorsManager.primary,
              ),
              Text(
                "Title",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  hintText: "Event title",
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  controller: titleController),
              SizedBox(
                height: 16,
              ),
              Text(
                "Description",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  numberOfLines: 4,
                  hintText: "Event description",
                  controller: descriptionController),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "${pickedDate.toDateFormat}",
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
                  InkWell(
                    onTap: () {
                      chooseEventDate();
                    },
                    child: Text(
                      "Choose Date",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    pickedTime.toFormattedTime,
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
                  InkWell(
                    onTap: () {
                      chooseEventTime();
                    },
                    child: Text(
                      "Choose Time",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Location",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 2, color: ColorsManager.primary)),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorsManager.primary),
                        child: Icon(
                          Icons.location_searching,
                          color: ColorsManager.white,
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Text(
                          "Choose Event Location",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.primary,
                      size: 24,
                    )
                  ],
                ), // MaterialButton(
              ),
              SizedBox(
                height: 16,
              ),
              CustomElevatedButton(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  onPress: () {
                    createEvent();
                  },
                  buttonText: 'Add Event')
            ],
          ),
        ),
      ),
    );
  }

  onCategoryTabClicked(CategoryDM categoryDM) {
    selectedCategory = categoryDM;
    setState(() {});
  }

  void chooseEventDate() async {
    pickedDate = await showDatePicker(
            context: context,
            initialDate: pickedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365))) ??
        pickedDate;
    setState(() {});
  }

  void chooseEventTime() async {
    pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            pickedTime;

    finalTime = finalTime.copyWith(
      hour: pickedTime.hour,
      minute: pickedTime.minute,
    );

    setState(() {});
  }

  void createEvent() async {
    EventDM eventDM = EventDM(
        title: titleController.text,
        description: descriptionController.text,
        eventDate: Timestamp.fromMillisecondsSinceEpoch(
            pickedDate.millisecondsSinceEpoch),
        eventTime: Timestamp.fromMillisecondsSinceEpoch(
            finalTime.millisecondsSinceEpoch),
        ownerId: UserDM.currentUser!.id,
        // ??
        category: selectedCategory.name);
    DialogUtils.showLoadingDialog(context);
    await FireStoreHelpers.addEventToFireStore(eventDM);
    DialogUtils.hideDialog(context);
    Navigator.pop(context);
  }
}
