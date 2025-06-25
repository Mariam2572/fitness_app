String getYouTubeThumbnail(String youtubeLink) {
  try {
    final uri = Uri.parse(youtubeLink);
    final videoId = uri.queryParameters['v'] ??
        (uri.pathSegments.isNotEmpty ? uri.pathSegments.last : null);

    if (videoId == null || videoId.isEmpty) {
      throw const FormatException('Invalid YouTube link');
    }

    return "https://img.youtube.com/vi/$videoId/0.jpg";
  } catch (e) {
    return ''; // or return a placeholder image URL
  }
}
