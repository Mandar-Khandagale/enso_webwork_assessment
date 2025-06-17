import 'dart:async';

import 'package:enso_webwork_assessment/feature/book/data/repositories/book_repository_impl.dart';
import 'package:enso_webwork_assessment/feature/book/domain/entities/book_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'books_provider.g.dart';

final bookRepositoryProvider = Provider((ref) => BookRepositoryImpl());

final searchQueryProvider = StateProvider<String>((ref) => '');

final favoriteIdsProvider = FutureProvider<List<String>>((ref) async {
  return ref.watch(bookRepositoryProvider).getFavoriteIds();
});


@riverpod
class BooksListProvider extends _$BooksListProvider {
  @override
  FutureOr<List<BookEntity>> build() {
    return fetchBooks();
  }

  Future<List<BookEntity>> fetchBooks() async {
    state = AsyncLoading();
    try {
      final response = await ref.watch(bookRepositoryProvider).fetchBooks();
      state = AsyncData(response);
    } catch (e) {
      state = AsyncError(e, StackTrace.empty);
    }
    return state.value ?? [];
  }
}


@riverpod
class BooksFavoriteList extends _$BooksFavoriteList {
  @override
  FutureOr<List<BookEntity>> build() {
    return getFavoriteBooks();
  }

  Future<List<BookEntity>> getFavoriteBooks() async {
    final books = ref.watch(booksListProviderProvider).value;
    state = AsyncLoading();
    try {
      final favIds = await ref.watch(favoriteIdsProvider.future);
      final value = books?.where((book) => favIds.contains(book.id)).toList() ?? [];
      state = AsyncData(value);
    } catch (e) {
      state = AsyncError(e, StackTrace.empty);
    }
    return state.value ?? [];
  }
}
