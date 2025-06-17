import 'package:enso_webwork_assessment/feature/book/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  BookModel({required super.id, required super.title, required super.author, required super.coverUrl});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(id: json['id'], title: json['title'], author: json['author'], coverUrl: json['coverUrl']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'author': author, 'coverUrl': coverUrl};
}
