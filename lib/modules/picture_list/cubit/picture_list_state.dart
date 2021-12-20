import 'package:equatable/equatable.dart';
import 'package:flutter_lorem_picsum/core/models/models.dart';

abstract class PictureListState extends Equatable {}

class PictureListInitialState extends PictureListState {
  @override
  List<Object> get props => [];
}

class PictureListLoadingState extends PictureListState {
  @override
  List<Object> get props => [];
}

class PictureListLoadedState extends PictureListState {
  PictureListLoadedState(this.pictures);

  final List<Photo> pictures;

  @override
  List<Object> get props => [pictures];
}

class PictureListErrorState extends PictureListState {
  @override
  List<Object> get props => [];
}