
class Hero implements Comparable<Hero> {

  static int idCounter = 0;

  int id = ++idCounter;
  String name;
  int strength;
  String alignment;
  String? specialPower;

  Hero(this.name, this.strength, this.alignment, this.specialPower);

  void printHero() {
    print("");
    print("Id: $id");
    print("Name: $name");
    print("Strength: $strength");
    print("Alignment: $alignment");
    if (specialPower != null) {
      print("SpecialPower: $specialPower");
    }
  }

  @override
  int compareTo(Hero other) {
    if (strength == other.strength) {
      return 0;
    } else if (strength < other.strength) {
      return 1;
    } else {
      return -1;
    }
  }

}
