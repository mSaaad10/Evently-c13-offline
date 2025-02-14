class UserDM {
  static UserDM? currentUser;
  static const String collectionName = "Users";
  late String id;
  late String userName;

  late String email;
  late List<String> favouriteEventIds;

  UserDM({
    required this.id,
    required this.userName,
    required this.email,
  }) {
    favouriteEventIds = [];
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": id,
      "user_name": userName,
      "email": email,
      "favourite_events_ids": favouriteEventIds,
    };
  }

  UserDM.fromJson(Map<String, dynamic> json) {
    id = json["user_id"];
    userName = json["user_name"];
    email = json["email"];
    favouriteEventIds = (json["favourite_events_ids"] as List<dynamic>)
        .map(
          (item) => item.toString(),
        )
        .toList();
  }

  bool isFavEvent(String eventId) {
    return favouriteEventIds.contains(eventId);
  }
//     : this(
//   id: json["user_id"],
//   userName: json["user_name"],
//   email: json["email"],
//   favouriteEventIds: (json["favourite_events_ids"] as List<dynamic>).map((item) => item.toString(),).toList(),
// );
}
