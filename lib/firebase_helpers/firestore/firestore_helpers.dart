import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c13_offline/model/category_DM.dart';
import 'package:evently_c13_offline/model/eventDM.dart';
import 'package:evently_c13_offline/model/user_DM.dart';

class FireStoreHelpers {
  static CollectionReference<UserDM> getUsersCollection() {
    FirebaseFirestore database = FirebaseFirestore.instance;
    var usersCollection =
        database.collection(UserDM.collectionName).withConverter<UserDM>(
              fromFirestore: (snapshot, options) =>
                  UserDM.fromJson(snapshot.data()!),
              toFirestore: (UserDM userDM, options) => userDM.toJson(),
            );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserDM userDM) {
    CollectionReference usersCollection = getUsersCollection();
    DocumentReference userDoc = usersCollection.doc(userDM.id);
    return userDoc.set(userDM);

    // // usersCollection.add(userDM.toJson());
    //  DocumentReference userDoc = usersCollection.doc(userDM.id);
    //  return userDoc.set(userDM.toJson());
    // usersCollection.add({
    //   "user_name": userName,
    //   "email": email,
    //   "favourite_events_ids": favouriteEventIds,
    // });

    /// this function create a doc with an auto generated id and add user
  }

  static Future<UserDM?> readUSerFromFireStore(String userId) async {
    var usersCollection = getUsersCollection();
    var userDoc = usersCollection.doc(userId);
    var userSnapshot = await userDoc.get();
    UserDM? userDM = userSnapshot.data();
    return userDM;
  }

  static Future<void> addEventToFireStore(EventDM eventDM) {
    CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection(EventDM.collectionName);
    var doc = eventsCollection.doc();
    eventDM.id = doc.id;
    return doc.set(eventDM.toJson());
    // return eventsCollection.add(eventDM.toJson()); /// create a new doc wih an auto generated id
  }

  static Future<List<EventDM>> getEventsFromFireStoreByCategory(
      String categoryName) async {
    CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection(EventDM.collectionName);
    var collectionSnapshot =
        await eventsCollection.where("category", isEqualTo: categoryName).get();
    var documents = collectionSnapshot.docs;
    List<EventDM> events = documents
        .map(
          (docSnapshot) =>
              EventDM.fromJson(docSnapshot.data() as Map<String, dynamic>),
        )
        .toList();
    return events;
  }

  static Stream<List<EventDM>> getEventsRealTimeUpdatesByCategory(
      String categoryName) {
    if (categoryName == CategoryDM.allCategories[0].name) {
      var eventsCollection =
          FirebaseFirestore.instance.collection(EventDM.collectionName);
      var collectionSnapshot = eventsCollection.snapshots();
      var eventsStream = collectionSnapshot.map(
        (querySnapshot) {
          var documents = querySnapshot.docs;
          var events = documents
              .map(
                (doc) => EventDM.fromJson(doc.data()),
              )
              .toList();
          return events;
        },
      );
      return eventsStream;
    } else {
      print('Ana da5alt el else');
      var eventsCollection =
          FirebaseFirestore.instance.collection(EventDM.collectionName);
      var collectionSnapshot = eventsCollection
          .where("category", isEqualTo: categoryName)
          .snapshots();
      var eventsStream = collectionSnapshot.map(
        (querySnapshot) {
          var documents = querySnapshot.docs;
          var events = documents
              .map(
                (doc) => EventDM.fromJson(doc.data()),
              )
              .toList();
          return events;
        },
      );
      return eventsStream;
    }
  }

  static Future<void> updateUser(UserDM userDM) {
    var usersCollection = getUsersCollection();
    var userDoc = usersCollection.doc(userDM.id);
    return userDoc.update(userDM.toJson());
  }

  static Future<void> addEventToFav(String eventId) {
    UserDM userDM = UserDM.currentUser!;

    userDM.favouriteEventIds.add(eventId);
    var user = getUsersCollection();
    var doc = user.doc(userDM.id);
    return doc.update(userDM.toJson());
  }

  static Future<void> removeEventFromFav(String eventId) {
    UserDM userDM = UserDM.currentUser!;
    userDM.favouriteEventIds.remove(eventId);
    // var usersCollection = getUsersCollection();
    // var doc = usersCollection.doc(userDM.id);
    // return doc.update(userDM.toJson());\
    return updateUser(userDM);
  }

  static Future<List<EventDM>> getFavEvents() async {
    var eventsCollection =
        FirebaseFirestore.instance.collection(EventDM.collectionName);
    var querySnapshot = await eventsCollection
        .where(FieldPath.documentId,
            whereIn: UserDM.currentUser!.favouriteEventIds)
        .get();
    var documents = querySnapshot.docs;
    var events = documents
        .map(
          (doc) => EventDM.fromJson(doc.data()),
        )
        .toList();
    return events;
  }
}
