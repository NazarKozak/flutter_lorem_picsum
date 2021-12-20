import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Utilities {
  static Future<String> getImagePath(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);
    return file.path;
  }
}