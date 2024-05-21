class ToDo {
  final String id;
  final String title;
  final String body;

  ToDo({
    required this.id,
    required this.title,
    required this.body,
  });

  ToDo copyWith({String? id, String? title, String? body}) {
    return ToDo(
      id: id?? this.id,
      title: title?? this.title,
      body: body?? this.body,
    );
  }
}