
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/to_do_app/controllers/to_do_controller.dart';

import '../models/todo.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final toDoController = ToDoController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ToDoController>(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ToDo> toDos = toDoController.toDos;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => buildAddToDo(),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if(toDoController.toDos.isEmpty) {
          return const Center(child: Text('No data'));
        }
       return ListView.builder(
         itemCount: toDos.length,
         itemBuilder: (context, index) {
           ToDo toDo = toDos[index];
           return ListTile(
             title: Text(toDo.title),
             subtitle: Text(toDo.body),
             leading: IconButton.filledTonal(
               onPressed: () => buildUpdate(toDo),
               icon: const Icon(Icons.edit)
             ),
             trailing: IconButton(
               onPressed: () {
                 toDoController.deleteToDo(toDo.id);
               },
               icon: const Icon(Icons.delete)
             ),
           );
         }
       );
      }),
    );
  }
  
  buildAddToDo() {
    final title = TextEditingController();
    final body = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Add to do'),
        contentPadding: const EdgeInsets.all(20),
        children: [
          DInput(
            title: 'Title',
            controller: title
          ),
          const SizedBox(height: 16),
          DInput(title: 'Body', controller: body),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              toDoController.addToDo(title.text, body.text);
              Navigator.pop(context);
            },
            child: const Text('Save')
          )
        ],
      )
    );
  }

  buildUpdate(ToDo oldTodo) {
    final title = TextEditingController();
    title.text = oldTodo.title;
    final body = TextEditingController();
    body.text = oldTodo.body;
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Update to do'),
        contentPadding: const EdgeInsets.all(20),
        children: [
          DInput(
            title: 'Title',
            controller: title
          ),
          const SizedBox(height: 16),
          DInput(title: 'Body', controller: body),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              toDoController.updateToDo(oldTodo.copyWith(
                  title: title.text,
                  body: body.text
                ));
              Navigator.pop(context);
            },
            child: const Text('Save')
          )
        ],
      )
    );
  }
}
