import 'package:v04/herodex_3000.dart';
import 'package:v04/managers/hero_data_manager.dart';
import 'package:v04/managers/hero_data_managing.dart';
import 'package:v04/secrets/env_secret_fetcher.dart';
import 'package:v04/storage/cached_storage.dart';
import 'package:v04/storage/file_storage.dart';
import 'package:v04/storage/http_storage.dart';
import 'package:v04/storage/in_mem_storage.dart';
import 'package:v04/storage/local_storage.dart';
import 'package:v04/storage/remote_storage.dart';

void main(List<String> arguments) async {
  await initApplicationWithDependencyInjection().run();
}

HeroDex3000 initApplicationWithDependencyInjection() {
  final String apiKey = EnvSecretFetcher.fetchApiKey();
  final url = HttpStorage.defaultUrl;

  final RemoteStorage remoteStorage = HttpStorage(url, apiKey);
  final LocalStorage localStorage = FileStorage('data');
  final CachedStorage cachedStorage = InMemStorage();
  final HeroDataManaging heroDataManager = HeroDataManager(remoteStorage, localStorage, cachedStorage);

  return HeroDex3000(heroDataManager);
}