import 'package:enso_webwork_assessment/feature/book/data/datasources/mock_data.dart';
import 'package:enso_webwork_assessment/feature/book/domain/repositories/book_repository.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model.dart';

class BookRepositoryImpl extends BookRepository {
  final _favBox = Hive.box<String>('favorites');

  @override
  Future<List<BookEntity>> fetchBooks() async {
    await Future.delayed(Duration(seconds: 1)); // simulate network
    final response = mockBooksData;
    final data = response['data'] as List;
    return data.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<void> toggleFavorite(String bookId) async {
    if (_favBox.containsKey(bookId)) {
      await _favBox.delete(bookId);
    } else {
      await _favBox.put(bookId, bookId);
    }
  }

  @override
  Future<bool> isFavorite(String bookId) async {
    return _favBox.containsKey(bookId);
  }

  @override
  Future<List<String>> getFavoriteIds() async {
    return _favBox.values.toList();
  }
}