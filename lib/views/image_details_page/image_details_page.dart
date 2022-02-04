import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/core/utils/color_resources.dart';
import 'package:wallpaper_app/data/provider/image_details_provider.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({Key? key,required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageDetailsProvider>(builder: (ctx,provider,child)=>
        WillPopScope(
          onWillPop: () async {
            if (provider.isDialOpen.value) {
              provider.isDialOpen.value = false;
              return false;
            } else {
              return true;
            }
          },
          child: SafeArea(
              child: Scaffold(
                body: Center(
                  child: provider.isLoading?const CircularProgressIndicator(color: Colors.red,):PhotoView(
                    imageProvider: NetworkImage(imageUrl),
                    loadingBuilder: (context, event) => Center(
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          value: event == null ? 0 : 100,
                        ),
                      ),
                    ),
                  ),
                ),
                floatingActionButton: SpeedDial(
                  animatedIcon: AnimatedIcons.menu_close,
                  backgroundColor:ColorResources.fabBackgroundColor,
                  overlayColor:ColorResources.fabOverlayColor,
                  overlayOpacity: 0.4,
                  //closeManually: true,
                  animationSpeed: 600,
                  closeDialOnPop: true,
                  spacing: 12,
                  spaceBetweenChildren: 12,
                  children: [
                    SpeedDialChild(
                      child: const Icon(Icons.download_outlined),
                      label: 'Download',
                      onTap: () => provider.downloadImage(context, imageUrl),
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.share),
                      label: 'Share',
                      onTap: () => provider.shareImage(context, imageUrl),
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.wallpaper_outlined),
                      label: 'Make it Wallpaper',
                      onTap: () => provider.makeImageAsWallpaper(context, imageUrl),
                    ),
                  ],
                ),
              )),
        ));
  }
}
