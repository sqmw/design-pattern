import 'dart:io';

/// 备忘录，用来存储 状态拥有着过去某个时刻的状态，在实际情况下，state 复杂很多
class Memento {
  late Object _state;

  Memento(this._state);

  set state(Object state) {
    _state = state;
  }

  Object get state => _state;
}

/// 按照规则存储 状态实体(memento) 两者聚合关系
/// 制定 memento 的存储规则
class Caretaker {
  List<Memento> mementoList = [];

  void addMemento(Memento memento) {
    mementoList.add(memento);
  }

  /// Memento remove()
  Memento? getMementoByKey(int index) {
    try {
      return mementoList[index];

      /// 使用 on IndexError [catch (e)] 只要捕获到 indexErr 就会报错
    } catch (e) {
      stderr.write('out of index\n');

      /// Future flush()
      stderr.flush();
    }
    return null;
  }
}

/// 状态的真正拥有者，以上两者服务于 originator
class Originator {
  late Object _state;

  set state(Object state) {
    _state = state;
  }

  Originator(this._state);

  Memento mementoFromNowState() => Memento(_state);

  void restoreFromMemento(Memento memento) {
    assert(_state is num);
    _state = memento._state;
  }

  void showState() {
    print("now state: $_state");
  }
}

void main() {
  Originator originator = Originator(0);
  originator.showState();

  Caretaker caretaker = Caretaker();

  caretaker.addMemento(originator.mementoFromNowState());

  originator.state = 1;

  originator.restoreFromMemento(
      caretaker.getMementoByKey(1) ?? originator.mementoFromNowState());

  caretaker.addMemento(originator.mementoFromNowState());

  originator.state = 2;
  originator.showState();
  originator.state = 3;

  caretaker.addMemento(originator.mementoFromNowState());

  originator.restoreFromMemento(caretaker.getMementoByKey(2)!);
  originator.showState();
}
