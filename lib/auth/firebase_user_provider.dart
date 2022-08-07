import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TransferAppFirebaseUser {
  TransferAppFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TransferAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TransferAppFirebaseUser> transferAppFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TransferAppFirebaseUser>(
        (user) => currentUser = TransferAppFirebaseUser(user));
