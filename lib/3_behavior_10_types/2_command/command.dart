/// command 的接口
abstract class Command {
  execute();
}

/// 具体的操作的灯
class Light {
  void lightOn() {
    print('turning on ... light is on now');
  }
}

/// 具体的 Command
class LightOnCommand implements Command {
  Light light;

  LightOnCommand(this.light);

  @override
  execute() {
    light.lightOn();
  }
}

/// invoker / controller (拥有command的控制权)遥控器
class CommandInvoker {
  Command? _command;

  set command(command) {
    _command = command;
  }

  void pressButton() {
    if (_command == null) {
      print('no command');
    }
    _command?.execute();
  }
}

void main() {
  Light light = Light();
  Command command = LightOnCommand(light);
  CommandInvoker invoker = CommandInvoker();
  invoker.command = command;

  invoker.pressButton();
}
