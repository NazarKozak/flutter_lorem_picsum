import 'package:flutter/material.dart';

import 'package:flutter_lorem_picsum/modules/modules.dart';

class PictureList extends StatelessWidget {
  const PictureList({Key? key, required this.cubit}) : super(key: key);

  final PictureListCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: cubit.scrollController,
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
        return PictureCard(photo: cubit.loadedPictures[index]);
      },
    );
  }
}