import 'package:flutter/material.dart';

class InvalidNotePage extends StatelessWidget {
  const InvalidNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: const Center(
        child: Text('Note not found.'),
      ),
    );
  }
}
