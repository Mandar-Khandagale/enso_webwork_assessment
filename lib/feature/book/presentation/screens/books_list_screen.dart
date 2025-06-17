import 'package:enso_webwork_assessment/feature/book/presentation/providers/books_provider.dart';
import 'package:enso_webwork_assessment/feature/book/presentation/screens/books_favorites_screen.dart';
import 'package:enso_webwork_assessment/feature/book/presentation/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookListScreen extends ConsumerWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(booksListProviderProvider);
    final query = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Books'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BooksFavoritesScreen())),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
              decoration: InputDecoration(labelText: 'Search by title', border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: booksAsync.when(
              data: (books) {
                final filteredBooks = books.where((b) => b.title.toLowerCase().contains(query.toLowerCase())).toList();
                return ListView.builder(
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) => BookTile(book: filteredBooks[index]),
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
