import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_lorem_picsum/modules/modules.dart';
import 'package:flutter_lorem_picsum/modules/picture_list/widgets/pictures_list.dart';

class PicturesListScreen extends StatefulWidget {
  const PicturesListScreen({Key? key}) : super(key: key);

  @override
  State<PicturesListScreen> createState() => _PicturesListScreenState();
}

class _PicturesListScreenState extends State<PicturesListScreen> {

  @override
  void initState() {
    super.initState();
    context.read<PictureListCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PictureListCubit, PictureListState>(
        builder: (BuildContext context, state) {
          return PictureList(cubit: context.read<PictureListCubit>());
        },
      )
    );
  }
}