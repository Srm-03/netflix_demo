import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:streaming_app/datamodel/datamodel.dart';
import 'package:streaming_app/products_page/productpage.dart';

class TVMazeSearchController extends GetxController {
  var isLoading = false.obs;
  var searchResults = <StreamingApp>[].obs;

  // Method to search shows using the TVMaze API and map to StreamingApp model
  Future<void> searchShows(String searchTerm) async {
    if (searchTerm.isEmpty) {
      searchResults.clear();
      return;
    }

    isLoading.value = true;

    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        searchResults.value =
            data.map((json) => StreamingApp.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch search results');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  void goTosearchdetailscreen(Show show) {
    Get.to(() => ShowDetailScreen(show: show));
  }
}
