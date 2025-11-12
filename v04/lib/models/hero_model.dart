import 'dart:convert';

import 'package:v04/id/hero_id_factory.dart';

class HeroModel extends ToJson implements Comparable<HeroModel> {

  static HeroIdFactory idFactory = HeroIdFactoryImpl();

  int id;
  String name;
  Powerstats? powerstats;
  Biography? biography;
  Appearance? appearance;
  Work? work;
  Connections? connections;
  Image? image;

  HeroModel(this.id, this.name, this.powerstats, this.biography,
      this.appearance, this.work, this.connections, this.image);

  factory HeroModel.simpelHeroModel(String name, int strength, String alignment) {
    return HeroModel(
        idFactory.getNewId(),
        name,
        Powerstats("", strength.toString(), "", "", "", ""),
        Biography("", "", [], "", "", "", alignment),
        Appearance("", "", [], [], "", ""),
        Work("", ""),
        Connections("", ""),
        Image(""));
  }

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
        int.parse(json['id']),
        json['name'],
        json['powerstats'] != null ? Powerstats.fromJson(json['powerstats']) : null,
        json['biography'] != null ? Biography.fromJson(json['biography']) : null,
        json['appearance'] != null ? Appearance.fromJson(json['appearance']) : null,
        json['work'] != null ? Work.fromJson(json['work']) : null,
        json['connections'] != null ? Connections.fromJson(json['connections']) : null,
        json['image'] != null ? Image.fromJson(json['image']) : null
    );
  }

  factory HeroModel.fromJsonString(String json) {
    return HeroModel.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};
    result['id'] = id.toString();
    result['name'] = name;
    if (powerstats != null ) {
      result['powerstats'] = powerstats!.toJson();
    }
    if (biography != null ) {
      result['biography'] = biography!.toJson();
    }
    if (appearance != null ) {
      result['appearance'] = appearance!.toJson();
    }
    if (work != null ) {
      result['work'] = work!.toJson();
    }
    if (connections != null ) {
      result['connections'] = connections!.toJson();
    }
    if (image != null ) {
      result['image'] = image!.toJson();
    }

    return result;
  }

  @override
  String toJsonString() {
    return jsonEncode(toJson());
  }

  void printHero() {
    print("");
    print("Id: $id");
    print("Name: $name");
    if (powerstats != null && powerstats!.strength != null) {
      print("Strength: ${powerstats!.strength}");
    }
    if (biography != null && biography!.alignment != null) {
      print("Alignment: ${biography!.alignment}");
    }
  }

  void prettyPrintHero() {
    String prettyJson = JsonEncoder.withIndent('  ').convert(this);
    print("");
    print(prettyJson);
  }

  int getStrengthToUseForCompare() {
    if (powerstats != null && powerstats!.strength != null && int.tryParse(powerstats!.strength!) != null) {
      return int.parse(powerstats!.strength!);
    } else {
      return -1; // min value used if the strength is not set or a valid int .. will sort the hero as low ranking
    }
  }

  @override
  int compareTo(HeroModel other) {
    int thisStrength = getStrengthToUseForCompare();
    int otherStrength = other.getStrengthToUseForCompare();

    if (thisStrength == otherStrength) {
      return 0;
    } else if (thisStrength < otherStrength) {
      return 1;
    } else {
      return -1;
    }
  }
}

class Powerstats extends ToJson {

  String? intelligence;
  String? strength;
  String? speed;
  String? durability;
  String? power;
  String? combat;

  Powerstats(this.intelligence, this.strength, this.speed, this.durability,
      this.power, this.combat);

  factory Powerstats.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Powerstats(null, null, null, null, null, null);
    } else {
      return Powerstats(
          json['intelligence'],
          json['strength'],
          json['speed'],
          json['durability'],
          json['power'],
          json['combat']
      );
    }
  }

  factory Powerstats.fromJsonString(String json) {
    return Powerstats.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (intelligence != null ) {
      result['intelligence'] = intelligence!.toString();
    }
    if (strength != null ) {
      result['strength'] = strength!.toString();
    }
    if (speed != null ) {
      result['speed'] = speed!.toString();
    }
    if (durability != null ) {
      result['durability'] = durability!.toString();
    }
    if (power != null ) {
      result['power'] = power!.toString();
    }
    if (combat != null ) {
      result['combat'] = combat!.toString();
    }

    return result;
  }

}

class Biography extends ToJson {

  static const String good = 'good';
  static const String bad = 'bad';

  String? fullName;
  String? alterEgos;
  List<String>? aliases;
  String? placeOfBirth;
  String? firstAppearance;
  String? publisher;
  String? alignment;

  Biography(this.fullName, this.alterEgos, this.aliases, this.placeOfBirth,
      this.firstAppearance, this.publisher, this.alignment);

  factory Biography.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Biography(null, null, null, null, null, null, null);
    } else {
      return Biography(
          json['full-name'],
          json['alter-egos'],
          json['aliases'] != null ? List<String>.from(json['aliases']) : null,
          json['place-of-birth'],
          json['first-appearance'],
          json['publisher'],
          json['alignment']
      );
    }
  }

  factory Biography.fromJsonString(String json) {
    return Biography.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (fullName != null ) {
      result['full-name'] = fullName;
    }
    if (alterEgos != null ) {
      result['alter-egos'] = alterEgos;
    }
    if (aliases != null ) {
      result['aliases'] = aliases;
    }
    if (placeOfBirth != null ) {
      result['place-of-birth'] = placeOfBirth;
    }
    if (firstAppearance != null ) {
      result['first-appearance'] = firstAppearance;
    }
    if (publisher != null ) {
      result['publisher'] = publisher;
    }
    if (alignment != null ) {
      result['alignment'] = alignment;
    }

    return result;
  }

}

class Appearance extends ToJson {

  String? gender; //"Male"
  String? race; //"Human"
  List<String>? height; //"6'2", "188 cm"
  List<String>? weight; //"210 lb", "95 kg"
  String? eyeColor; //eye-color  "blue"
  String? hairColor; //hair-color  "black"

  Appearance(this.gender, this.race, this.height, this.weight, this.eyeColor, this.hairColor);

  factory Appearance.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Appearance(null, null, null, null, null, null);
    } else {
      return Appearance(
          json['gender'],
          json['race'],
          json['height'] != null ? List<String>.from(json['height']) : null,
          json['weight'] != null ? List<String>.from(json['weight']) : null,
          json['eye-color'],
          json['hair-color']
      );
    }
  }

  factory Appearance.fromJsonString(String json) {
    return Appearance.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (gender != null ) {
      result['gender'] = gender;
    }
    if (race != null ) {
      result['race'] = race;
    }
    if (height != null ) {
      result['height'] = height;
    }
    if (weight != null ) {
      result['weight'] = weight;
    }
    if (eyeColor != null ) {
      result['eye-color'] = eyeColor;
    }
    if (hairColor != null ) {
      result['hair-color'] = hairColor;
    }

    return result;
  }

}

class Work extends ToJson {

  String? occupation; //"Businessman",
  String? base; //"Batcave, Stately Wayne Manor, Gotham City; Hall of Justice, Justice League Watchtower"

  Work(this.occupation, this.base);

  factory Work.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Work(null, null);
    } else {
      return Work(json['occupation'], json['base']);
    }
  }

  factory Work.fromJsonString(String json) {
    return Work.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (occupation != null ) {
      result['occupation'] = occupation;
    }
    if (base != null ) {
      result['base'] = base;
    }

    return result;
  }

}

class Connections extends ToJson {

  String? groupAffiliation; //group-affiliation  "Batman Family, Batman Incorporated, Justice League, Outsiders, Wayne Enterprises, Club of Heroes, formerly White Lantern Corps, Sinestro Corps",
  String? relatives; //"Damian Wayne (son), Dick Grayson (adopted son), Tim Drake (adopted son), Jason Todd (adopted son), Cassandra Cain (adopted ward) \nMartha Wayne (mother, deceased)"

  Connections(this.groupAffiliation, this.relatives);

  factory Connections.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Connections(null, null);
    } else {
      return Connections(json['group-affiliation'], json['relatives']);
    }
  }

  factory Connections.fromJsonString(String json) {
    return Connections.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (groupAffiliation != null ) {
      result['group-affiliation'] = groupAffiliation;
    }
    if (relatives != null ) {
      result['relatives'] = relatives;
    }

    return result;
  }

}

class Image extends ToJson {

  String? url; //"https://www.superherodb.com/pictures2/portraits/10/100/639.jpg"

  Image(this.url);

  factory Image.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Image(null);
    } else {
      return Image(json['url']);
    }
  }

  factory Image.fromJsonString(String json) {
    return Image.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    if (url != null ) {
      result['url'] = url;
    }

    return result;
  }

}

abstract class ToJson {

  Map<String, dynamic> toJson();

  String toJsonString() {
    return jsonEncode(toJson());
  }

}
