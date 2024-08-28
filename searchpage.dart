import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/controller/search_controller.dart';

// Import the updated controller

class TVMazeSearchScreen extends StatelessWidget {
  final TVMazeSearchController searchController =
      Get.put(TVMazeSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Shows'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                searchController.searchShows(value);
              },
            ),
            SizedBox(height: 16),

            // Search Results
            Expanded(
              child: Obx(() {
                if (searchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (searchController.searchResults.isEmpty) {
                  return Center(child: Text('No results found'));
                } else {
                  return ListView.builder(
                    itemCount: searchController.searchResults.length,
                    itemBuilder: (context, index) {
                      final streamingApp =
                          searchController.searchResults[index];
                      final show = streamingApp.show;
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(show?.name ?? 'Unknown Title'),
                          subtitle: Text(show?.summary
                                  ?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                              'No description available'),
                          leading: show?.image?.medium != null
                              ? Image.network(show!.image!.medium!)
                              : Image.asset(
                                  'assets/no_image.png'), // Placeholder if no image
                          onTap: () => searchController
                              .goTosearchdetailscreen(streamingApp.show!),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
