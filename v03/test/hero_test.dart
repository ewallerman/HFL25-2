import 'package:test/test.dart';
import 'package:v03/hero.dart';

void main() {
  test('hero', () {
    Hero bertil = Hero("Bertil", 5, "good", "gravity");
    Hero nisse = Hero("Nisse", 1, "bad", "water");
    Hero kalle = Hero("Kalle", 99, "bad", "fire");
    List<Hero> heroes = [bertil, nisse, kalle];

    heroes.sort();
    Iterator<Hero> heroesIterator = heroes.iterator;

    expect(getNext(heroesIterator), kalle);
    expect(getNext(heroesIterator), bertil);
    expect(getNext(heroesIterator), nisse);
  });
}

Hero getNext(Iterator<Hero> heroesIterator) {
  heroesIterator.moveNext();

  return heroesIterator.current;
}