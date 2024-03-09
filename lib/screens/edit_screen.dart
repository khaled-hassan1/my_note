import 'package:flutter/material.dart';
import 'package:my_note/widgets/container_widget.dart';
import 'package:provider/provider.dart';
import '../provider/note.dart';

import '../widgets/const_app.dart';
import '../widgets/note_view_edit.dart';
import 'InvalidNotePage.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  static String route = '/edit-route';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
    final args = ModalRoute.of(context)!.settings.arguments;
    final id = args as String?;
    print('ID received: $id');
    final NoteItem note =
        noteProvider.items.firstWhere((element) => element.id == id);
    if (note.id == null) {
      const InvalidNotePage();
    }

    _titleController.text = note.title;
    _descriptionController.text = note.description;
    print('Found note: ${note.title} - ${note.description}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: ContainerNoteScreen(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: NoteView(
              id: id ?? '',
              titleController: _titleController,
              descriptionController: _descriptionController,
              noteProvider: noteProvider),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_titleController.text.isEmpty ||
                _descriptionController.text.isEmpty) {
              ConstApp.showToast('Fields can\'t be empty');
            } else {
              ConstApp.showToast('Edited');
              noteProvider.editNote(
                  id!, _titleController.text, _descriptionController.text);
              print('id here $id');
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.save_as_rounded),
          label: const Text('Save')),
    );
  }
}
