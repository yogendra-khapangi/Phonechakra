import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/utils/routes.dart';
import 'package:phonechakra/utils/texteditingcontroller.dart';
import 'package:phonechakra/widgets/card.dart';
import 'package:phonechakra/widgets/searchwidget/categories_search.dart';
import 'package:phonechakra/widgets/shimmer.dart';
import '../../controller/searchs.dart';

// ignore: must_be_immutable
class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  var searchController = Get.find<SearchsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CategoriesSearchBar(
                  searchbarname: "municipality",
                  appcontroller: AppTextEditingController.searchbycategory,
                  hintText: "Search Caterory",
                ),
                Obx(() {
                  if (searchController.loading.value == true) {
                    return const ShimmereffetForpopular();
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "${searchController.categories.value.data.length}",
                                  style: const TextStyle(color: Colors.black)),
                              const TextSpan(
                                  text: " Records Found",
                                  style: TextStyle(color: Colors.grey)),
                            ]),
                          ),
                        ),
                        SizedBox(
                          child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  searchController.categories.value.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (contex, index) {
                                var listdata =
                                    searchController.categories.value.data;
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoute.particularlist,
                                        arguments: {
                                          "title": listdata[index].title,
                                        });
                                    searchController
                                        .getList(listdata[index].slug);
                                  },
                                  child: CardOne(
                                    totalcities: listdata[index].totalCities,
                                    totallisting: listdata[index].totalListings,
                                    title: listdata[index].title,
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
