import 'package:example_project_api/core/inyection_container.dart' as sl;
import 'package:example_project_api/presentation/views/movies/movies_screen.dart';
import 'package:example_project_api/presentation/views/users/user_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MoviesScreen(),
        // '/userPage': (context) => const UserScreen(),
      },
    );
  }
}
