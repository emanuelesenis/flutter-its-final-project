import 'package:get_it/get_it.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/api/search_api.dart';
import 'package:manga_app/firebase/firebase_auth_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MangaDexApi>(MangaDexApi());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<SearchApi>(SearchApi());
}
