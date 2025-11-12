import 'dart:io';

import 'package:v04/managers/hero_data_managing.dart';
import 'package:v04/models/hero_model.dart';
import 'package:v04/util.dart';

class HeroDex3000 {

  int _nrOfTopHeroes = 3;
  final HeroDataManaging _heroes;

  HeroDex3000(this._heroes);

  Future<void> run() async {
    int highestId = _heroes.loadHeroes();
    HeroModel.idFactory.setIdCounterIfHigher(highestId);
    bool continueRunning = true;

    do {
      try {
        printAlternatives();
        continueRunning = await processAlternatives();
      } catch (e) {
        print("\n*** Error in execution ***");
        print(e);
      }
    } while (continueRunning);
  }

  void printAlternatives() {
    print("\n-- Alternativs ---\n");

    for (Alternative alternative in Alternative.values) {
      print(alternative.getLabel());
    }
  }

  Future<bool> processAlternatives() async {
    Alternative alt = selectAlternative();

    switch (alt) {
      case Alternative.add: addHero();
      case Alternative.printHero: printHero();
      case Alternative.delete: deleteHero();
      case Alternative.deleteAll: deleteAllHeroes();
      case Alternative.list: listHeroes();
      case Alternative.listGood: listGoodHeroes();
      case Alternative.listBad: listBadHeroes();
      case Alternative.listTop: listTopHeroes();
      case Alternative.setTopList: setNrOfTopHeroesList();
      case Alternative.search: searchHeroes();
      case Alternative.remoteSearchAndLoad: await remoteSearchAndLoadHeroes();
      case Alternative.exit: return Future.value(false);
    }

    return Future.value(true);
  }

  Alternative selectAlternative() {
    while (true) {
      stdout.write("\nChoice: ");
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
    print("\n-- Add Hero --");
    String name = Util.readString("Name: ");
    int strength = Util.readPositiveInt("Strength: ");
    String alignment = Util.readSpecificString("Alignment(${Biography.good}/${Biography.bad}): ", [Biography.good, Biography.bad]);
    HeroModel hero = HeroModel.simpelHeroModel(name, strength, alignment);
    _heroes.add(hero);
  }

  void printHero() {
    print("\n-- Print Hero --");
    int id = Util.readPositiveInt("Id: ");
    HeroModel? hero = _heroes.getHero(id);

    if (hero == null) {
      print("\nNo hero for id: $id found");
    } else {
      hero.prettyPrintHero();
    }
  }

  void deleteHero() {
    print("\n-- Delete Hero --");
    int id = Util.readPositiveInt("Id: ");
    _heroes.deleteHero(id);
  }

  void deleteAllHeroes() {
    print("\n-- Delete all Heroes --");
    _heroes.deleteAllHeroes();
  }

  void listHeroes() {
    print("\n-- List Heroes --");
    List<HeroModel> heroes = _heroes.getHeroes();
    printHeroes(heroes);
    print("\n${heroes.length} Heroes found.");
  }

  void listGoodHeroes() {
    print("\n-- List Good Heroes --");
    List<HeroModel> heroes = _heroes.getGoodHeroes();
    printHeroes(heroes);
    print("\n${heroes.length} Good Heroes found.");
  }

  void listBadHeroes() {
    print("\n-- List Bad Heroes --");
    List<HeroModel> heroes = _heroes.getBadHeroes();
    printHeroes(heroes);
    print("\n${heroes.length} Bad Heroes found.");
  }

  void listTopHeroes() {
    print("\n-- List Top $_nrOfTopHeroes Heroes --");
    printHeroes(_heroes.getTopHeroes(_nrOfTopHeroes));
  }

  void setNrOfTopHeroesList() {
    print("\n-- Set nr of top heroes List --\n");
    _nrOfTopHeroes = Util.readPositiveIntWithMinValue("NrOfTopHeroes: ", 1);
  }

  void searchHeroes() {
    print("\n-- Search Heroes --");
    String search = Util.readString("\nSearch: ");
    List<HeroModel> heroes = _heroes.searchHero(search);

    if (heroes.isEmpty) {
      print("\nNo Heroes found.");
    } else {
      printHeroes(heroes);
      print("\n${heroes.length} Heroes found.");
    }
  }

  Future<void> remoteSearchAndLoadHeroes() async {
    print("\n-- Remote Search and load Heroes --");
    String search = Util.readString("\nSearch: ");
    List<HeroModel> searchResult = await _heroes.remoteSearchAndLoadHeroes(search);

    if (searchResult.isEmpty) {
      print("\nNo new Heroes found.");
    } else {
      printHeroes(searchResult);
      print("\n${searchResult.length} Heroes found and added to local herodex.");
    }
  }

  static void printHeroes(List<HeroModel> heroesList) {
    for (HeroModel hero in heroesList) {
      hero.printHero();
    }
  }
}

enum Alternative {

  add('Add Hero'),
  printHero('Print Hero'),
  delete('Delete Hero'),
  deleteAll('Delete All Heroes'),
  list('List Heroes'),
  listGood('List Good Heroes'),
  listBad('List Bad Heroes'),
  listTop('List top Heroes'),
  setTopList('Set nr of top Heroes list'),
  search('Search Heroes'),
  remoteSearchAndLoad('Search and load Heroes'),
  exit('Exit');

  final String label;

  const Alternative(this.label);

  String getLabel() {
    return '${_getIndentation()}${index + 1}. $label.';
  }

  String _getIndentation() {
    return index < 9 ? ' ' : '';
  }

  static Alternative decode(int alternativeId) {
    return Alternative.values[alternativeId - 1];
  }

  static bool validAlternative(int alternativeId) {
    return alternativeId >= 1 && alternativeId <= Alternative.values.length;
  }
}
