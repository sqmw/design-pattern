/// facade 用来管理子系统，使用 facade来统一管理所有吧的子系统，facade 隐藏了所有的实现细节
class CPU {
  void cpuRun() {
    print('CPU run');
  }

  void cpuStop() {
    print('CPU stop');
  }
}

class RAM {
  void ramLoad() {
    print('RAM load');
  }

  void ramUnload() {
    print('Ram unload');
  }
}

class HardDisk {
  void diskWrite() {
    print('Disk write');
  }

  void diskRead() {
    print('Disk read');
  }
}

/// Computer 这个任务可以分为上面的三个任务
class ComputerFacade {
  late final CPU _cpu;
  late final RAM _ram;
  late final HardDisk _hardDisk;

  ComputerFacade(this._cpu, this._ram, this._hardDisk);

  void computerStart() {
    print('启动电脑...');
    _cpu.cpuRun();
    _ram.ramLoad();
    _hardDisk.diskRead();
    print('电脑启动完成');
  }

  void computerStop() {
    print('关闭电脑...');
    _cpu.cpuStop();
    _ram.ramUnload();
    _hardDisk.diskWrite();
    print('电脑关闭完成');
  }
}

void main() {
  ComputerFacade computerFacade = ComputerFacade(CPU(), RAM(), HardDisk());

  computerFacade.computerStart();
  computerFacade.computerStop();
}
