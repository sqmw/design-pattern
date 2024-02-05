/// 需要被 build 的产品 [产品]
class Computer {
  Computer();

  Computer.setAll(this._cpu, this._ram, this._storage);

  String? _cpu;
  String? _ram;
  String? _storage;

  String? get cpu => _cpu;

  set cpu(String? value) {
    _cpu = value;
  }

  String? get ram => _ram;

  String? get storage => _storage;

  set storage(String? value) {
    _storage = value;
  }

  set ram(String? value) {
    _ram = value;
  }

  @override
  String toString() {
    return 'cpu: $_cpu, ram: $_ram, storage: $_storage';
  }
}

/// builder 部分 [员工要求]
abstract class ComputerBuilder {
  void buildCpu();

  void buildRam();

  void buildStorage();

  Computer getProduct();
}

// 产品的 build 构造器，可能有多个，每一个都和一种产品对应，builder 拥有所有的原材料
class ATypeComputerBuilder implements ComputerBuilder {
  final Computer _aTypeComputer;

  ATypeComputerBuilder(this._aTypeComputer);

  @override
  void buildCpu() {
    _aTypeComputer.cpu = 'aTypeCPU';
  }

  @override
  void buildRam() {
    _aTypeComputer.ram = 'aTypeRam';
  }

  @override
  void buildStorage() {
    _aTypeComputer.storage = 'aTypeStorage';
  }

  @override
  Computer getProduct() {
    return _aTypeComputer;
  }
}

// 属于指导者，这里有点像 simple_factory
class ComputerDirector {
  Computer construct(ComputerBuilder computerBuilder) {
    computerBuilder.buildCpu();
    computerBuilder.buildRam();
    computerBuilder.buildStorage();

    return computerBuilder.getProduct();
  }
}

void main() {
  ComputerDirector computerDirector = ComputerDirector();
  Computer aTypeComputer =
      computerDirector.construct(ATypeComputerBuilder(Computer()));
  print(aTypeComputer.toString());
}
