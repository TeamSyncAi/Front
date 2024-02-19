class Tasks {

  List<String> tasksList;

  Tasks(this.tasksList);

  int get length => tasksList.length;

  String operator [](int index) => tasksList[index];

  void removeAt(int index) => tasksList.removeAt(index);
}

