import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:v04/models/hero_model.dart';
import 'package:v04/storage/remote_storage.dart';

class HttpStorage implements RemoteStorage {

  static const String defaultUrl = 'https://www.superheroapi.com/api.php';

  final String _url;
  final String _apiKey;

  HttpStorage(this._url, this._apiKey);

  String _getUrlWithKey() {
    return '$_url/$_apiKey/';
  }

  @override
  Future<List<HeroModel>> searchHero(String search) async {
    final url = Uri.parse('${_getUrlWithKey()}search/$search');
    List<HeroModel> result = [];

    try {
      final Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        String searchResponse = json['response'];

        if ('success' == searchResponse) {
          //List<Map<String, dynamic>> heroesJson = json['results']; // why does this not work.. " type 'List<dynamic>' is not a subtype of type 'List<Map<String, dynamic>>' "
          List<dynamic> heroesJson = json['results'];
          result = heroesJson.map((hero) { return HeroModel.fromJson(hero); }).toList();
        } else if ('error' == searchResponse) {
          print("\n*** Error searching for heroes via http api ***");
          print(json['error']);
        }
      }
    } catch (e) {
      print("\n*** Error searching for heroes via http api ***");
      print(e);
    }

    return Future.value(result);
  }
}