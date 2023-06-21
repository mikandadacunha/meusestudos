import 'package:flutter/material.dart';
import '../mode/todo.dart';
import '../constants.dart';
import 'package:velocity_x/velocity_x.dart';

class MyappItens extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onDeleteItem;

  const MyappItens(
      {Key? key,
      required this.todo,
      required this.onTodoChanged,
      required this.onDeleteItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onTodoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Vx.white,
          leading: Icon(
            todo.isDone! ? Icons.check_box : Icons.check_box_outline_blank,
            color: k.defaultDatailColor,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: k.defaultTextColor,
              decoration: todo.isDone! ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: k.defaultDatailColor,
                borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              color: Vx.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                //*print('Eliminar');
                onDeleteItem(todo.id);
              },
            ), /**The end of the delete buttom */
          ),
        ));
  }
}
