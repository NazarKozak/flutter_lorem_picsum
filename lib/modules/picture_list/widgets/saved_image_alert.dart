import 'package:flutter/material.dart';

class SavedImageAlert extends StatelessWidget {
  const SavedImageAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    return AlertDialog(
      title: Text("Photo saved", style: Theme.of(context).textTheme.headline6),
      actions: [
        okButton,
      ],
    );
  }
}