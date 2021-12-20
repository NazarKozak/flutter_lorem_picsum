import 'dart:convert';

import 'package:flutter_lorem_picsum/core/models/photo_model.dart';
import 'package:flutter_lorem_picsum/core/service/service.dart';
import 'package:flutter_lorem_picsum/modules/picture_list/repository/repository.dart';


class PictureListRepository implements PictureListRepositoryInterface {
  PictureListRepository(this.apiService);

  final ApiService apiService;

  @override
  Future<List<Photo>> pictureList({int page = 1, int limit = 30}) async {
    String response = await apiService.get("list?page=$page&limit=$limit");
    return List<Photo>.from(json.decode(response).map((x) => Photo.fromJson(x)));
  }
}