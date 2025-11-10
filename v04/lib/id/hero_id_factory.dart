abstract class HeroIdFactory {

  int getNewId();

  int getIdCounter();

  void setIdCounterIfHigher(int id);

}

class HeroIdFactoryImpl implements HeroIdFactory {

  int _idCounter = 1000; // local created heros start at 1000 to not collide with remote heroes

  @override
  int getNewId() {
    return _idCounter++;
  }

  @override
  int getIdCounter() {
    return _idCounter;
  }

  @override
  void setIdCounterIfHigher(int id) {
    if (id > _idCounter) {
      _idCounter = id + 1;
    }
  }
}