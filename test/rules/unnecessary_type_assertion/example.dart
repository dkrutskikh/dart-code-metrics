void simpleFunction() {
  final myList = <int>[1, 2, 3];

  myList.whereType<int>().cast<int>();
}
