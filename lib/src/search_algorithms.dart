import 'dart:math';

class SearchAlgorithms {
  static int linearSearch<T extends Comparable>(List<T> list, T key) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == key) return i;
    }
    return -1;
  }

  static int binarySearch<T extends Comparable>(List<T> list, T key) {
    int left = 0;
    int right = list.length - 1;

    while (left <= right) {
      int middle = (left + right) ~/ 2;
      if (list[middle] == key) {
        return middle;
      } else if (list[middle].compareTo(key) < 0) {
        left = middle + 1;
      } else {
        right = middle - 1;
      }
    }
    return -1;
  }

  static int jumpSearch<T extends Comparable>(List<T> list, T key) {
    int n = list.length;
    int step = sqrt(n).toInt();
    int prev = 0;

    while (list[min(step, n) - 1].compareTo(key) < 0) {
      prev = step;
      step += sqrt(n).toInt();
      if (prev >= n) return -1;
    }

    for (int i = prev; i < min(step, n); i++) {
      if (list[i] == key) return i;
    }
    return -1;
  }

  static Duration measureTime(Function function) {
    final stopwatch = Stopwatch()..start();
    function();
    stopwatch.stop();
    return stopwatch.elapsed;
  }
}
