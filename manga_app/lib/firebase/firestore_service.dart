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

  /// AGGIORNA LA LISTA DEI PREFERITI SUL FIRESTORE
  Future<bool> updateFavouriteMangas(String userId, String mangaId) async {
    final user = _firestore.collection("users").doc(userId);
    final containsMangaId = await checkFavouriteMangas(userId, mangaId);
    if (containsMangaId) {
      await user.update({
        "favouriteMangas": FieldValue.arrayRemove([mangaId]),
      });
    } else {
      await user.update({
        "favouriteMangas": FieldValue.arrayUnion([mangaId]),
      });
    }
    return !containsMangaId;
  }

  // /// CONTROLLA SE IL MANGA E' NEI PREFERITI
  Future<bool> checkFavouriteMangas(String userId, String mangaId) async {
    final user = _firestore.collection("users").doc(userId);
    final snap = await user.get();
    final favouriteMangas = List.from(snap.get("favouriteMangas") ?? []);
    final containsMangaId = favouriteMangas.contains(mangaId);
    return containsMangaId;
  }
}
