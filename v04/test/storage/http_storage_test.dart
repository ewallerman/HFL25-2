import 'package:test/test.dart';
import 'package:v04/models/hero_model.dart';
import 'package:v04/secrets/env_secret_fetcher.dart';
import 'package:v04/storage/http_storage.dart';

void main() {

  // Test can only run with API_KEY
  /*
  test('searchBatman', () async {
    HttpStorage httpStorage = HttpStorage(HttpStorage.defaultUrl, EnvSecretFetcher.fetchApiKey());

    List<HeroModel> heroes = await httpStorage.searchHero('Batman');

    expect(heroes.length, 3);
  });
  */
}