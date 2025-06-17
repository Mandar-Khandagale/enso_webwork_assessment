import 'package:enso_webwork_assessment/feature/book/domain/entities/book_entity.dart';

abstract class BookRepository {
  Future<List<BookEntity>> fetchBooks();

  Future<List<String>> getFavoriteIds();

  Future<void> toggleFavorite(String bookId);

  Future<bool> isFavorite(String bookId);
}
