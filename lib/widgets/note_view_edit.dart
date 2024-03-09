import 'package:flutter/material.dart';
import '../provider/note.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    super.key,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required this.noteProvider,
    required this.id,
  })  : _titleController = titleController,
        _descriptionController = descriptionController;

  final String id;
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final Note noteProvider;

  Widget buildTextField(TextEditingController controller, String labelText,
      TextInputType keyboardType, int lines) {
    const commonBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(34),
      bottomRight: Radius.circular(34),
    );
    return TextField(
      textAlign: TextAlign.right,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: commonBorderRadius,
        ),
        border: const OutlineInputBorder(borderRadius: commonBorderRadius),
        prefix: Text(
          labelText,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        labelStyle: const TextStyle(color: Colors.blue),
        filled: true,
        fillColor: Colors.white,
      ),
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      maxLines: lines,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(height: 100),
          buildTextField(_titleController, 'Title', TextInputType.text, 1),
          const SizedBox(height: 30),
          buildTextField(_descriptionController, 'Description',
              TextInputType.multiline, 3),
        ],
      ),
    );
  }
}
