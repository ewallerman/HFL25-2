
import 'hero.dart';

class HeroDex {

  List<Hero> heroes = [];

  void add(Hero hero) {
    heroes.add(hero);
    heroes.sort();
  }

  List<Hero> getHeroes() {
    return heroes;
  }

  List<Hero> getTopHeroes(nrOfTopHeroes) {
    List<Hero> result = [];
    Iterator<Hero> heroIterator = heroes.iterator;

    for (int i = 1; i <= nrOfTopHeroes; i++) {
      if (heroIterator.moveNext()) {
        result.add(heroIterator.current);
      }
    }

    return result;
  }

  List<Hero> search(String search) {
    return heroes.where((hero) => hero.name.toLowerCase().contains(search.toLowerCase())).toList();
  }
}