// 中介者接口
import 'dart:io';

abstract class Mediator {
  void sendMessage(Colleague target, String message);
}

// 同事接口
abstract class Colleague {
  Mediator mediator;

  Colleague(this.mediator);

  void send(Colleague target, String message);

  void receive(String message);
}

// 具体中介者类
class ConcreteMediator implements Mediator {
  Set<Colleague> colleagues = {};

  void addColleague(Colleague colleague) {
    colleagues.add(colleague);
  }

  @override
  void sendMessage(Colleague target, String message) {
    if (colleagues.contains(target)) {
      target.receive(message);
    } else {
      stderr.write('target 未在 mediator 进行注册');
    }
  }
}

// 具体同事类
class ConcreteColleague extends Colleague {
  String name;

  ///--------------------------两个等价-------------------------///
  // ConcreteColleague(this.name, super.mediator);
  ConcreteColleague(this.name, Mediator mediator) : super(mediator);

  @override
  void receive(String message) {
    print('$name 收到消息: $message');
  }

  @override
  void send(Colleague target, String message) {
    mediator.sendMessage(target, message);
  }
}

void main() {
  var mediator = ConcreteMediator();

  var colleague1 = ConcreteColleague('Colleague 1', mediator);
  var colleague2 = ConcreteColleague('Colleague 2', mediator);
  var colleague3 = ConcreteColleague('Colleague 3', mediator);

  // 注册
  mediator.addColleague(colleague1);
  mediator.addColleague(colleague2);

  colleague1.send(colleague2, 'msg from colleague1');
  colleague1.send(colleague1, 'msg from colleague2');

  colleague1.send(colleague3, 'msg from colleague2');
}
