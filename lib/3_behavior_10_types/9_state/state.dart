/// state，一般情况下，我们每一个状态的转换对应着行为，但是 state 模式将状态的转变直接封装在 state class 里面
abstract class LightState {
  void lightOn();

  void lightOff();
}

/// concrete state
class LightOnState implements LightState {
  @override
  void lightOff() {
    print('light off now');
  }

  @override
  void lightOn() {
    print('light is already on');
  }
}

/// concrete state
class LightOffState implements LightState {
  @override
  void lightOff() {
    print('light is already on');
  }

  @override
  void lightOn() {
    print('light on now');
  }
}

/// context
class Light {
  LightState offState = LightOffState();
  LightState onState = LightOnState();
  late LightState stateNow;

  Light() {
    stateNow = offState;
  }

  void on() {
    stateNow.lightOn();
    stateNow = onState;
  }

  void off() {
    stateNow.lightOff();
    stateNow = offState;
  }
}

void main() {
  Light light = Light();
  light.off();
  light.on();
  light.on();
  light.off();
}
