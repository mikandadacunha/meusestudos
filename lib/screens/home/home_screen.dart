import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapptodo/constants.dart';
import 'package:myapptodo/mode/todo.dart';
import 'package:myapptodo/widgets/myappItems.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final _todoContraller = TextEditingController();
  List<ToDo> _foundTodo = [];

  @override
  void initState() {
    // TODO: implement initState
    _foundTodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: k.defaultBackground,
        appBar: _buildAppBar(),
        body: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'Minhas Tarefas',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todoo in _foundTodo)
                        MyappItens(
                          todo: todoo,
                          onTodoChanged: _handleTodoChanged,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: Vx.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Vx.gray400,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: _todoContraller,
                    decoration: InputDecoration(
                        hintText: 'Adicionar uma tarefa',
                        border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Vx.white),
                    ),
                    onPressed: () {
                      _addTodoItem(_todoContraller.text);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: k.mainColorBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10),
                  ),
                )
              ],
            ),
          )
        ]));
  }

  void _handleTodoChanged(ToDo todo) {
    setState(() {
      todo.isDone != todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String toDo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoContraller.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodo = results;
    });
  }

  Widget searchBox() {
    return (Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Vx.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: k.dafaultGrayIcons,
              size: k.sizeIcons,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Busque aqui a sua anotação...',
            hintStyle: TextStyle(color: k.dafaultGrayIcons)),
      ),
    ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: k.defaultBackground,
      elevation: 0,
      leading: IconButton(
        iconSize: k.sizeIcons,
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          color: k.dafaultGrayIcons,
        ),
      ),
      actions: [
        IconButton(
          iconSize: k.sizeIcons,
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: k.dafaultGrayIcons,
          ),
          onPressed: () {},
        ),
        IconButton(
          iconSize: k.sizeIcons,
          icon: SvgPicture.asset(
            'assets/icons/bell.svg',
            color: k.dafaultGrayIcons,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
