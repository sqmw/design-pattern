/// 接口：被观察者
abstract class Subject {
  void addObserver(Observer observer);

  void removeObserver(Observer key);

  void notifyUpdate();
}

/// 接口：观察者
abstract class Observer {
  void receiveUpdate(String msg);
}

class ConcreteSubject implements Subject {
  late String name;

  ConcreteSubject(this.name);

  Set<Observer> observerSet = {};

  void changeState() {
    notifyUpdate();
  }

  @override
  void addObserver(Observer observer) {
    observerSet.add(observer);
  }

  @override
  void notifyUpdate() {
    for (final observer in observerSet) {
      observer.receiveUpdate('我是<$name>，我要找男朋友了');
    }
  }

  @override
  void removeObserver(Observer key) {
    observerSet.remove(key);
  }
}

class ConcreteObserver implements Observer {
  late String name;

  ConcreteObserver(this.name);

  @override
  void receiveUpdate(String msg) {
    print('<$name> 收到了消息: $msg');
  }
}

void main() {
  ConcreteSubject subject = ConcreteSubject('小花');

  subject.addObserver(ConcreteObserver('小刚'));
  subject.addObserver(ConcreteObserver('小明'));

  subject.changeState();
}
