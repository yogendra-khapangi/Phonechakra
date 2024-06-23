import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/controller/searchs.dart';
import 'package:phonechakra/utils/routes.dart';
import 'package:phonechakra/widgets/card.dart';
import 'package:phonechakra/widgets/shimmer.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = Get.find<SearchsController>();
    return Obx(() {
      if (searchController.loading.value == true) {
        return const ShimmereffetForpopular();
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchController.limitcategories.value.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (contex, index) {
                    var listdata = searchController.limitcategories.value.data;
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.particularlist,
                            arguments: {"title": listdata[index].title});

                        searchController.getList(listdata[index].slug);
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
    });
  }
}
