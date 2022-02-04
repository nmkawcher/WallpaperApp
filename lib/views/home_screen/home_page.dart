import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/data/provider/wallpaper_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<WallPaperProvider>(context,listen: false).initInitialValue();
    return SafeArea(
      child: Scaffold(
        body: buildWallPaperListView(context),
      ),
    );
  }

  buildWallPaperListView(context) {
    return Consumer<WallPaperProvider>(builder: (ctx, provider, child) {
       return GridView.builder(
         controller: provider.controller,
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.2 / 1.4),
         itemCount: provider.images.length,
           itemBuilder: (context,index){

             if (index == provider.images.length - 1) {
               return const Center(
                 child: CircularProgressIndicator(),
               );
             }
             return InkWell(
               onTap: () {

               },
               child: Container(
                 height: 100,
                 margin: const EdgeInsets.all(5),
                 child: CachedNetworkImage(
                   cacheManager: provider.customCacheManager,
                   imageUrl: provider.images[index].downloadUrl.toString(),
                   cacheKey: '${provider.images[index].downloadUrl.toString()}$index',
                   placeholder: _loader,
                   imageBuilder: (context, imageProvider) => Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         image: imageProvider,
                         fit: BoxFit.cover,
                         /*colorFilter:
                        ColorFilter.mode(Colors.red, BlendMode.colorBurn)*/),
                     ),
                   ),
                   errorWidget: _error,
                   fit: BoxFit.cover,
                 ),
               ),
             );
           }
       );
      },
    );
  }
  Widget _loader(BuildContext context, String url) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
  Widget _error(BuildContext context, String url, dynamic error) {
    return Container(decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(12)),child: const Center(child: Icon(Icons.error,color: Colors.red,)));
  }
}
