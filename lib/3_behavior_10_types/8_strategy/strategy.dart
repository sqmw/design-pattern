abstract class SortStrategy<T> {
  void sort(List<T> arr);
}

class QuickSort implements SortStrategy {
  @override
  void sort(List arr) {
    print('quick sort');
    arr.sort();
  }
}

class BubbleSort implements SortStrategy {
  @override
  void sort(List arr) {
    print('bubble sort');
    arr.sort();
  }
}

/// sort context
class SortContext {
  final SortStrategy _quickSort = QuickSort();
  final SortStrategy _bubbleSort = BubbleSort();

  void sort(List arr) {
    if (arr.length > 5) {
      _quickSort.sort(arr);
    } else {
      _bubbleSort.sort(arr);
    }
  }
}

void main() {
  SortContext sortContext = SortContext();

  List<int> arr1 = [2, 1, 2, 3, 0];
  List<int> arr2 = [2, 9, 2, 30, 1, 100];

  sortContext.sort(arr1);
  print(arr1);

  sortContext.sort(arr2);
  print(arr2);
}
