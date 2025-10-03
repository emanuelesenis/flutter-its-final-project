import 'package:firebase_auth/firebase_auth.dart';
import 'package:manga_app/firebase/firestore_service.dart';
import 'package:manga_app/models/user/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestore = FirestoreService();

  /// REGISTRA UN NUOVO UTENTE
  Future<UserModel?> registerWithEmail({required UserModel user}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      user = user.copyWith(id: result.user?.uid);

      // Salva i dati utente nel Firestore
      _firestore.saveCollectionDocument('users', user.toJson());

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
      print('Errore durante l\'eliminazione dell\'utente: ${e.code}');
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
