import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/binding/search.dart';
import 'package:phonechakra/utils/colors.dart';
import 'package:phonechakra/utils/routes.dart';
import 'package:phonechakra/views/aboutus/aboutus.dart';
import 'package:phonechakra/views/allList/all_list.dart';
import 'package:phonechakra/views/categories/categories.dart';
import 'package:phonechakra/views/particular_list/Particularlist.dart';
import 'package:phonechakra/views/home.dart';
import 'package:phonechakra/views/particular_list/nexttoparticular.dart';
import 'package:phonechakra/views/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhoneChakra',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.secondaryColor),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColor.backgroundColor),
      home: const SplashView(),
      initialRoute: AppRoute.splash,
      getPages: [
        GetPage(name: AppRoute.splash, page: () => const SplashView()),
        GetPage(
            name: AppRoute.home,
            page: () => HomeViews(),
            binding: SearchBindings()),
        GetPage(name: AppRoute.categories, page: () => CategoriesPage()),
        GetPage(name: AppRoute.particularlist, page: () => ParticularLists()),
        GetPage(name: AppRoute.resentlist, page: () => AllListShow()),
        GetPage(name: AppRoute.aboutus, page: () => Aboutusview()),
        GetPage(name: AppRoute.nexttopaticular, page: () => NextToParticular()),
      ],
    );
  }
}
