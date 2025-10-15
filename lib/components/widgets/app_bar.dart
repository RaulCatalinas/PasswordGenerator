import 'package:flutter/material.dart'
    show AppBar, BuildContext, StatelessWidget, Widget;

class CreateAppBar extends StatelessWidget {
  final List<Widget> actions;

  const CreateAppBar({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: actions);
  }
}
