import 'package:v04/models/hero_model.dart';
import 'package:v04/storage/cached_storage.dart';

class InMemStorage implements CachedStorage {

  final List<HeroModel> _cachedHeroes = [];

  @override
  void add(HeroModel hero) {
    _cachedHeroes.add(hero);
    _cachedHeroes.sort();
  }

  @override
  void addAll(List<HeroModel> heroes) {
    _cachedHeroes.addAll(heroes);
    _cachedHeroes.sort();
  }

  @override
  bool isHeroPresent(int id) {
    return _cachedHeroes.where((HeroModel hero) => hero.id == id).length == 1;
  }

  @override
  void deleteHero(int id) {
    _cachedHeroes.removeWhere((HeroModel hero) => hero.id == id);
  }

  @override
  void deleteAllHeroes() {
    _cachedHeroes.clear();
  }

  @override
  List<HeroModel> getHeroes() {
    return _cachedHeroes;
  }

  @override
  List<HeroModel> getTopHeroes(nrOfTopHeroes) {
    List<HeroModel> result = [];
    Iterator<HeroModel> heroIterator = _cachedHeroes.iterator;

    for (int i = 1; i <= nrOfTopHeroes; i++) {
      if (heroIterator.moveNext()) {
        result.add(heroIterator.current);
      }
    }

    return result;
  }

  @override
  List<HeroModel> searchHero(String search) {
    return _cachedHeroes.where((HeroModel hero) => hero.name.toLowerCase().contains(search.toLowerCase())).toList();
  }

  @override
  List<HeroModel> getGoodHeroes() {
    return _cachedHeroes.where((HeroModel hero) => hero.biography.alignment == Biography.good).toList();
  }

  @override
  List<HeroModel> getBadHeroes() {
    return _cachedHeroes.where((HeroModel hero) => hero.biography.alignment == Biography.bad).toList();
  }

  @override
  int getHighestId() {
    int highId = 0;

    for (HeroModel hero in _cachedHeroes) {
      if (hero.id > highId) {
        highId = hero.id;
      }
    }

    return highId;
  }

}