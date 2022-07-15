// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _firebaseInstance = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  Map<String, String> errorMessage = {
    "email": "",
    "password": "",
    "network": "",
  };

  // User State
  Stream<User?> authStateChanges() {
    FirebaseAuth _firebaseInstance = FirebaseAuth.instance;
    print(_firebaseInstance);
    return _firebaseInstance.userChanges();
  }

  // Current User
  Future<User?> currentUser() async {
    FirebaseAuth _firebaseInstance = FirebaseAuth.instance;
    return _firebaseInstance.currentUser;
  }

  // Sign Out
  Future<void> signOut() async {
    FirebaseAuth _firebaseInstance = FirebaseAuth.instance;
    return _firebaseInstance.signOut();
  }

  // Reset Password
  Future<Map<String, String>> forgotPassword(String email) async {
    try {
      await _firebaseInstance.sendPasswordResetEmail(email: email);
    } on PlatformException catch (error) {
      if (error.message ==
          "An internal error has occurred. [ Unable to resolve host \"www.googleapis.com\":No address associated with hostname ]") {
        errorMessage["network"] = "No internet connection. Try again!";
      }

      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage["email"] = "Invalid email";
          break;
        case "ERROR_NETWORK_REQUEST_FAILED":
          errorMessage["email"] = "No internet connection. Try again!";
          break;
      }
    }
    return errorMessage;
  }

  // Sign In With Email And Password
  Future<Map<String, String>> signIn(String email, String password) async {
    try {
      await _firebaseInstance.signInWithEmailAndPassword(
          email: email, password: password);
    } on PlatformException catch (error) {
      if (error.message ==
          "An internal error has occurred. [ Unable to resolve host \"www.googleapis.com\":No address associated with hostname ]") {
        errorMessage["network"] = "No internet connection. Try again!";
      }
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage["email"] = "Invalid email";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage["password"] = "Wrong password";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage["email"] = "Email not registered. Please sign up!";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage["email"] = "This user has been disabled";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage["email"] = "Too many requests. Try again later!";
          break;
        case "ERROR_NETWORK_REQUEST_FAILED":
          errorMessage["network"] = "No internet connection. Try again!";
          break;
      }
    }
    return errorMessage;
  }

  // Create User With Email And Password
  Future<Map<String, String>> signUp(String email, String password) async {
    try {
      await _firebaseInstance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        // Save User Information To Database
        _usersCollection.doc(user.user!.uid).set(
          {
            "email": user.user!.email,
            "uid": user.user!.uid,
          },
        );
      });
    } on PlatformException catch (error) {
      if (error.message ==
          "An internal error has occurred. [ Unable to resolve host \"www.googleapis.com\":No address associated with hostname ]") {
        errorMessage["network"] = "No internet connection. Try again!";

        switch (error.code) {
          case "ERROR_INVALID_EMAIL":
            errorMessage["email"] = "Invalid email";
            break;
          case "ERROR_WEAK_PASSWORD":
            errorMessage["email"] =
                "Password should be at least 6 characters long";
            break;
          case "ERROR_EMAIL_ALREADY_IN_USE":
            errorMessage["email"] = "Email already in use. Please log in!";
            break;
        }
      }
    }
    return errorMessage;
  }
}
