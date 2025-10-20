import 'package:firebase_auth/firebase_auth.dart';
import 'package:manga_app/firebase/firestore_service.dart';
import 'package:manga_app/models/user/user_model.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestore = FirestoreService();

  /// REGISTRA UN NUOVO UTENTE
  Future<UserModel?> registerWithEmail({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (kDebugMode) {
        print(result);
      }

      final user = UserModel(
        id: result.user?.uid,
        username: username,
        email: email,
        password: password,
        profilePicure: "",
        readMangas: [],
      );

      // Salva i dati utente nel Firestore
      _firestore.saveCollectionDocument('users', user.copyWith(password: password.replaceAll(password, '*' * password.length)).toJson());

      return user;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Errore di registrazione: ${e.code}');
      }
      rethrow;
    }
  }

  /// LOGIN UTENTE
  Future<UserModel?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        id: result.user?.uid,
        username: "",
        email: email,
        password: password,
        profilePicure: "",
        readMangas: [],
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Errore di login: ${e.code}');
      }
      rethrow;
    }
  }

  /// ELIMINA UTENTE
  Future<void> deleteUser() async {
    try {
      final currentUser = _auth.currentUser;

      if (currentUser != null) {
        _firestore.deleteCollectionDocument('users', currentUser.uid);
        await currentUser.delete();
      } else {
        throw FirebaseAuthException(
          code: 'no-current-user',
          message: 'Nessun utente attualmente autenticato.',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Errore durante l\'eliminazione dell\'utente: ${e.code}');
      }
      rethrow;
    }
  }

  /// LOGOUT UTENTE
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// OTTIENE ID UTENTE CORRENTE
  String? getCurrentUser() {
    return _auth.currentUser?.uid;
  }

  /// STREAM PER MONITORARE AUTENTICAZIONE
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
