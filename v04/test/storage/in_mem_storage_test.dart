import 'package:test/test.dart';
import 'package:v04/models/hero_model.dart';
import 'package:v04/storage/in_mem_storage.dart';

final HeroModel bertil = HeroModel.simpelHeroModel("Bertil", 5, "good");
final HeroModel nisse = HeroModel.simpelHeroModel("Nisse", 1, "bad");
final HeroModel kalle = HeroModel.simpelHeroModel("Kalle", 99, "bad");

void main() {

  test('isHeroPresentEmpty', () {
    InMemStorage inMemStorage = InMemStorage();
    bool heroPresent = inMemStorage.isHeroPresent(1);
    expect(heroPresent, false);
  });

  test('isHeroPresentNotExist', () {
    InMemStorage inMemStorage = createInMemStorageWithHeroes();
    bool heroPresent = inMemStorage.isHeroPresent(66);
    expect(heroPresent, false);
  });

  test('isHeroPresent', () {
    InMemStorage inMemStorage = createInMemStorageWithHeroes();
    bool heroPresent = inMemStorage.isHeroPresent(bertil.id);
    expect(heroPresent, true);
  });

  test('getGoodHeroes', () {
    InMemStorage inMemStorage = createInMemStorageWithHeroes();
    List<HeroModel> goodHeroes = inMemStorage.getGoodHeroes();
    expect(goodHeroes.length, 1);
  });

  test('getBadHeroes', () {
    InMemStorage inMemStorage = createInMemStorageWithHeroes();
    List<HeroModel> badHeroes = inMemStorage.getBadHeroes();
    expect(badHeroes.length, 2);
  });

}

InMemStorage createInMemStorageWithHeroes() {
  InMemStorage inMemStorage = InMemStorage();
  inMemStorage.add(bertil);
  inMemStorage.add(nisse);
  inMemStorage.add(kalle);

  return inMemStorage;
}
