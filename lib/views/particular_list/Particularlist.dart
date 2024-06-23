import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/controller/searchs.dart';
import 'package:phonechakra/utils/texteditingcontroller.dart';
import 'package:phonechakra/widgets/card_2.dart';
import 'package:phonechakra/widgets/searchwidget/patticularlistsearchbymuni.dart';
import 'package:phonechakra/widgets/shimmer.dart';

// ignore: must_be_immutable
class ParticularLists extends StatelessWidget {
  ParticularLists({super.key});
  var listbyCategoriesController = Get.find<SearchsController>();
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(data["title"])),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //search bar
                Particularsearchbymunicipality(
                  title: data["title"],
                  searchbarname: "municipality",
                  appcontroller: AppTextEditingController.searchbyplace,
                  hintText: "Filter By Municipality",
                ),
                Obx(() {
                  if (listbyCategoriesController.loading.value == true) {
                    return const ShimmereffetForRecentListing();
                  } else {
                    return Column(
                      children: [
                        ListTile(
                          title: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "${listbyCategoriesController.listdata.value.data.length}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              const TextSpan(
                                  text: " Records Found",
                                  style: TextStyle(color: Colors.grey)),
                            ]),
                          ),
                        ),
                        SizedBox(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listbyCategoriesController
                                  .listdata.value.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var list = listbyCategoriesController
                                    .listdata.value.data;
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
