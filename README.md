# Search Algorithms

A Dart package that provides implementations of various search algorithms, including Binary Search, Linear Search, and Jump Search. Each search function accepts a list of data (either `String` or `int`) and the data to search for, returning the index if the data is found, otherwise `-1`. The package also provides information about the time taken for each search.

## Features

- **Linear Search:** A straightforward search algorithm that checks each element in the list until the desired element is found or the list ends.
- **Binary Search:** A more efficient algorithm for sorted lists, dividing the search interval in half repeatedly.
- **Jump Search:** An algorithm that searches in blocks of elements, reducing the time complexity for sorted lists.

## Installation

Add the following line to your `pubspec.yaml` dependencies section:

```yaml
dependencies:
  search_algorithms: ^1.0.0
```

## Usage

```dart
import 'package:search_algorithms/search_algorithms.dart';

void main() {
  List<int> intList = List.generate(10000, (index) => index);
  List<String> stringList = List.generate(10000, (index) => 'Item$index');

  // Linear Search
  int index1 = SearchAlgorithms.linearSearch(intList, 5000);
  print('Linear Search Index: $index1');

  // Binary Search
  int index2 = SearchAlgorithms.binarySearch(intList, 5000);
  print('Binary Search Index: $index2');

  // Jump Search
  int index3 = SearchAlgorithms.jumpSearch(intList, 5000);
  print('Jump Search Index: $index3');

  // Measure time for Linear Search
  Duration duration1 = SearchAlgorithms.measureTime(() => SearchAlgorithms.linearSearch(intList, 5000));
  print('Linear Search time: ${duration1.inMicroseconds} µs');

  // Measure time for Binary Search
  Duration duration2 = SearchAlgorithms.measureTime(() => SearchAlgorithms.binarySearch(intList, 5000));
  print('Binary Search time: ${duration2.inMicroseconds} µs');

  // Measure time for Jump Search
  Duration duration3 = SearchAlgorithms.measureTime(() => SearchAlgorithms.jumpSearch(intList, 5000));
  print('Jump Search time: ${duration3.inMicroseconds} µs');
}
```
