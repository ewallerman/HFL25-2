import 'package:test/test.dart';
import 'package:v03/models/hero_model.dart';

void main() {

  test('HeroModel', () {
    String json =
    '''
    {
      "response": "success",
      "id": "70",
      "name": "Batman",
      "powerstats": {
        "intelligence": "100",
        "strength": "26",
        "speed": "27",
        "durability": "50",
        "power": "47",
        "combat": "100"
      },
      "biography": {
        "full-name": "Bruce Wayne",
        "alter-egos": "No alter egos found.",
        "aliases":[
          "Insider",
          "Matches Malone"
        ],
        "place-of-birth": "Crest Hill, Bristol Township; Gotham County",
        "first-appearance": "Detective Comics #27",
        "publisher": "DC Comics",
        "alignment": "good"
      },
      "appearance": {
        "gender": "Male",
        "race": "Human",
        "height": [
          "6'2",
          "188 cm"
        ],
        "weight": [
          "210 lb",
          "95 kg"
        ],
        "eye-color": "blue",
        "hair-color": "black"
      },
      "work": {
        "occupation": "Businessman",
        "base": "Batcave, Stately Wayne Manor, Gotham City; Hall of Justice, Justice League Watchtower"
      },
      "connections": {
        "group-affiliation": "Batman Family, Batman Incorporated, Justice League, Outsiders, Wayne Enterprises, Club of Heroes, formerly White Lantern Corps, Sinestro Corps",
        "relatives": "Damian Wayne (son), Dick Grayson (adopted son), Tim Drake (adopted son), Jason Todd (adopted son), Cassandra Cain (adopted ward) Martha Wayne (mother, deceased)"
      },
      "image": {
        "url": "https://www.superherodb.com/pictures2/portraits/10/100/639.jpg"
      }
    }
    ''';

    HeroModel parsed = HeroModel.fromJsonString(json);

    verifyJson(parsed.toJsonString(), json);
  });

  test('powerstats', () {
    String json =
    '''
    {
      "intelligence": "100",
      "strength": "26",
      "speed": "27",
      "durability": "50",
      "power": "47",
      "combat": "100"
    }
    ''';

    Powerstats parsed = Powerstats.fromJsonString(json);

    expect(parsed.intelligence, 100);
    expect(parsed.strength, 26);
    expect(parsed.speed, 27);
    expect(parsed.durability, 50);
    expect(parsed.power, 47);
    expect(parsed.combat, 100);

    verifyJson(parsed.toJsonString(), json);
  });

  test('biography', () {
    String json =
    '''
    {
      "full-name": "Bruce Wayne",
      "alter-egos": "No alter egos found.",
      "aliases":[
        "Insider",
        "Matches Malone"
      ],
      "place-of-birth": "Crest Hill, Bristol Township; Gotham County",
      "first-appearance": "Detective Comics #27",
      "publisher": "DC Comics",
      "alignment": "good"
    }
    ''';

    Biography parsed = Biography.fromJsonString(json);

    expect(parsed.fullName, "Bruce Wayne");
    expect(parsed.alterEgos, "No alter egos found.");
    expect(parsed.aliases, ["Insider", "Matches Malone"]);
    expect(parsed.placeOfBirth, "Crest Hill, Bristol Township; Gotham County");
    expect(parsed.firstAppearance, "Detective Comics #27");
    expect(parsed.publisher, "DC Comics");
    expect(parsed.alignment, "good");

    verifyJson(parsed.toJsonString(), json);
  });

  test('appearance', () {
    String json =
    '''
    {
      "gender": "Male",
      "race": "Human",
      "height": [
        "6'2",
        "188 cm"
      ],
      "weight": [
        "210 lb",
        "95 kg"
      ],
      "eye-color": "blue",
      "hair-color": "black"
    }
    ''';

    Appearance parsed = Appearance.fromJsonString(json);

    expect(parsed.gender, "Male");
    expect(parsed.race, "Human");
    expect(parsed.height, ["6'2", "188 cm"]);
    expect(parsed.weight, ["210 lb", "95 kg"]);
    expect(parsed.eyeColor, "blue");
    expect(parsed.hairColor, "black");

    verifyJson(parsed.toJsonString(), json);
  });

  test('work', () {
    String json =
    '''
    {
      "occupation": "Businessman",
      "base": "Batcave, Stately Wayne Manor..."
    }
    ''';

    Work parsed = Work.fromJsonString(json);

    expect(parsed.occupation, "Businessman");
    expect(parsed.base, "Batcave, Stately Wayne Manor...");

    verifyJson(parsed.toJsonString(), json);
  });

  test('connections', () {
    String json =
    '''
    {
      "group-affiliation": "Batman Family, Batman Incorporated ...",
      "relatives": "Damian Wayne (son), Dick Grayson (adopted son)..."
    }
    ''';

    Connections parsed = Connections.fromJsonString(json);

    expect(parsed.groupAffiliation, "Batman Family, Batman Incorporated ...");
    expect(parsed.relatives, "Damian Wayne (son), Dick Grayson (adopted son)...");

    verifyJson(parsed.toJsonString(), json);
  });

  test('image', () {
    String json =
    '''
    {
      "url": "https://www.superherodb.com/pictures2/portraits/10/100/639.jpg"
    }
    ''';

    Image parsed = Image.fromJsonString(json);

    expect(parsed.url, "https://www.superherodb.com/pictures2/portraits/10/100/639.jpg");

    verifyJson(parsed.toJsonString(), json);
  });

  test('simpleHero', () {
    HeroModel bertil = HeroModel.simpelHeroModel("Bertil", 5, "good");
    HeroModel nisse = HeroModel.simpelHeroModel("Nisse", 1, "bad");
    HeroModel kalle = HeroModel.simpelHeroModel("Kalle", 99, "bad");

    List<HeroModel> heroes = [bertil, nisse, kalle];
    heroes.sort();
    Iterator<HeroModel> heroesIterator = heroes.iterator;

    expect(getNext(heroesIterator), kalle);
    expect(getNext(heroesIterator), bertil);
    expect(getNext(heroesIterator), nisse);
  });
}

void verifyJson(String actual, String expected) {
  String expectedClean = expected.replaceAll(RegExp(r'\s+'), '');
  String actualClean = actual.replaceAll(RegExp(r'\s+'), '');
  expect(actualClean, expectedClean);
}

HeroModel getNext(Iterator<HeroModel> heroesIterator) {
  heroesIterator.moveNext();

  return heroesIterator.current;
}