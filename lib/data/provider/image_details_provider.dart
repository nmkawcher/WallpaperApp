
import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/data/repository/image_details_repo.dart';

class ImageDetailsProvider with ChangeNotifier{


  bool isLoading=false;
  ImageDetailsRepo imageDetailsRepo;
  ImageDetailsProvider({required this.imageDetailsRepo});

  downloadImage(BuildContext context,String imageUrl){
    isLoading=true;
    notifyListeners();
    imageDetailsRepo.saveImage(context,imageUrl).then((value){
      isLoading=false;
      notifyListeners();
    });
  }

  shareImage(BuildContext context,String imageUrl){
    imageDetailsRepo.shareImage(context, imageUrl);
  }

  makeImageAsWallpaper(BuildContext context,String imageUrl){
    isLoading=true;
    notifyListeners();
    imageDetailsRepo.setWallpaper(context,imageUrl).then((value){
      isLoading=false;
      notifyListeners();
    });
  }

  final isDialOpen = ValueNotifier(false);
  void hideFabMenu(){
    isDialOpen.value=false;
  }
}