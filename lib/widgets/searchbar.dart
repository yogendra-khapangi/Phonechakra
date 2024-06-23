import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:phonechakra/controller/searchs.dart';
import 'package:phonechakra/utils/colors.dart';
import 'package:phonechakra/utils/routes.dart';
import 'package:phonechakra/utils/texteditingcontroller.dart';

// ignore: must_be_immutable
class SearchBarWidget extends StatelessWidget {
  TextEditingController? appcontroller;
  String? hintText;
  String? searchbarname;

  SearchBarWidget({
    @required this.appcontroller,
    @required this.hintText,
    @required this.searchbarname,
    super.key,
  });
  var searchController = Get.find<SearchsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchsController>(
      builder: (controller) {
        return Container(
          height: 40, // Set a fixed height or use appropriate constraints
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: TypeAheadField(
                    onSuggestionSelected: (String? sugg) {
                      debugPrint(sugg);
                      if (sugg != null) {
                        searchController.updateState(sugg);
                      }
                    },
                    itemBuilder: (context, String suggestions) {
                      ///list item builder
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                            height: 30,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(suggestions))),
                      );
                    },
                    suggestionsCallback: (value) {
                      /// returning filtered list
                      if (searchbarname == "home") {
                        return searchController.getFilteredStateList(value);
                      } else {
                        return searchController
                            .getFilteredStateListformunnicipality(value);
                      }
                    },
                    noItemsFoundBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No Search Data found!'),
                    ),
                    suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                        color: Colors.white,
                        elevation: 4.0,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        )),
                    textFieldConfiguration: TextFieldConfiguration(
                        cursorColor: AppColor.ancentColor,
                        controller: appcontroller,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            suffixIcon: appcontroller!.text.isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      appcontroller!.clear();
                                    },
                                    child: const Icon(Icons.clear))
                                : null,
                            hintText: hintText,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade200),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade200),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade200),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey.shade200)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey.shade200)))),
                  ),
                ),
              ),
              const SizedBox(width: 3),
              GestureDetector(
                onTap: () {
                  searchController.getHomeSearchs(
                      AppTextEditingController.searchanything.text);

                  if (AppTextEditingController.searchanything.text.isEmpty) {
                    // print("nothing");
                    Get.snackbar(
                      'Search',
                      'Type Some Text To Search....',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 3),
                      backgroundColor: Colors.grey[700],
                      colorText: Colors.white,
                    );
                  } else {
                    Get.toNamed(AppRoute.resentlist,
                        arguments: {"title": "All lists"});
                  }
                },
                child: const Icon(
                  Icons.search,
                  size: 32,
                  color: AppColor.ancentColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
