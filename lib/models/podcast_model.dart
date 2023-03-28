// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PodcastItem {
  final String name;
  final String producer;
  final String date;
  final String audioUrl;
  final String audioPath;
  final String podcastId;
  PodcastItem({
    required this.name,
    required this.producer,
    required this.date,
    required this.audioUrl,
    required this.audioPath,
    required this.podcastId,
  });

  PodcastItem copyWith({
    String? name,
    String? producer,
    String? date,
    String? audioUrl,
    String? audioPath,
    String? podcastId,
  }) {
    return PodcastItem(
      name: name ?? this.name,
      producer: producer ?? this.producer,
      date: date ?? this.date,
      audioUrl: audioUrl ?? this.audioUrl,
      audioPath: audioPath ?? this.audioPath,
      podcastId: podcastId ?? this.podcastId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'producer': producer,
      'date': date,
      'audioUrl': audioUrl,
      'audioPath': audioPath,
      'podcastId': podcastId,
    };
  }

  factory PodcastItem.fromMap(Map<String, dynamic> map) {
    return PodcastItem(
      name: map['name'] as String,
      producer: map['producer'] as String,
      date: map['date'] as String,
      audioUrl: map['audioUrl'] as String,
      audioPath: map['audioPath'] as String,
      podcastId: map['podcastId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PodcastItem.fromJson(String source) => PodcastItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PodcastItem(name: $name, producer: $producer, date: $date, audioUrl: $audioUrl, audioPath: $audioPath, podcastId: $podcastId)';
  }

  @override
  bool operator ==(covariant PodcastItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.producer == producer &&
      other.date == date &&
      other.audioUrl == audioUrl &&
      other.audioPath == audioPath &&
      other.podcastId == podcastId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      producer.hashCode ^
      date.hashCode ^
      audioUrl.hashCode ^
      audioPath.hashCode ^
      podcastId.hashCode;
  }
}
