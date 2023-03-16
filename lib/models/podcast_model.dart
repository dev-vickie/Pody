class PodcastItem {
  final String name;
  final String producer;
  final String date;
  final String pictureUrl;
  PodcastItem({
    required this.name,
    required this.producer,
    required this.date,
    required this.pictureUrl,
  });
}

final List<PodcastItem> podcasts = [
  PodcastItem(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
   PodcastItem(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
       PodcastItem(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
       PodcastItem(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
];
