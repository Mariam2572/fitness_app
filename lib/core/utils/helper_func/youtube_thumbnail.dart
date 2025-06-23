 String getYouTubeThumbnail(String youtubeLink) {
  final uri = Uri.parse(youtubeLink);
  final videoId = uri.pathSegments.last;
  return "https://img.youtube.com/vi/$videoId/0.jpg";
}