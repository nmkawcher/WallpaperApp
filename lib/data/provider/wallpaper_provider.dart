import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_app/data/model/image_model.dart';
import 'package:wallpaper_app/data/repository/wallpaper_repo.dart';

class WallPaperProvider extends ChangeNotifier {

  WallPaperRepo wallPaperRepo;

  WallPaperProvider({required this.wallPaperRepo});

  late List<ImageModel> _images = [];

  List<ImageModel> get images => _images;
  final customCacheManager =
  CacheManager(Config('customCacheKey', maxNrOfCacheObjects: 100));

  //gridview controller for implementing pagination
  final ScrollController controller = ScrollController();




  void _scrollListener() {
    try {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        loadImages();
      }
    } catch (e) {
      print("scroll error: ${e.toString()}");
    }
  }

  void loadImages() async {
    List<ImageModel>newImages = await wallPaperRepo.getNewImageList();
    _images.addAll(newImages);
    notifyListeners();
  }

  void initInitialValue()async{
    controller.addListener(_scrollListener);
    List<ImageModel>newImages = await wallPaperRepo.getNewImageList();
    _images.addAll(newImages);
    notifyListeners();
  }


}