import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manga_app/models/user/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// SALVA DOCUMENTO NEL FIRESTORE
  Future<void> saveCollectionDocument(
    String collectionName,
    Map<String, dynamic> json,
  ) async {
    await _firestore.collection(collectionName).doc(json["id"]).set(json);
  }

  /// OTTIENE DOCUMENTO DAL FIRESTORE
  Future<UserModel> getCollectionDocument(
    String collectionName,
    String id,
  ) async {
    return await _firestore
        .collection(collectionName)
        .doc(id)
        .get()
        .then((json) => UserModel.fromJson(json.data()!));
  }

  /// CANCELLA DOCUMENTO DAL FIRESOTRE
  Future<void> deleteCollectionDocument(
    String collectionName,
    String id,
  ) async {
    await _firestore.collection(collectionName).doc(id).delete();
  }
}
