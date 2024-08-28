import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:streaming_app/datamodel/datamodel.dart';

class ShowDetailScreen extends StatelessWidget {
  final Show show;

  const ShowDetailScreen({required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.laptop_chromebook)),
          IconButton(onPressed: () {}, icon: Icon(Icons.download)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with play button
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    show.image!.medium!,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      size: 64,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    onPressed: () {
                      // Play button action
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    child: ClipRRect(
                      child: Image.asset("assets/logo/imdb.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(show.rating!.average!.toString()),
                  )
                ],
              ),

              // Title
              Text(
                show.name!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Play and Download Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Play button action
                      },
                      icon: Icon(Icons.play_arrow),
                      label: Text('Play'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Download button action
                      },
                      icon: Icon(Icons.download),
                      label: Text('Download'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Description
              ReadMoreText(
                show.summary!.replaceAll(RegExp(r'<[^>]*>'), ''),
                style: TextStyle(fontSize: 16),
                trimLines: 2,
              ),

              SizedBox(height: 16),

              // Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.add),
                      SizedBox(height: 4),
                      Text('My List'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.thumb_up),
                      SizedBox(height: 4),
                      Text('Rate'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share),
                      SizedBox(height: 4),
                      Text('Share'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           if (show.image != null)
    //             Container(
    //                 decoration:
    //                     BoxDecoration(borderRadius: BorderRadius.circular(20)),
    //                 child: Image.network(show.image!.medium!)),
    //           SizedBox(height: 16),
    //           Text(show.name!,
    //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    //           SizedBox(height: 8),
    //           Text(show.summary!, style: TextStyle(fontSize: 16)),
    //           // Add more details about the show here
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
