import 'dart:io';

import 'package:test/test.dart';
import 'package:v04/models/hero_model.dart';
import 'package:v04/storage/file_storage.dart';

import '../testdata/json_test_data.dart';

void main() {

  String tempDataDir = 'temp${Platform.pathSeparator}data';
  String separator = Platform.pathSeparator;

  test('readHero', () {
    int id = 70;
    FileStorage fileStorage = FileStorage('test-data${separator}file-storage${separator}read-hero');
    HeroModel actualHero = fileStorage.readHero(id);
    expect(actualHero.id, id);
  });
  
  test('writeReadHero', () {
    int id = 70;
    HeroModel hero = HeroModel.fromJsonString(TestHeros.Batman);
    FileStorage fileStorage = FileStorage(tempDataDir);
    fileStorage.writeHero(hero);
    HeroModel actualHero = fileStorage.readHero(id);
    expect(actualHero.id, id);
  });

  test('getAllHeroFileNames', () {
    FileStorage fileStorage = FileStorage('test-data${separator}file-storage${separator}list-files');
    List<String> actualFileList = fileStorage.getAllHeroFileNames();
    expect(actualFileList.length, 3);
  });

  test('getAllHeroFileNamesNoDir', () {
    FileStorage fileStorage = FileStorage('test-data${separator}file-storage${separator}list-files${separator}non-existing-dir');
    List<String> actualFileList = fileStorage.getAllHeroFileNames();
    expect(actualFileList.length, 0);
  });

  test('fileWithPathFromName', () {
    String fileName = '${FileStorage.filePrefix}1${FileStorage.filePostfix}';
    FileStorage fileStorage = FileStorage(tempDataDir);
    String actualFile = fileStorage.fileWithPathFromName(fileName);
    expect(actualFile, '${fileStorage.dataDir}$separator$fileName');
  });

  test('fileWithPathFromId', () {
    int id = 1;
    FileStorage fileStorage = FileStorage(tempDataDir);
    String actualFile = fileStorage.fileWithPathFromId(id);
    expect(actualFile, '${fileStorage.dataDir}$separator${FileStorage.filePrefix}$id${FileStorage.filePostfix}');
  });

  test('fileNameForHero', () {
    int id = 1;
    FileStorage fileStorage = FileStorage(tempDataDir);
    String actualFile = fileStorage.fileNameForHero(id);
    expect(actualFile, '${FileStorage.filePrefix}$id${FileStorage.filePostfix}');
  });

}