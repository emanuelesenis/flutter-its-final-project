import 'package:get_it/get_it.dart';
import 'package:manga_app/api/manga_api.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MangaDexApi>(MangaDexApi());
}
