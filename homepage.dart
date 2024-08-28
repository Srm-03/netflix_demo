import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/controller/controller.dart';
import 'package:streaming_app/controller/search_controller.dart';
import 'package:streaming_app/products_page/searchpage.dart';

class StreamingAppListScreen extends StatelessWidget {
  final StreamingAppController streamingAppController =
      Get.put(StreamingAppController());

  StreamingAppListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: Image.asset("assets/logo/netflix_logo.png")),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.laptop_chromebook)),
          IconButton(onPressed: () {}, icon: Icon(Icons.download)),
          IconButton(
              onPressed: () => Get.to(() => TVMazeSearchScreen()),
              icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(label: Text("Tv Shows")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(label: Text("Movies")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(label: Text("Categories")),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'All Movies',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (streamingAppController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (streamingAppController.streamingApps.isEmpty) {
                return Center(child: Text('No streaming apps available'));
              } else {
                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items in each row
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.7, // Aspect ratio of each item
                  ),
                  itemCount: streamingAppController.streamingApps.length,
                  itemBuilder: (context, index) {
                    final streamingApp =
                        streamingAppController.streamingApps[index];
                    return GestureDetector(
                      onTap: () => streamingAppController
                          .goToShowDetails(streamingApp.show!),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            // Background Image
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: streamingApp.show!.image?.medium != null
                                    ? Image.network(
                                        streamingApp.show!.image!.medium!,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        color: Colors.grey,
                                        child: Center(child: Text('No Image')),
                                      ),
                              ),
                            ),
                            // Play Button in the middle
                            Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 50,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            // Show Name and Score at the bottom
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      streamingApp.show!.name ?? 'Unknown',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Score: ${streamingApp.score?.toStringAsFixed(1) ?? 'N/A'}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}


// class StreamingAppListScreen extends StatelessWidget {
//   final StreamingAppController streamingAppController =
//       Get.put(StreamingAppController());

//   StreamingAppListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//             onPressed: () {},
//             icon: Image.asset("assets/logo/netflix_logo.png")),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.laptop_chromebook)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.download)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//         ],
//       ),
//       body: Obx(() {
//         if (streamingAppController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (streamingAppController.streamingApps.isEmpty) {
//           return Center(child: Text('No streaming apps available'));
//         } else {
//           return ListView.builder(
//               itemCount: streamingAppController.streamingApps.length,
//               itemBuilder: (context, index) {
//                 final streamingApp =
//                     streamingAppController.streamingApps[index];
//                 return GridView.builder(
//                     padding: const EdgeInsets.all(8.0),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of items in each row
//                       crossAxisSpacing: 8.0,
//                       mainAxisSpacing: 8.0,
//                       childAspectRatio: 0.7, // Aspect ratio of each item
//                     ),
//                     itemCount: streamingAppController.streamingApps.length,
//                     itemBuilder: (context, index) {
//                       final streamingApp =
//                           streamingAppController.streamingApps[index];
//                       return GestureDetector(
//                           onTap: () => streamingAppController
//                               .goToShowDetails(streamingApp.show!),
//                           child: Card(
//                               elevation: 4,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               child: Stack(children: [
//                                 // Background Image
//                                 Positioned.fill(
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(15),
//                                     child: streamingApp.show!.image?.medium !=
//                                             null
//                                         ? Image.network(
//                                             streamingApp.show!.image!.medium ??
//                                                 "assets/logo/netflix_logo.png",
//                                             fit: BoxFit.cover,
//                                           )
//                                         : Container(
//                                             color: Colors.grey,
//                                             child:
//                                                 Center(child: Text('No Image')),
//                                           ),
//                                   ),
//                                 ),
//                                 // Play Button in the middle
//                                 Center(
//                                   child: Icon(
//                                     Icons.play_circle_fill,
//                                     size: 50,
//                                     color: Colors.white.withOpacity(0.8),
//                                   ),
//                                 ),
//                                 // Show Name and Score at the bottom
//                                 Positioned(
//                                     bottom: 0,
//                                     left: 0,
//                                     right: 0,
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.black.withOpacity(0.7),
//                                           borderRadius: BorderRadius.only(
//                                             bottomLeft: Radius.circular(15),
//                                             bottomRight: Radius.circular(15),
//                                           ),
//                                         ),
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Text(
//                                                 streamingApp.show!.name!,
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 4),
//                                               Text(
//                                                 'Score: ${streamingApp.score?.toStringAsFixed(1) ?? 'N/A'}',
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ),
//                                             ])))
//                               ])));
//                     });
//               });
//         }
//       }),
//     );
//   }
// }
