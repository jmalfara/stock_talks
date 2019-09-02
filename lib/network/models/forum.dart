import 'package:stock_talks/network/models/post.dart';

class Forum {
  final String id;
  final String name;
  final String description;
  final String image;
  final int numberOfPosts;
  final int numberOfFollowers;
  final bool following;
  final List<Post> latestPosts;

  Forum({
    this.id,
    this.name,
    this.description,
    this.image,
    this.latestPosts,
    this.numberOfPosts,
    this.numberOfFollowers,
    this.following = false
  });
}