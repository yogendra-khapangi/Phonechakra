import 'package:flutter/material.dart';
import 'package:phonechakra/models/aboutus.dart';
import 'package:phonechakra/models/categories.dart';
import 'package:phonechakra/models/recent_listing.dart';
import 'package:phonechakra/models/search_option.dart';
import 'package:phonechakra/utils/api.dart';

class SearchServices {
  //get aboutus
  static Future getAboutus() async {
    try {
      var response = await Api.dio.get("about-us");

      if (response.statusCode == 200) {
        return AboutUsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("aboutus connection closed...");
    }
  }

  //get limit categories
  static Future getLimitCategories() async {
    try {
      var response = await Api.dio.get("limit-categories");

      if (response.statusCode == 200) {
        return CategoriesModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("categories connection closed...");
    }
  }

  //get limit RecentListing
  static Future getLimitRecentListing() async {
    try {
      var response = await Api.dio.get("limit-recent-listings");

      if (response.statusCode == 200) {
        return RecentlylistingModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("categories connection closed...");
    }
  }

  //get categories
  static Future getCategories() async {
    try {
      var response = await Api.dio.get("categories");

      if (response.statusCode == 200) {
        return CategoriesModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("getcategories connection closed...");
    }
  }

//get recent listing
  static Future getRecentListing() async {
    try {
      var response = await Api.dio.get("recent-listings");

      if (response.statusCode == 200) {
        return RecentlylistingModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("recent_listing connection closed...");
    }
  }

//get recent listing
  static Future getList(slug) async {
    try {
      var response = await Api.dio.get("category/$slug");

      if (response.statusCode == 200) {
        return RecentlylistingModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("recent_listing connection closed...");
    }
  }

//get search anything
  static Future getSearchAnything() async {
    try {
      var response = await Api.dio.get("search-options");

      if (response.statusCode == 200) {
        return SearchOptionsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("search_options connection closed...");
    }
  }

//get search categorieslist
  static Future getSearchCategoriesListOptions() async {
    try {
      var response = await Api.dio.get("category-options");

      if (response.statusCode == 200) {
        return SearchOptionsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("search_categories_options connection closed...");
    }
  }

//get search categorieslist
  static Future getSearchCategoriesList(title) async {
    try {
      var response = await Api.dio.get("category-search?q= $title ");

      if (response.statusCode == 200) {
        return CategoriesModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("search_categories_options with slug connection closed...");
    }
  }

//get Home Search
  static Future getHomeSearch(slug) async {
    try {
      var response = await Api.dio.get("search?q=$slug");

      if (response.statusCode == 200) {
        return RecentlylistingModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("HomeSearch connection closed...");
    }
  }

//get Home Search
  static Future getSearchListbymunicipality(searchbar, cat) async {
    try {
      var response =
          await Api.dio.get("municipality-category-search?q=$searchbar&c=$cat");

      if (response.statusCode == 200) {
        return RecentlylistingModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("HomeSearch connection closed...");
    }
  }

  //get municipalitylist
  static Future getMunicipalityList() async {
    try {
      var response = await Api.dio.get("municipality-options");

      if (response.statusCode == 200) {
        return SearchOptionsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("municipalitylist connection closed...");
    }
  }

  //get patticular search by municipalitylist
  static Future getSearchByMunicipalityList(municipality) async {
    try {
      var response = await Api.dio.get("municipality-search?q=$municipality");
      if (response.statusCode == 200) {
        return RecentlylistingModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("getSearchByMunicipalityList connection closed...");
    }
  }
}
