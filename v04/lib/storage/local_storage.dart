import 'package:v04/models/hero_model.dart';

abstract class LocalStorage {

  HeroModel readHero(int id);

  List<HeroModel> readHeroes();

  void deleteHero(int id);

  void deleteAllHeroes();

  void writeHero(HeroModel hero);

  void writeHeroes(List<HeroModel> heroes);

}
