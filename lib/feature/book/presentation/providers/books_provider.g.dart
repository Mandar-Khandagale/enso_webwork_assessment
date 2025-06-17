// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$booksListProviderHash() => r'40abceecaeb55db2660e6ec7a13600e2f6e7fb63';

/// See also [BooksListProvider].
@ProviderFor(BooksListProvider)
final booksListProviderProvider =
    AutoDisposeAsyncNotifierProvider<
      BooksListProvider,
      List<BookEntity>
    >.internal(
      BooksListProvider.new,
      name: r'booksListProviderProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$booksListProviderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BooksListProvider = AutoDisposeAsyncNotifier<List<BookEntity>>;
String _$booksFavoriteListHash() => r'd7498f21800c75b3e689899766451805c6673395';

/// See also [BooksFavoriteList].
@ProviderFor(BooksFavoriteList)
final booksFavoriteListProvider =
    AutoDisposeAsyncNotifierProvider<
      BooksFavoriteList,
      List<BookEntity>
    >.internal(
      BooksFavoriteList.new,
      name: r'booksFavoriteListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$booksFavoriteListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BooksFavoriteList = AutoDisposeAsyncNotifier<List<BookEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
