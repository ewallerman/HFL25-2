import 'package:v04/models/hero_model.dart';

abstract class HeroDataManaging {

  void add(HeroModel hero);

  int loadHeroes();

  void saveHeroes();

  void deleteHero(int id);

  void deleteAllHeroes();

  HeroModel? getHero(int id);

  List<HeroModel> getHeroes();

  List<HeroModel> getGoodHeroes();

  List<HeroModel> getBadHeroes();

  List<HeroModel> getTopHeroes(int nrOfTopHeroes);

  List<HeroModel> searchHero(String search);

  Future<List<HeroModel>> remoteSearchAndLoadHeroes(String search);
}