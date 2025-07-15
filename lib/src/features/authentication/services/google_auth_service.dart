import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String? name;
String? email;
String? imageUrl;

Future<String?> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication? googleSignInAuthentication =
  await googleSignInAccount?.authentication;

  final AuthCredential authCredential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication?.accessToken,
    idToken: googleSignInAuthentication?.idToken,
  );

  final UserCredential userCredential =
  await firebaseAuth.signInWithCredential(authCredential);
  final User? user = userCredential.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // Only taking the first part of the name, i.e., First Name
    if (name!.contains(" ")) {
      name = name?.substring(0, name?.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User? currentUser = firebaseAuth.currentUser;
    assert(user.uid == currentUser?.uid);

    if (kDebugMode) {
      print('signInWithGoogle succeeded: $user');
    }
    return '$user';
  }
  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  if (kDebugMode) {
    print("User Signed Out");
  }
}