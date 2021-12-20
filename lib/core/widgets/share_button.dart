import 'package:flutter/material.dart';

import 'package:share/share.dart';

import 'package:flutter_lorem_picsum/utils/utils.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key, required this.downloadUrl}) : super(key: key);

  final String downloadUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          String filePath = await Utilities.getImagePath(downloadUrl);
          Share.shareFiles([filePath]);
        },
        icon: const Icon(Icons.share)
    );
  }

}