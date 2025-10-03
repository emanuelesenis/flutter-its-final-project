import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// REGISTRA UN NUOVO UTENTE
  Future<User?> registerWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      // Salva i dati utente nel Firestore
      await _firestore.collection('users').doc(user!.uid).set({
        'uid': user.uid,
        'email': email,
        'fullName': fullName,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return user;
    } on FirebaseAuthException catch (e) {
      print('Errore di registrazione: ${e.code}');
      rethrow;
    }
  }

  /// LOGIN UTENTE
  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      print('Errore di login: ${e.code}');
      rethrow;
    }
  }

  /// LOGOUT UTENTE
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// OTTIENI UTENTE CORRENTE
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  /// OTTIENI I DETTAGLI DELL'UTENTE DAL FIRESTORE
  Future<DocumentSnapshot> getUserDetails(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }

  /// STREAM PER MONITORARE AUTENTICAZIONE
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
