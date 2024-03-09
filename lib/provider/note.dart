import 'package:flutter/material.dart';
import 'package:my_note/helpers/database.dart';

class NoteItem {
  final String? id;
  final String title;
  final String description;

  NoteItem({required this.id, required this.title, required this.description});

  factory NoteItem.fromMap(Map<String, dynamic> map) {
    return NoteItem(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}

class Note with ChangeNotifier {
  List<NoteItem> _items = [];

  List<NoteItem> get items {
    return [..._items];
  }

  void addItem(String title, String description) async {
    final id = DateTime.now().toString();
    final newNote = NoteItem(id: id, title: title, description: description);
    _items.add(newNote);
    notifyListeners();

    await DataBaseHelper.insertData('note_user', {
      'id': newNote.id,
      'title': newNote.title,
      'description': newNote.description,
    });
  }

  void deleteNote(int index) async {
    final id = _items[index].id;
    _items.removeAt(index);
    notifyListeners();

    await DataBaseHelper.deleteData('note_user', id!);
  }

  void editNote(String id, String title, String description) async {
    final noteIndex = _items.indexWhere((note) => note.id == id);
    if (noteIndex != -1) {
      _items[noteIndex] =
          NoteItem(id: id, title: title, description: description);
      notifyListeners();

      await DataBaseHelper.updateData(
          'note_user',
          {
            'id': id,
            'title': title,
            'description': description,
          },
          id);
    }
  }

  Future<void> fetchDataFromDataBase() async {
    if (_items.isEmpty) {
      final dbList = await DataBaseHelper.getData('note_user');
      if (dbList.isEmpty) {
        return;
      }
      _items = dbList.map((item) => NoteItem.fromMap(item)).toList();
      notifyListeners();
    }
  }

  int selectIndex = -1;

  void toggle(int index) {
    if (index == selectIndex) {
      selectIndex = -1; // Deselect if already selected.
    } else {
      selectIndex = index; // Select the current item.
    }
    notifyListeners();
  }
}
