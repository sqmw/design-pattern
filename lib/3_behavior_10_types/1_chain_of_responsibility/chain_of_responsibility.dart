/// 责任链模式

// 抽象类(需要属性)
abstract class Approver {
  Approver? successor;

  /// 设置下一级的处理者
  void setSuccessor(Approver approver) {
    successor = approver;
  }

  /// expense 表示的是需要处理的 task
  void processRequest(Expense expense);
}

class Manager extends Approver {
  @override
  void processRequest(Expense expense) {
    if (expense.amount < 1000) {
      print('amount < 1000 and manager handle it');
    } else if (successor != null) {
      successor!.processRequest(expense);
    } else {
      print('no one handle it');
    }
  }
}

class Director extends Approver {
  @override
  void processRequest(Expense expense) {
    if (expense.amount < 2000) {
      print('1000 <= amount < 2000 and director handle it');
    } else if (successor != null) {
      successor!.processRequest(expense);
    } else {
      print('no one handle it');
    }
  }
}

class Expense {
  late double _amount;

  Expense(this._amount);

  double get amount {
    return _amount;
  }

  set amount(double amount) {
    _amount = amount;
  }
}

void main() {
  Approver manager = Manager();
  Approver director = Director();
  manager.setSuccessor(director);

  Expense expense1 = Expense(500);
  Expense expense2 = Expense(1500);

  manager.processRequest(expense1);
  manager.processRequest(expense2);
}
