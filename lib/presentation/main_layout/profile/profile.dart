import 'package:evently_c13_offline/core/assets_manager.dart';
import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Text("Muhammed Saad",
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(
                          "MuhammedSaad@gmail.com",
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
                          'عربي',
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
                            onChanged: (_) {},
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
                          'Light',
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
                            onChanged: (_) {},
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
