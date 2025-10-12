import 'dart:io';

import 'hero.dart';
import 'herodex.dart';
import 'util.dart';

class HeroDex3000 {

  int nrOfTopHeroes = 3;
  HeroDex heroes = HeroDex();

  void run() {
    bool continueRunning;

    do {
      printAlternatives();
      continueRunning = processAlternatives();
    } while (continueRunning);
  }

  void printAlternatives() {
    print("\n-- Alternativs ---\n");
    print("1. Add Hero.");
    print("2. List Heroes.");
    print("3. List top $nrOfTopHeroes Heroes.");
    print("4. Set nr of top Heroes list.");
    print("5. Search Heroes.");
    print("6. Exit.");
  }

  bool processAlternatives() {
    Alternative alt = selectAlternative();

    switch (alt) {
      case Alternative.add:
        addHero();
      case Alternative.list:
        listHeroes();
      case Alternative.listTop:
        listTopHeroes();
      case Alternative.setTopList:
        setNrOfTopHeroesList();
      case Alternative.search:
        searchHeroes();
      case Alternative.exit:
        return false;
    }

    return true;
  }

  Alternative selectAlternative() {
    while (true) {
      print("\nChoice: ");
      String? readArg = stdin.readLineSync();

      if (readArg != null) {
        int? alternativeId = int.tryParse(readArg);

        if (alternativeId != null && Alternative.validAlternative(alternativeId)) {
          return Alternative.decode(alternativeId);
        }
      }

      print("Incorrect argument, please try again!");
    }
  }

  void addHero() {
    print("");
    String name = Util.readString("Name: ");
    int strength = Util.readPositiveInt("Strength: ");
    String alignment = Util.readSpecificString("Alignment(good/bad): ", ["good", "bad"]);
    String? specialPower = Util.readOptionalString("SpecialPower(not mandatory): ");
    Hero hero = Hero(name, strength, alignment, specialPower);
    heroes.add(hero);
  }

  void listHeroes() {
    print("\n-- List Heroes --");
    printHeroes(heroes.getHeroes());
  }

  void listTopHeroes() {
    print("\n-- List Top $nrOfTopHeroes Heroes --");
    printHeroes(heroes.getTopHeroes(nrOfTopHeroes));
  }

  void setNrOfTopHeroesList() {
    print("\n-- Set nr of top heroes List --");
    nrOfTopHeroes = Util.readPositiveIntWithMinValue("NrOfTopHeroes: ", 1);
  }

  void searchHeroes() {
    print("\n-- Search Heroes --");
    String search = Util.readString("\nSearch: ");
    List<Hero> searchResult = heroes.search(search);

    if (searchResult.isEmpty) {
      print("\nNo Heroes found.");
    } else {
      printHeroes(searchResult);
    }
  }

  static void printHeroes(List<Hero> heroesList) {
    for (Hero hero in heroesList) {
      hero.printHero();
    }
  }
}

enum Alternative {

  add, list, listTop, setTopList, search, exit;

  static Alternative decode(int alternativeId) {
    return Alternative.values[alternativeId - 1];
  }

  static bool validAlternative(int alternativeId) {
    return alternativeId >= 1 && alternativeId <= Alternative.values.length;
  }
}