import 'package:get_it/get_it.dart';
import 'package:wallpaper_app/core/helper/api_client.dart';
import 'package:wallpaper_app/data/provider/wallpaper_provider.dart';
import 'package:wallpaper_app/data/repository/wallpaper_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //core
  sl.registerLazySingleton(() => ApiClient());

  // Repository
  sl.registerLazySingleton(() => WallPaperRepo(apiClient: sl()));

  // Provider
  sl.registerFactory(() => WallPaperProvider(wallPaperRepo: sl()));

  // External
 /* final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);*/

}
