import 'package:evently_c13_offline/core/assets_manager.dart';
import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:evently_c13_offline/model/user_DM.dart';
import 'package:evently_c13_offline/providers/lang_provider.dart';
import 'package:evently_c13_offline/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedLang = "English";
  String selectedTheme = "Light";

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
          color: ColorsManager.primary,
          borderRadius:
          BorderRadius.only(bottomLeft: Radius.circular(64))),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(AssetsManager.profile),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                  children: [
                  Text(UserDM.currentUser!.userName,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge),
              Text(
                  UserDM.currentUser!.email, ,
                  style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      )
      ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Language",
    style: Theme.of(context).textTheme.headlineMedium,
    ),
    SizedBox(
    height: 16,
    ),
    Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border:
    Border.all(width: 1, color: ColorsManager.primary)),
    child: Row(
    children: [
    Text(
    selectedLang,
    style: Theme.of(context).textTheme.labelMedium,
    ),
    Spacer(),
    SizedBox(
    height: 30,
    child: DropdownButton<String>(
    dropdownColor: ColorsManager.white,
    style: GoogleFonts.inter(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400),
    elevation: 0,
    underline: SizedBox(),
    items:
    <String>["English", "عربي"].map((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    onChanged: (newLang) {
    selectedLang = newLang!;
    langProvider.changeAppLang(selectedLang == "English" ? "en": "ar");
    },
    ),
    )
    ],
    )),
    SizedBox(
    height: 14,
    ),
    Text(
    "Theme",
    style: Theme.of(context).textTheme.headlineMedium,
    ),
    SizedBox(
    height: 16,
    ),
    Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border:
    Border.all(width: 1, color: ColorsManager.primary)),
    child: Row(
    children: [
    Text(
    selectedTheme,
    style: Theme.of(context).textTheme.labelMedium,
    ),
    Spacer(),
    SizedBox(
    height: 30,
    child: DropdownButton<String>(
    dropdownColor: ColorsManager.white,
    style: GoogleFonts.inter(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400),
    elevation: 0,
    underline: SizedBox(),
    items:
    <String>["Light", "Dark"].map((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    onChanged: (newTheme) {
    selectedTheme = newTheme!;
    selectedTheme == "Light" ?
    myProvider.changeApplicationTheme(ThemeMode.light) : myProvider.changeApplicationTheme(ThemeMode.dark);
    },
    ),
    )
    ],
    )),
    SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
    MaterialButton(
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16)),
    color: ColorsManager.red,
    onPressed: () {},
    child: Row(
    children: [
    Icon(
    Icons.logout,
    color: Colors.white,
    ),
    SizedBox(
    width: 8,
    ),
    Text(
    'Logout',
    style: GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white),
    ),
    ],
    )),
    ],
    ),
    ),
    ],
    ),
    );
  }
}
