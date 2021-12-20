import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_lorem_picsum/core/core.dart';

class PictureCard extends StatelessWidget {
  const PictureCard({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
   return Card(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: "${ApiConstants.singleImageUrl}${photo.id}/400/300",
            placeholder: (context, url) => const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator()
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text("by ${photo.author}", style: Theme.of(context).textTheme.headline5),
          )
        ],
      ),
    );
  }
}