import 'package:v04/managers/hero_data_managing.dart';
import 'package:v04/models/hero_model.dart';
import 'package:v04/storage/cached_storage.dart';
import 'package:v04/storage/local_storage.dart';
import 'package:v04/storage/remote_storage.dart';

class HeroDataManager implements HeroDataManaging {

  final RemoteStorage _remoteStorage;
  final LocalStorage _localStorage;
  final CachedStorage _cachedHeroes;

  HeroDataManager(this._remoteStorage, this._localStorage, this._cachedHeroes);

  @override
  void add(HeroModel hero) {
    _cachedHeroes.add(hero);
    _localStorage.writeHero(hero);
  }

  @override
  int loadHeroes() {
    _cachedHeroes.addAll(_localStorage.readHeroes());
    return _cachedHeroes.getHighestId();
  }

  @override
  void saveHeroes() { // ToDo maybe remove
    _localStorage.writeHeroes(_cachedHeroes.getHeroes());
  }

  @override
  void deleteHero(int id) {
    _cachedHeroes.deleteHero(id);
    _localStorage.deleteHero(id);
  }

  @override
  void deleteAllHeroes() {
    _cachedHeroes.deleteAllHeroes();
    _localStorage.deleteAllHeroes();
  }

  @override
  List<HeroModel> getHeroes() {
    return _cachedHeroes.getHeroes();
  }

  @override
  List<HeroModel> getGoodHeroes() {
    return _cachedHeroes.getGoodHeroes();
  }

  @override
  List<HeroModel> getBadHeroes() {
    return _cachedHeroes.getBadHeroes();
  }

  @override
  List<HeroModel> getTopHeroes(int nrOfTopHeroes) {
    return _cachedHeroes.getTopHeroes(nrOfTopHeroes);
  }

  @override
  List<HeroModel> searchHero(String search) {
    return _cachedHeroes.searchHero(search);
  }

  @override
  Future<List<HeroModel>> remoteSearchAndLoadHeroes(String search) async {
    List<HeroModel> remoteFoundHeroes = await _remoteStorage.searchHero(search);
    List<HeroModel> heroesToAdd = [];

    for (HeroModel hero in remoteFoundHeroes) {
      if (!_cachedHeroes.isHeroPresent(hero.id)) {
        heroesToAdd.add(hero);
      }
    }

    if (heroesToAdd.isNotEmpty) {
      _cachedHeroes.addAll(heroesToAdd);
      _localStorage.writeHeroes(heroesToAdd);
    }

    return Future.value(heroesToAdd);
  }

}