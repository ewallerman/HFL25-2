import 'package:v04/models/hero_model.dart';

abstract class HeroDataManaging {

  void add(HeroModel hero);

  void loadHero();

  void saveHero();

  List<HeroModel> getHeroList();

  List<HeroModel> getTopHeroes(nrOfTopHeroes);

  List<HeroModel> searchHero(String search);
}