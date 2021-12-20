import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class PicturesDetailsScreen extends StatefulWidget {
  const PicturesDetailsScreen({Key? key, required this.imageProvider, required this.loadingBuilder}) : super(key: key);

  final ImageProvider imageProvider;
  final LoadingBuilder loadingBuilder;

  @override
  State<PicturesDetailsScreen> createState() => _PicturesDetailsScreenState();
}

class _PicturesDetailsScreenState extends State<PicturesDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: PhotoView(
        imageProvider: widget.imageProvider,
        loadingBuilder: widget.loadingBuilder,
      )
    );
  }

  AppBar get appBar => AppBar(
    automaticallyImplyLeading: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );

}