abstract class HeroIdFactory {

  int getNewId();

  int getIdCounter();

  void setIdCounter(int id);

}

class HeroIdFactoryImpl implements HeroIdFactory {

  static int idCounter = 0;

  int getNewId() {
    return ++idCounter;
  }

  int getIdCounter() {
    return idCounter;
  }

  void setIdCounter(int id) {
    idCounter = id;
  }
}