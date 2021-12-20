import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

import 'package:flutter_lorem_picsum/core/widgets/widgets.dart';

class PicturesDetailsScreen extends StatelessWidget {
  const PicturesDetailsScreen({Key? key, required this.downloadUrl}) : super(key: key);

  final String downloadUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(downloadUrl),
        loadingBuilder: (context, event) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }

  AppBar get appBar => AppBar(
    automaticallyImplyLeading: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: [
      SaveButton(downloadUrl: downloadUrl),
      ShareButton(downloadUrl: downloadUrl)
    ],
  );

}