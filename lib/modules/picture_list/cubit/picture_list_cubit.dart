import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem_picsum/core/core.dart';

import 'package:flutter_lorem_picsum/modules/modules.dart';

class PictureListCubit extends Cubit<PictureListState> {
  PictureListCubit({required this.repository}) : super(PictureListInitialState());

  final PictureListRepository repository;

  ScrollController scrollController = ScrollController();
  List<Photo> loadedPictures = [];

  bool isLoading = false;
  int limit = 30;

  init() async {
    await getMoreData();
    scrollController.addListener(detectScrolledToEnd);
  }

  detectScrolledToEnd() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      await getMoreData();
    }
  }

  startFetching() {
    isLoading = true;
    emit(PictureListLoadingState());
  }

  endFetching() {
    isLoading = false;
    emit(PictureListLoadedState(loadedPictures));
  }

  showError() {
    isLoading = false;
    emit(PictureListErrorState());
  }

  Future<void> getMoreData() async {
      startFetching();
      final pictures = await repository.pictureList(page: ((loadedPictures.length/limit) + 1).ceil(), limit: limit);
      loadedPictures.addAll(pictures);
      endFetching();
  }

}