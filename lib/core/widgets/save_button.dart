import 'package:flutter/material.dart';

import 'package:gallery_saver/gallery_saver.dart';

import 'package:flutter_lorem_picsum/modules/modules.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key, required this.downloadUrl}) : super(key: key);

  final String downloadUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          GallerySaver.saveImage("$downloadUrl.jpg").then((value) => {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SavedImageAlert();
                }
            )
          });
        },
        icon: const Icon(Icons.save_alt)
    );
  }

}