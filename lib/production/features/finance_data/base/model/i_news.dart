abstract class INews {
  String title;
  String link;
  String imageUrl;
  String? date;

  INews(
      {required this.title,
      required this.link,
      required this.imageUrl,
      this.date});
}
