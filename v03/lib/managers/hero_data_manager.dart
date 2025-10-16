import 'dart:io';

import 'package:v03/models/hero_model.dart';

import 'hero_data_managing.dart';

class HeroDataManager implements HeroDataManaging {

  static String defaultDataFile = "data.json";
  String dataFile = defaultDataFile;
  bool loaded = false;

  List<HeroModel> heroes = [];

  void add(HeroModel hero) {
    heroes.add(hero);
    heroes.sort();
  }

  void loadHero() async {
    print("loadHero ..");
  }

  void saveHero() {
    print("saveHero ..");
  }

  List<HeroModel> getHeroList() {
    return heroes;
  }

  List<HeroModel> getTopHeroes(nrOfTopHeroes) {
    List<HeroModel> result = [];
    Iterator<HeroModel> heroIterator = heroes.iterator;

    for (int i = 1; i <= nrOfTopHeroes; i++) {
      if (heroIterator.moveNext()) {
        result.add(heroIterator.current);
      }
    }

    return result;
  }

  List<HeroModel> searchHero(String search) {
    return heroes.where((hero) => hero.name.toLowerCase().contains(search.toLowerCase())).toList();
  }

}