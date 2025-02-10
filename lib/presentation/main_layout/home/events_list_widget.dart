import 'package:evently_c13_offline/firebase_helpers/firestore/firestore_helpers.dart';
import 'package:evently_c13_offline/model/eventDM.dart';
import 'package:evently_c13_offline/presentation/main_layout/home/widget/event_card.dart';
import 'package:flutter/material.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStoreHelpers.getEventsFromFireStoreByCategory(categoryName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        List<EventDM> events = snapshot.data ?? [];
        return Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => EventCard(eventDM: events[index]),
          itemCount: events.length,
        ));
      },
    );
  }
}
