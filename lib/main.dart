import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/views/home_page/home_page.dart';

import 'data/provider/image_details_provider.dart';
import 'data/provider/wallpaper_provider.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<WallPaperProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ImageDetailsProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Real Tor',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


