import 'package:cloud_firestore/cloud_firestore.dart';
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
}
