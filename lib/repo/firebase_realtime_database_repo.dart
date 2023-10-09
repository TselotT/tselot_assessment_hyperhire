import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDatabaseRepo {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Stream<DatabaseEvent> listenToData() {
    DatabaseReference a = FirebaseDatabase.instance.ref('data');
    return a.onValue;
  }
}
