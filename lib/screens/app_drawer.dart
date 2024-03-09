import 'package:flutter/material.dart';
import 'package:my_note/widgets/container_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'محمد علي أيوب',
      'محمد أبو الخير',
      'ياسين هيثم المغدبي',
      'سيف عبدالله محمود',
      'كريم عبدالله محمود',
      'البراء محمود سراج',
      'آدم محمود سراج',
      'علي',
      'أحمد',
      'ياسين خالد الحلو',
      'يحيي شعيب',
      'عمر صيام',
      'أحمد محمد شابون',
      'أحمد عنتر',
      'مالك عنتر',
      'لوجي عنتر',
      'ياسمين دريس',
    ];

    return Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: const Center(
                      child: Text(
                    'طلابي',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: ContainerNoteScreen(
                      child: Column(
                        children: [
                          for (int i = 0; i < names.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                textDirection: TextDirection.rtl,
                                '${i + 1}_ ${names[i]}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          const Divider(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
