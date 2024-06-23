import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/controller/searchs.dart';
import 'package:phonechakra/section/popular.dart';
import 'package:phonechakra/section/recent_listing.dart';
import 'package:phonechakra/utils/colors.dart';
import 'package:phonechakra/utils/routes.dart';
import 'package:phonechakra/utils/texteditingcontroller.dart';
import 'package:phonechakra/widgets/logo.dart';
import 'package:phonechakra/widgets/searchbar.dart';

// ignore: must_be_immutable
class HomeViews extends StatelessWidget {
  HomeViews({super.key});
  var listbyCategoriesController = Get.find<SearchsController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => listbyCategoriesController.showExitDialog(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Logo(width: 200),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.aboutus);
                          },
                          child: const Icon(Icons.info_outline))
                    ],
                  ),

                  // Gap
                  const SizedBox(height: 14),
                  // Search Bar
                  SearchBarWidget(
                    searchbarname: "home",
                    appcontroller: AppTextEditingController.searchanything,
                    hintText: "Search for anything",
                  ),

                  // Top Categories
                  ListTile(
                    onTap: () {
                      listbyCategoriesController.getCategorie();
                      Get.toNamed(AppRoute.categories);
                    },
                    title: const Text(
                      "Popular Categories",
                      style: TextStyle(
                          fontSize: 14, color: AppColor.secondaryColor),
                    ),
                    subtitle: const Text(
                      "Browse Top Categories",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: const Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),

                  //populat card
                  const PopularCard(),

                  // Recent Listing Section
                  ListTile(
                    onTap: () {
                      listbyCategoriesController.getRecentListng();
                      Get.toNamed(AppRoute.resentlist,
                          arguments: {"title": "All Recent Lists"});
                    },
                    title: const Text(
                      "Recent Listing",
                      style: TextStyle(
                          fontSize: 14, color: AppColor.secondaryColor),
                    ),
                    subtitle: const Text(
                      "Browse Recent Listing",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: const Text("View all",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),

                  RecentListingSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
