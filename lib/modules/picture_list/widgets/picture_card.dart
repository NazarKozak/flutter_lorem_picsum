import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_lorem_picsum/core/core.dart';
import 'package:flutter_lorem_picsum/modules/modules.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PictureCard extends StatelessWidget {
  const PictureCard({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: () => openDetails(context, photo),
     child: Card(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("by ${photo.author}", style: Theme.of(context).textTheme.headline5),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          GallerySaver.saveImage("${photo.downloadUrl}.jpg").then((value) => {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alertDialog(context);
                              }
                            )
                          });
                        },
                        icon: const Icon(Icons.save_alt)
                      ),
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.share)
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
   );
  }

  Widget alertDialog(BuildContext context) {
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

  void openDetails(BuildContext context, Photo photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PicturesDetailsScreen(
          imageProvider: CachedNetworkImageProvider(photo.downloadUrl),
          loadingBuilder: (context, event) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )
    );
  }

}