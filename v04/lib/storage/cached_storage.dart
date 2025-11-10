import 'package:v04/models/hero_model.dart';

abstract class CachedStorage {

  void add(HeroModel hero);

  void addAll(List<HeroModel> heroes);

  bool isHeroPresent(int id);

  void deleteHero(int id);

  void deleteAllHeroes();

  List<HeroModel> getHeroes();

  List<HeroModel> getTopHeroes(int nrOfTopHeroes);

  List<HeroModel> searchHero(String search);

  List<HeroModel> getGoodHeroes();

  List<HeroModel> getBadHeroes();

  int getHighestId();
}