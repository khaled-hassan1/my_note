import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/note.dart';
import '../widgets/const_app.dart';
import '../widgets/note_view_add.dart';

class AddScreen extends StatefulWidget {
  static const String route = '/add-note';

  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<Note>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: NoteAddView(
        titleController: _titleController,
        descriptionController: _descriptionController,
        noteProvider: noteProvider,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_titleController.text.isEmpty ||
                _descriptionController.text.isEmpty) {
              ConstApp.showToast('Fields can\'t be empty');
            } else {
              ConstApp.showToast('Added');
              noteProvider.addItem(
                  _titleController.text, _descriptionController.text);
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.save_as_rounded),
          label: const Text('Save')),
    );
  }
}
