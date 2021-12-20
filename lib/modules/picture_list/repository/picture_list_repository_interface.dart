import 'package:flutter_lorem_picsum/core/core.dart';

abstract class PictureListRepositoryInterface {
  Future<List<Photo>> pictureList({int page, int limit});
}