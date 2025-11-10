import 'dart:convert';

import 'package:v04/id/hero_id_factory.dart';

class HeroModel extends ToJson implements Comparable<HeroModel> {

  static HeroIdFactory idFactory = HeroIdFactoryImpl();

  int id;
  String name;
  Powerstats powerstats;
  Biography biography;
  Appearance appearance;
  Work work;
  Connections connections;
  Image image;

  HeroModel(this.id, this.name, this.powerstats, this.biography,
      this.appearance, this.work, this.connections, this.image);

  factory HeroModel.simpelHeroModel(String name, int strength, String alignment) {
    return HeroModel(
        idFactory.getNewId(),
        name,
        Powerstats(0, strength, 0, 0, 0, 0),
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
        Powerstats.fromJson(json['powerstats']),
        Biography.fromJson(json['biography']),
        Appearance.fromJson(json['appearance']),
        Work.fromJson(json['work']),
        Connections.fromJson(json['connections']),
        Image.fromJson(json['image'])
    );
  }

  factory HeroModel.fromJsonString(String json) {
    return HeroModel.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id.toString(),
    'name': name,
    'powerstats': powerstats.toJson(),
    'biography': biography.toJson(),
    'appearance': appearance.toJson(),
    'work': work.toJson(),
    'connections': connections.toJson(),
    'image': image.toJson()
  };

  @override
  String toJsonString() {
    return jsonEncode(toJson());
  }

  void printHero() {
    print("");
    print("Id: $id");
    print("Name: $name");
    print("Strength: ${powerstats.strength}");
    print("Alignment: ${biography.alignment}");
  }

  @override
  int compareTo(HeroModel other) {
    if (powerstats.strength == other.powerstats.strength) {
      return 0;
    } else if (powerstats.strength < other.powerstats.strength) {
      return 1;
    } else {
      return -1;
    }
  }
}

class Powerstats extends ToJson {

  int intelligence;
  int strength;
  int speed;
  int durability;
  int power;
  int combat;

  Powerstats(this.intelligence, this.strength, this.speed, this.durability,
      this.power, this.combat);

  factory Powerstats.fromStrings(String intelligence, String strength,
      String speed, String durability, String power, String combat) {

    return Powerstats(int.parse(intelligence), int.parse(strength), int.parse(speed),
        int.parse(durability), int.parse(power), int.parse(combat));
  }

  factory Powerstats.fromJson(Map<String, dynamic> json) {
    return Powerstats.fromStrings(
        json['intelligence'],
        json['strength'],
        json['speed'],
        json['durability'],
        json['power'],
        json['combat']
    );
  }

  factory Powerstats.fromJsonString(String json) {
    return Powerstats.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() => {
    'intelligence': intelligence.toString(),
    'strength': strength.toString(),
    'speed': speed.toString(),
    'durability': durability.toString(),
    'power': power.toString(),
    'combat': combat.toString()
  };

}

class Biography extends ToJson {

  static const String good = 'good';
  static const String bad = 'bad';

  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography(this.fullName, this.alterEgos, this.aliases, this.placeOfBirth,
      this.firstAppearance, this.publisher, this.alignment);

  factory Biography.fromJson(Map<String, dynamic> json) {
    return Biography(
        json['full-name'],
        json['alter-egos'],
        List<String>.from(json['aliases']),
        json['place-of-birth'],
        json['first-appearance'],
        json['publisher'],
        json['alignment']
    );
  }

  factory Biography.fromJsonString(String json) {
    return Biography.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() => {
    'full-name': fullName,
    'alter-egos': alterEgos,
    'aliases': aliases,
    'place-of-birth': placeOfBirth,
    'first-appearance': firstAppearance,
    'publisher': publisher,
    'alignment': alignment
  };

}

class Appearance extends ToJson {

  String gender; //"Male"
  String race; //"Human"
  List<String> height; //"6'2", "188 cm"
  List<String> weight; //"210 lb", "95 kg"
  String eyeColor; //eye-color  "blue"
  String hairColor; //hair-color  "black"

  Appearance(this.gender, this.race, this.height, this.weight, this.eyeColor, this.hairColor);

  factory Appearance.fromJson(Map<String, dynamic> json) {
    return Appearance(
        json['gender'],
        json['race'],
        List<String>.from(json['height']),
        List<String>.from(json['weight']),
        json['eye-color'],
        json['hair-color']
    );
  }

  factory Appearance.fromJsonString(String json) {
    return Appearance.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() => {
    'gender': gender,
    'race': race,
    'height': height,
    'weight': weight,
    'eye-color': eyeColor,
    'hair-color': hairColor
  };

}

class Work extends ToJson {

  String occupation; //"Businessman",
  String base; //"Batcave, Stately Wayne Manor, Gotham City; Hall of Justice, Justice League Watchtower"

  Work(this.occupation, this.base);

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(json['occupation'], json['base']);
  }

  factory Work.fromJsonString(String json) {
    return Work.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() => {
    'occupation': occupation,
    'base': base
  };

}

class Connections extends ToJson {

  String groupAffiliation; //group-affiliation  "Batman Family, Batman Incorporated, Justice League, Outsiders, Wayne Enterprises, Club of Heroes, formerly White Lantern Corps, Sinestro Corps",
  String relatives; //"Damian Wayne (son), Dick Grayson (adopted son), Tim Drake (adopted son), Jason Todd (adopted son), Cassandra Cain (adopted ward) \nMartha Wayne (mother, deceased)"

  Connections(this.groupAffiliation, this.relatives);

  factory Connections.fromJson(Map<String, dynamic> json) {
    return Connections(json['group-affiliation'], json['relatives']);
  }

  factory Connections.fromJsonString(String json) {
    return Connections.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() => {
    'group-affiliation': groupAffiliation,
    'relatives': relatives
  };

}

class Image extends ToJson {

  String url; //"https://www.superherodb.com/pictures2/portraits/10/100/639.jpg"

  Image(this.url);

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(json['url']);
  }

  factory Image.fromJsonString(String json) {
    return Image.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() => {
    'url': url
  };

}

abstract class ToJson {

  Map<String, dynamic> toJson();

  String toJsonString() {
    return jsonEncode(toJson());
  }

}
