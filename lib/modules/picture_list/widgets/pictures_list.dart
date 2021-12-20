import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_lorem_picsum/core/config/api_constants.dart';

import 'package:flutter_lorem_picsum/modules/modules.dart';

class PictureList extends StatelessWidget {
  const PictureList({Key? key, required this.cubit}) : super(key: key);

  final PictureListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cubit.loadedPictures.length,
      itemBuilder: (context, index) {
        if (index == cubit.loadedPictures.length) {
          return Opacity(
            opacity: cubit.isLoading ? 1 : 0,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Card(
          margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: "${ApiConstants.singleImageUrl}${cubit.loadedPictures[index].id}/400/300",
                placeholder: (context, url) => const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator()
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text("by ${cubit.loadedPictures[index].author}"),
              )
            ],
          ),
        );
      },
    );
  }
}