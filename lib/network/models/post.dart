class Post {
  final String id;
  final String title;
  final String description;
  final int numberOfUpVotes;
  final int numberOfComments;

  const Post({
    this.id,
    this.title,
    this.description,
    this.numberOfUpVotes,
    this.numberOfComments
  });
}