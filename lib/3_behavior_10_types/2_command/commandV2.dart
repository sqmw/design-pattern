/// command 的接口，每一个 command只有一个方法，command 模式用来将 command 和所有者分离
abstract class Command {
  execute();
}

/// 具体的操作的灯，包含了开灯、关灯等方法
class Light {
  void lightOn() {
    print('turning on ... light is on now');
  }

  void lightOff() {
    print('turning off ... light is off now');
  }
}

class LightOnCommand implements Command {
  Light light;

  LightOnCommand(this.light);

  @override
  execute() {
    light.lightOn();
  }
}

class LightOffCommand implements Command {
  Light light;

  LightOffCommand(this.light);

  @override
  execute() {
    light.lightOff();
  }
}

class Radio {
  void radioOn() {
    print('turn on ... radio is on now');
  }
}

class RadioOnCommand implements Command {
  Radio radio;

  RadioOnCommand(this.radio);

  @override
  execute() {
    radio.radioOn();
  }
}

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
  CommandInvoker commandInvoker = CommandInvoker();

  Light light = Light();
  Radio radio = Radio();

  LightOnCommand lightOnCommand = LightOnCommand(light);
  LightOffCommand lightOffCommand = LightOffCommand(light);

  RadioOnCommand radioOnCommand = RadioOnCommand(radio);

  commandInvoker.command = lightOnCommand;
  commandInvoker.pressButton();

  commandInvoker.command = lightOffCommand;
  commandInvoker.pressButton();

  commandInvoker.command = radioOnCommand;
  commandInvoker.pressButton();
}
