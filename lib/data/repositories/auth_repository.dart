import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<bool> isSignIn();
  Future<void> signOut();
  Stream<FirebaseUser> onAuthStateChanged();
  Future<void> verifyPhone(
      String phoneNumber,
      PhoneVerificationCompleted completed,
      PhoneVerificationFailed failed,
      PhoneCodeSent sent,
      PhoneCodeAutoRetrievalTimeout timeout);
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;

  AuthRepositoryImpl({FirebaseAuth firebaseAuth})
      : _auth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<bool> isSignIn() async {
    throw UnimplementedError;
  }

  @override
  Future<void> signOut() async => await _auth.signOut();

  @override
  Future<void> verifyPhone(
      String phoneNumber,
      PhoneVerificationCompleted completed,
      PhoneVerificationFailed failed,
      PhoneCodeSent sent,
      PhoneCodeAutoRetrievalTimeout timeout) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(minutes: 1),
      verificationCompleted: completed,
      verificationFailed: failed,
      codeSent: sent,
      codeAutoRetrievalTimeout: timeout,
    );
  }

  @override
  Stream<FirebaseUser> onAuthStateChanged() {
    return _auth.onAuthStateChanged;
  }

  a() {
    onAuthStateChanged().listen((user) {
      if (user == null) {
      } else {}
    });
  }
}
