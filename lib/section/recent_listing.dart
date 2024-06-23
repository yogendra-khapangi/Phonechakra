import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/controller/searchs.dart';
import 'package:phonechakra/widgets/card_2.dart';
import 'package:phonechakra/widgets/shimmer.dart';

// ignore: must_be_immutable
class RecentListingSection extends StatelessWidget {
  RecentListingSection({super.key});
  var recentListingController = Get.find<SearchsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (recentListingController.loading.value == true) {
        return const ShimmereffetForRecentListing();
      } else {
        return SizedBox(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  recentListingController.limitrecentlisting.value.data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var list =
                    recentListingController.limitrecentlisting.value.data;
                return RecentCard(
                  category: "${list[index].category}",
                  type: "${list[index].tag}",
                  name: "${list[index].name}",
                  image: "${list[index].profileImage}",
                  address: "${list[index].address}",
                  email: "${list[index].email}",
                  phone: "${list[index].phone}",
                  about: "${list[index].about}",
                );
              }),
        );
      }
    });
  }
}
