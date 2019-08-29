class Post {
  final String forumImage;
  final String forumName;

  final String postId;
  final String postTitle;
  final String postDescription;
  final int numberOfVotes;
  final int numberOfComments;

  const Post({
    this.forumImage,
    this.forumName,
    this.postId,
    this.postTitle,
    this.postDescription,
    this.numberOfVotes,
    this.numberOfComments
  });
}