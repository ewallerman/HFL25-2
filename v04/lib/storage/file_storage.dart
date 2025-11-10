import 'dart:io';

import 'package:v04/models/hero_model.dart';
import 'package:v04/storage/local_storage.dart';

class FileStorage implements LocalStorage {

  static const String filePrefix = 'hero-';
  static const String filePostfix = '.json';
  final String _dataDir;

  FileStorage(this._dataDir);

  String get dataDir => _dataDir;

  @override
  HeroModel readHero(int id) {
    return readHeroFile(fileNameForHero(id));
  }

  HeroModel readHeroFile(String fileName) {
    String heroJson = File(fileWithPathFromName(fileName)).readAsStringSync();

    return HeroModel.fromJsonString(heroJson);
  }

  @override
  List<HeroModel> readHeroes() {
    List<HeroModel> heroes = [];

    for (String fileName in getAllHeroFileNames()) {
      heroes.add(readHeroFile(fileName));
    }

    return heroes;
  }

  @override
  void deleteHero(int id) {
    deleteFileIfExist(fileWithPathFromId(id));
  }

  @override
  void deleteAllHeroes() {
    for (String fileName in getAllHeroFileNames()) {
      deleteFileIfExist(fileWithPathFromName(fileName));
    }
  }

  void deleteFileIfExist(String fileWithPath) {
    File file = File(fileWithPath);

    if (file.existsSync()) {
      file.deleteSync();
    }
  }

  List<String> getAllHeroFileNames() {
    Directory dir = Directory(_dataDir);

    if (dir.existsSync()) {
      List<String> filesNameList = dir.listSync(recursive: false, followLinks: false)
          .whereType<File>()
          .map((file) => file.path.split(Platform.pathSeparator).last)
          .toList();

      return filesNameList;
    } else {
      return [];
    }
  }

  @override
  void writeHero(HeroModel hero) {
    var heroJson = hero.toJsonString();
    _ensureDataDir();
    File(fileWithPathFromId(hero.id)).writeAsStringSync(heroJson);
  }

  @override
  void writeHeroes(List<HeroModel> heroes) {
    for (HeroModel hero in heroes) {
      writeHero(hero);
    }
  }

  void _ensureDataDir() {
    Directory dir = Directory(_dataDir);

    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  String fileWithPathFromId(int id) {
    return fileWithPathFromName(fileNameForHero(id));
  }

  String fileWithPathFromName(String fileName) {
    return '$_dataDir${Platform.pathSeparator}$fileName';
  }

  String fileNameForHero(int id) {
    return '$filePrefix$id$filePostfix';
  }

}