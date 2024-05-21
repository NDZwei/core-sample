import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';

class ToDoController extends GetxController {
  final RxList<ToDo> _toDos = <ToDo>[].obs;

  List<ToDo> get toDos => _toDos;

  addToDo(String title, String body) {
    ToDo newToDo = ToDo(
      id: const Uuid().v4(),
      title: title,
      body: body,
    );
    List<ToDo> newList = [...toDos, newToDo]; // add newToDo to list
    _toDos.value = newList;
  }

  updateToDo(ToDo newToDo) {
    List<ToDo> newList = [...toDos];
    int index = toDos.indexWhere((e) => e.id == newToDo.id);
    if (index < 0) return;
    newList[index] = newToDo;
    _toDos.value = newList;
  }

  deleteToDo(String id) {
    List<ToDo> newList = [...toDos];
    newList.removeWhere((e) => e.id == id);
    _toDos.value = newList;
  }


}