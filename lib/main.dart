import 'package:enso_webwork_assessment/feature/book/presentation/screens/books_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialised hive for flutter
  await Hive.initFlutter();
  //opens persistent storage container, if doesn't exist yet, Hive creates it.
  await Hive.openBox<String>('favorites');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books App',
      home: BookListScreen(),
    );
  }
}