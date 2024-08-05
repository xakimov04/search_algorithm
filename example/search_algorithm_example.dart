import 'package:flutter/material.dart';
import 'package:search_algorithm/search_algorithm.dart';

void main() {
  runApp(const SearchAlgorithmsApp());
}

class SearchAlgorithmsApp extends StatelessWidget {
  const SearchAlgorithmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Algorithms Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<int> intList = List.generate(10000, (index) => index);
  final List<String> stringList = List.generate(10000, (index) => 'Item$index');
  final TextEditingController _searchController = TextEditingController();
  String _searchResult = '';
  String _searchTime = '';
  late int index;

  void _performSearch(String searchKey, String algorithm) {
    Duration duration;

    final int searchKeyInt = int.parse(searchKey);
    final bool isIntSearch = searchKeyInt != null;

    switch (algorithm) {
      case 'Linear Search':
        duration = SearchAlgorithms.measureTime(() {
          index = isIntSearch
              ? SearchAlgorithms.linearSearch(intList, searchKeyInt)
              : SearchAlgorithms.linearSearch(stringList, searchKey);
        });
        break;
      case 'Binary Search':
        duration = SearchAlgorithms.measureTime(() {
          index = isIntSearch
              ? SearchAlgorithms.binarySearch(intList, searchKeyInt)
              : SearchAlgorithms.binarySearch(stringList, searchKey);
        });
        break;
      case 'Jump Search':
        duration = SearchAlgorithms.measureTime(() {
          index = isIntSearch
              ? SearchAlgorithms.jumpSearch(intList, searchKeyInt)
              : SearchAlgorithms.jumpSearch(stringList, searchKey);
        });
        break;
      default:
        index = -1;
        duration = Duration.zero;
    }

    setState(() {
      _searchResult = index == -1 ? 'Not found' : 'Found at index: $index';
      _searchTime = 'Time taken: ${duration.inMicroseconds} µs';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Algorithms Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Enter search key',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        _performSearch(_searchController.text, 'Linear Search'),
                    child: const Text('Linear Search'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        _performSearch(_searchController.text, 'Binary Search'),
                    child: const Text('Binary Search'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        _performSearch(_searchController.text, 'Jump Search'),
                    child: const Text('Jump Search'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              _searchResult,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              _searchTime,
              style: const TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
