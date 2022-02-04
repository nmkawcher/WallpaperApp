import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:wallpaper_app/core/helper/api_client.dart';
import 'package:wallpaper_app/data/model/image_model.dart';

class WallPaperRepo {
  ApiClient apiClient;

  WallPaperRepo({required this.apiClient});



  int page = 0;
  final int limit = 30;
   List<ImageModel> _images=[];

  /*late List<ImageModel> _images ;
  List<ImageModel> get images=>_images;*/

  Future<List<ImageModel>> getNewImageList() async {
    _images.clear();
    try {
      page = page + 1;
      final response = await apiClient.getImageList(page: page, limit: limit);
      if (response.statusCode == 200) {
        final map = jsonDecode(response.body);
        print(map.toString());
        map.forEach((map) {
          _images.add(ImageModel.fromJson(map));
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('error: ${e.toString()}');
      }
    }
    return _images;
  }
}
