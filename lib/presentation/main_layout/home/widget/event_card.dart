import 'package:evently_c13_offline/core/assets_manager.dart';
import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:evently_c13_offline/core/utils/date_utils.dart';
import 'package:evently_c13_offline/firebase_helpers/firestore/firestore_helpers.dart';
import 'package:evently_c13_offline/model/eventDM.dart';
import 'package:evently_c13_offline/model/user_DM.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required, required this.eventDM});

//final CategoryDM? categoryDM;
  final EventDM eventDM;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late bool isFavourite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavourite = UserDM.currentUser!.isFavEvent(widget.eventDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(16)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AssetsManager.football),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Text(
                      "${widget.eventDM.eventDate.toDate().day}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      "${widget.eventDM.eventDate.toDate().toMonthName}",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorsManager.white),
                child: Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Text(
                      widget.eventDM.title,
                      style: Theme.of(context).textTheme.labelSmall,
                    )),
                    InkWell(
                        onTap: () {
                          isFavourite = !isFavourite;

                          if (isFavourite) {
                            addEventToFav();
                          } else {
                            removeEventFromFav();
                          }
                          setState(() {});
                        },
                        child: Icon(isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void addEventToFav() async {
    print(widget.eventDM.id);
    await FireStoreHelpers.addEventToFav(widget.eventDM.id);
  }

  void removeEventFromFav() async {
    await FireStoreHelpers.removeEventFromFav(widget.eventDM.id);
  }
}
