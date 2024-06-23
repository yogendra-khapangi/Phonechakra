import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonechakra/models/aboutus.dart';
import 'package:phonechakra/models/categories.dart';
import 'package:phonechakra/models/recent_listing.dart';
import 'package:phonechakra/models/search_option.dart';
import 'package:phonechakra/service/search.dart';
import 'package:phonechakra/utils/texteditingcontroller.dart';

class SearchsController extends GetxController {
  var loading = false.obs;
  var aboutus = AboutUsModel(data: null).obs;

  var limitcategories = CategoriesModel(data: []).obs;
  var limitrecentlisting = RecentlylistingModel(data: []).obs;

  var listdata = RecentlylistingModel(data: []).obs;
  var onlymunicipalitylist = RecentlylistingModel(data: []).obs;
  var categories = CategoriesModel(data: []).obs;
  var categoriessearch = CategoriesModel(data: []).obs;

  var searchanythinglist = SearchOptionsModel(data: []).obs;
  var searchmunicipalitylist = SearchOptionsModel(data: []).obs;
  var categoriessearchlist = SearchOptionsModel(data: []).obs;

  // var homesearchlist = RecentlylistingModel(data: []).obs;
  // var particularsearchlist = RecentlylistingModel(data: []).obs;
  // var recentlisting = RecentlylistingModel(data: []).obs;

  Future<bool> showExitDialog() async {
    return await Get.dialog(
          AlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text(
              'Are you sure you want to exit the app?',
              style: TextStyle(fontSize: 18),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: const Text('Exit'),
              ),
            ],
          ),
        ) ??
        false;
  }

//get aboutdata
  Future getAboutus() async {
    try {
      loading(true);
      var data = await SearchServices.getAboutus();

      if (data != null) {
        aboutus.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

//get limit categories
  Future getLimitCategories() async {
    try {
      loading(true);
      var data = await SearchServices.getLimitCategories();

      if (data != null) {
        limitcategories.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

//get limit categories
  Future getLimitRecentListing() async {
    try {
      loading(true);
      var data = await SearchServices.getLimitRecentListing();

      if (data != null) {
        limitrecentlisting.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

//categories
  Future getCategorie() async {
    try {
      loading(true);
      var data = await SearchServices.getCategories();

      if (data != null) {
        categories.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

//recent listing
  Future getRecentListng() async {
    try {
      loading(true);
      var data = await SearchServices.getRecentListing();

      if (data != null) {
        listdata.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

// list data
  Future getList(slug) async {
    try {
      loading(true);
      var data = await SearchServices.getList(slug);

      if (data != null) {
        listdata.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

  //search anything..
  Future getSearchAnything() async {
    try {
      loading(true);
      var data = await SearchServices.getSearchAnything();

      if (data != null) {
        searchanythinglist.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

  //search categories option
  Future getSearchCategoriesListOptions() async {
    try {
      loading(true);
      var data = await SearchServices.getSearchCategoriesListOptions();

      if (data != null) {
        categoriessearchlist.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

  //search categories shows after search
  Future getSearchCategoriesList(title) async {
    try {
      loading(true);
      var data = await SearchServices.getSearchCategoriesList(title);

      if (data != null) {
        categories.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
      debugPrint("${categories.value.data}");
    }
  }

  //search particulat by municipality..
  Future getSearchByMunicipalityList(munici) async {
    try {
      loading(true);
      var data = await SearchServices.getSearchByMunicipalityList(munici);

      if (data != null) {
        listdata.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

  //search particulat by municipality..
  Future getSearchListbymunicipality(searchbar, cat) async {
    try {
      loading(true);
      var data =
          await SearchServices.getSearchListbymunicipality(searchbar, cat);

      if (data != null) {
        onlymunicipalitylist.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

  //home search..
  Future getHomeSearchs(slug) async {
    try {
      loading(true);
      var data = await SearchServices.getHomeSearch(slug);

      if (data != null) {
        listdata.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

  // municipalitySearchList..
  Future getMunicipalityList() async {
    try {
      loading(true);
      var data = await SearchServices.getMunicipalityList();

      if (data != null) {
        searchmunicipalitylist.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      loading(false);
    }
  }

  //anything search(home searchbar)
  final state = "Please Select State".obs;
  List<String> getFilteredStateList(String query) {
    List<String> matches = [];
    matches.addAll(searchanythinglist.value.data);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  void updateState(String suggestion) {
    AppTextEditingController.searchanything.text = suggestion;
    AppTextEditingController.searchbycategory.text = suggestion;
    AppTextEditingController.searchbyplace.text = suggestion;
    state.value = suggestion;
  }

  //for municipality
  List<String> getFilteredStateListformunnicipality(String query) {
    List<String> matches = [];
    matches.addAll(searchmunicipalitylist.value.data);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  //for municipality
  List<String> getFilteredStateListforcategorieslist(String query) {
    List<String> matches = [];
    matches.addAll(categoriessearchlist.value.data);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  void onInit() {
    super.onInit();
    getSearchCategoriesListOptions();
    getMunicipalityList();
    getLimitCategories();
    getLimitRecentListing();
    getAboutus();
    getCategorie();
    getRecentListng();
    getSearchAnything();
  }
}
