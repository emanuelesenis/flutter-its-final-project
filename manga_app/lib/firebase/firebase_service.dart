import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manga_app/models/user/user_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// REGISTRA UN NUOVO UTENTE
  Future<UserModel?> registerWithEmail({required UserModel user}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      user = user.copyWith(id: result.user?.uid);

      // Salva i dati utente nel Firestore
      await _firestore.collection('users').doc(user.id).set(user.toJson());

      return user;
    } on FirebaseAuthException catch (e) {
      print('Errore di registrazione: ${e.code}');
      rethrow;
    }
  }

  /// LOGIN UTENTE
  Future<UserModel?> loginWithEmail({required UserModel user}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return user.copyWith(id: result.user?.uid);
    } on FirebaseAuthException catch (e) {
      print('Errore di login: ${e.code}');
      rethrow;
    }
  }

  /// LOGOUT UTENTE
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// OTTIENI ID UTENTE CORRENTE
  String? getCurrentUser() {
    return _auth.currentUser?.uid;
  }

  /// OTTIENI UTENTE DAL FIRESTORE
  Future<UserModel> getUserDetails(String uid) async {
    return await _firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((json) => UserModel.fromJson(json.data()!));
  }

  /// STREAM PER MONITORARE AUTENTICAZIONE
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
