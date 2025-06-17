import 'package:enso_webwork_assessment/feature/book/presentation/providers/books_provider.dart';
import 'package:enso_webwork_assessment/feature/book/presentation/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksFavoritesScreen extends ConsumerWidget {
  const BooksFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favBooksAsync = ref.watch(booksFavoriteListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Favorites'), centerTitle: true),
      body: favBooksAsync.when(
        data: (books) {
          if (books.isEmpty) {
            return Center(child: Text('Favorites not added yet'));
          }
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) => BookTile(book: books[index], isFromFavoriteScreen: true),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
