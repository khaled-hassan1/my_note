import 'package:flutter/material.dart';
import 'package:my_note/screens/add_note.dart';
import 'package:my_note/screens/edit_screen.dart';
import 'package:my_note/widgets/const_app.dart';
import 'package:provider/provider.dart';
import '../provider/note.dart';
import '../widgets/container_widget.dart';
import 'app_drawer.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerItem = Provider.of<Note>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      persistentFooterButtons: [
        Container(
          alignment: Alignment.center,
          color: Colors.green.shade100,
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: double.infinity,
          child: const Text(
            'En/ Khaled Hassan Ghaly',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('My Notes'),
      ),
      body: FutureBuilder(
        future: providerItem.fetchDataFromDataBase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          print('Fetching data...');
            return const ContainerNoteScreen(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');

            return ContainerNoteScreen(
                child: Center(child: Text('Error: ${snapshot.error}')));
          } else {
            print('Data loaded');

            return Consumer<Note>(
              child: ContainerNoteScreen(
                  child: Center(
                child: Text(
                  'No Data...Add Some!',
                  style: ConstApp.textTitle,
                ),
              )),
              builder: (context, providerItem, ch) => providerItem.items.isEmpty
                  ? ch!
                  : ContainerNoteScreen(
                      child: ListView.separated(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            providerItem.items[index].title,
                            style: ConstApp.textTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            style: const TextStyle(color: Colors.white),
                            providerItem.items[index].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                ConstApp.showToast('Deleted');
                                providerItem.deleteNote(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          onTap: () {
                            Navigator.of(context).pushNamed(EditScreen.route,
                                arguments: providerItem.items[index].id);
                          },
                        );
                      },
                      itemCount: providerItem.items.length,
                      separatorBuilder: (_, __) => const Divider(
                          thickness: 1,
                          color: Colors.white,
                          indent: 120.0,
                          endIndent: 120.0),
                    )),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddScreen.route);
        },
        label: const Text('Add Note'),
      ),
    );
  }
}
