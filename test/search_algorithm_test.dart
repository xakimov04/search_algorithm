import 'package:search_algorithm/src/search_algorithms.dart';
import 'package:test/test.dart';

void main() {
  group('SearchAlgorithms', () {
    List<int> intList = List.generate(10000, (index) => index);
    List<String> stringList = List.generate(10000, (index) => 'Item$index');

    test('Linear Search finds the correct index', () {
      expect(SearchAlgorithms.linearSearch(intList, 5000), 5000);
      expect(SearchAlgorithms.linearSearch(stringList, 'Item5000'), 5000);
    });

    test('Binary Search finds the correct index', () {
      expect(SearchAlgorithms.binarySearch(intList, 5000), 5000);
      expect(SearchAlgorithms.binarySearch(stringList, 'Item5000'), 5000);
    });

    test('Jump Search finds the correct index', () {
      expect(SearchAlgorithms.jumpSearch(intList, 5000), 5000);
      expect(SearchAlgorithms.jumpSearch(stringList, 'Item5000'), 5000);
    });

    test('Measure time for Linear Search', () {
      var duration = SearchAlgorithms.measureTime(() => SearchAlgorithms.linearSearch(intList, 5000));
      print('Linear Search time: ${duration.inMicroseconds} µs');
    });

    test('Measure time for Binary Search', () {
      var duration = SearchAlgorithms.measureTime(() => SearchAlgorithms.binarySearch(intList, 5000));
      print('Binary Search time: ${duration.inMicroseconds} µs');
    });

    test('Measure time for Jump Search', () {
      var duration = SearchAlgorithms.measureTime(() => SearchAlgorithms.jumpSearch(intList, 5000));
      print('Jump Search time: ${duration.inMicroseconds} µs');
    });
  });
}
