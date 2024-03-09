import 'package:flutter/material.dart';

class ContainerNoteScreen extends StatelessWidget {
  const ContainerNoteScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            // gradient: RadialGradient(colors: [Colors.blue,Colors.grey],radius: 12),
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(34),
              topStart: Radius.circular(34),
            )),
        child: child);
  }
}
