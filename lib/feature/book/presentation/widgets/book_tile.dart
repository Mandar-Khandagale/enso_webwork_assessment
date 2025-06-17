import 'package:enso_webwork_assessment/feature/book/domain/entities/book_entity.dart';
import 'package:enso_webwork_assessment/feature/book/presentation/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookTile extends ConsumerWidget {
  final BookEntity book;
  final bool isFromFavoriteScreen;

  const BookTile({super.key, required this.book, this.isFromFavoriteScreen = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoriteIdsProvider);
    final repo = ref.watch(bookRepositoryProvider);

    return FutureBuilder<bool>(
      future: repo.isFavorite(book.id),
      builder: (context, snapshot) {
        final isFav = snapshot.data ?? false;
        return ListTile(
          leading: Image.network(
            book.coverUrl,
            width: 50,
          ),
          title: Text(book.title),
          subtitle: Text(book.author),
          trailing: IconButton(
            icon: isFromFavoriteScreen
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
            onPressed: () async {
              await repo.toggleFavorite(book.id);
              ref.refresh(favoriteIdsProvider);
            },
          ),
        );
      },
    );
  }
}
