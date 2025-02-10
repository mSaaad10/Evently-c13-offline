class UserDM {
  static UserDM? currentUser;
  static const String collectionName = "Users";
  String id;
  String userName;

  String email;
  List<String>? favouriteEventIds;

  UserDM({
    required this.id,
    required this.userName,
    required this.email,
    this.favouriteEventIds,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_id": id,
      "user_name": userName,
      "email": email,
      "favourite_events_ids": favouriteEventIds,
    };
  }

  UserDM.fromJson(Map<String, dynamic> json)
      : this(
    id: json["user_id"],
    userName: json["user_name"],
    email: json["email"],
    favouriteEventIds: json["favourite_events_ids"],
  );
}
