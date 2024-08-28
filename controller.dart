import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:streaming_app/datamodel/datamodel.dart';
import 'package:streaming_app/products_page/productpage.dart';

class StreamingAppController extends GetxController {
  var streamingApps = <StreamingApp>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStreamingApps();
  }

  void fetchStreamingApps() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      log("response : ${response.statusCode}");
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        log("$jsonResponse");
        final streamingAppList = List<StreamingApp>.from(
            jsonResponse.map((data) => StreamingApp.fromJson(data)).toList());
        log("$streamingAppList");
        streamingApps.value = streamingAppList;
      } else {
        // Handle error
        Get.snackbar('Error', 'Failed to fetch streaming ');
      }
    } catch (e, s) {
      log("error $e $s");
      Get.snackbar('Error', 'Failed to fetch streaming apps');
    } finally {
      isLoading(false);
    }
  }

  void goToShowDetails(Show show) {
    Get.to(() => ShowDetailScreen(show: show));
  }
}
