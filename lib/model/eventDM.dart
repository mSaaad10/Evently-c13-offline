import 'package:cloud_firestore/cloud_firestore.dart';

class EventDM {
  static const String collectionName = 'Events';
  String id;
  String title;
  String description;
  Timestamp eventDate;
  Timestamp eventTime;

  String ownerId;
  String category;
  int? lat;
  int? lng;

  EventDM({
    this.id = '',
    required this.title,
    required this.description,
    required this.eventDate,
    required this.eventTime,
    required this.ownerId,
    required this.category,
    this.lat,
    this.lng,
  });

  /// assume -> object
  Map<String, dynamic> toJson() {
    return {
      "event_title": title,
      "event_description": description,
      "event_date": eventDate,
      "event_time": eventTime,
      "owner_id": ownerId,
      "category": category,
      "lat": lat,
      "lng": lng,
      "event_id": id,
    };
  }

  // create obj from EventDM
  EventDM.fromJson(Map<String, dynamic> json)
      : this(
    title: json["event_title"],
          description: json["event_description"],
          eventDate: json["event_date"],
          eventTime: json["event_time"],
          ownerId: json["category"],
          category: json["event_title"],
          lat: json["lat"],
          lng: json["lng"],
          id: json["event_id"],
        );
}
