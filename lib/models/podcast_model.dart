class Podcast {
  final String name;
  final String producer;
  final String date;
  final String pictureUrl;
  Podcast({
    required this.name,
    required this.producer,
    required this.date,
    required this.pictureUrl,
  });
}

final List<Podcast> podcasts = [
  Podcast(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
   Podcast(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
       Podcast(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
       Podcast(
      name: 'Building Scrollable Experiences',
      producer: 'victor',
      date: DateTime.now().toIso8601String(),
      pictureUrl: 'assets/vmimage.png'),
];
