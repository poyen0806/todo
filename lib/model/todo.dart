class Todo {
  String? title;
  String? detail;

  Todo({
    required this.title,
    required this.detail,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'],
        detail: json['detail'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'detail': detail,
      };
}
