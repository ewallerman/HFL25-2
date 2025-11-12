import 'package:v04/models/hero_model.dart';

abstract class RemoteStorage {

  Future<List<HeroModel>> searchHero(String search);

}