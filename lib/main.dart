import 'package:flutter/material.dart';
import 'package:my_note/provider/note.dart';
import 'package:my_note/screens/add_note.dart';
import 'package:my_note/screens/edit_screen.dart';
import 'package:my_note/screens/note_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Note(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '📝 Note App 📝',
        themeAnimationCurve: Curves.easeIn,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white, background: Colors.white),
          useMaterial3: true,
        ),
        home: const NoteScreen(),
        routes: {
          AddScreen.route: (context) => const AddScreen(),
          EditScreen.route: (context) => const EditScreen(),
        },
      ),
    );
  }
}
