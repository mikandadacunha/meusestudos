class ToDo {
  String? id;
  String? todoText;
  bool? isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo> todoList() {
    return [
      ToDo(
          id: '01',
          todoText: 'Fazer ToDo List com React e TypeScript',
          isDone: true),
      ToDo(id: '01', todoText: 'Fazer TOdo com flutter', isDone: true),
      ToDo(id: '02', todoText: 'Primeira tarefa feita', isDone: true),
      ToDo(id: '03', todoText: 'Primeira tarefa feita'),
      ToDo(id: '04', todoText: 'Primeira tarefa feita'),
      ToDo(id: '05', todoText: 'Primeira tarefa feita'),
      ToDo(id: '06', todoText: 'Primeira tarefa feita'),
      ToDo(id: '07', todoText: 'Primeira tarefa feita'),
      ToDo(id: '08', todoText: 'Primeira tarefa feita'),
    ];
  }
}
