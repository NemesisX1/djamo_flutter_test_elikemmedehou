import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.title,
    required this.body,
    this.isCompleted = false,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String title;
  final String body;
  final bool isCompleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<dynamic> get props => [
        id,
        title,
        body,
      ];
}
