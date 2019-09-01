/*
 * Feed Screen
 * This screen is responsible for displaying the users feed for followed stock posts
 * Also for finding stocks to follow
 * */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_talks/network/models/post.dart';
import 'package:stock_talks/components/feedItemTile.dart';
import 'package:stock_talks/screen/post/postScreen.dart';

class FeedScreen extends StatefulWidget {

  const FeedScreen();

  @override
  State<StatefulWidget> createState() {
    return _FeedScreen();
  }
}

class _FeedScreen extends State<FeedScreen> {
  // TODO Hookup API
  final items = List<Post>.generate(
    1200,
        (i) => Post(
          forumImage: "https://picsum.photos/id/$i/50/50/",
          forumName: "Sender $i",
          postId: "$i",
          postTitle: "Message body $i",
          postDescription: "Description: DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription DescriptionDescriptionDescriptionDescriptionDescriptionDescription DescriptionDescription$i",
          numberOfVotes: i*126,
          numberOfComments: i*22
        ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FeedItemTile(
            item: items[index],
            onUpVote: upVote,
            onDownVote: downVote,
            onShare: share,
            onPressed: launchPostScreen,
          );
        },
      )
    );
  }

  void upVote(Post item) {
    // TODO Hookup API
    print("UpVote: " + item.postTitle);
  }

  void downVote(Post item) {
    // TODO Hookup API
    print("DownVote: " + item.postTitle);
  }

  void share(Post item) {
    // TODO Hookup API
    print("Share: " + item.postTitle);
  }

  void launchPostScreen(Post item) {
    print("Launch Post: " + item.postId);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostScreen(postItem: item))
    );
  }
}