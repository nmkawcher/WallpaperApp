import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_app/data/model/image_model.dart';
import 'package:wallpaper_app/data/repository/wallpaper_repo.dart';

class WallPaperProvider extends ChangeNotifier{

  WallPaperRepo wallPaperRepo;
  WallPaperProvider({required this.wallPaperRepo});
  late List<ImageModel> _images=[] ;
  List<ImageModel> get images=>_images;
  final customCacheManager =
  CacheManager(Config('customCacheKey', maxNrOfCacheObjects: 100));

  void loadImages()async{
   List<ImageModel>newImages=await wallPaperRepo.getNewImageList();
   _images.addAll(newImages);
   notifyListeners();
  }




}