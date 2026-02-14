import 'package:musicapp/model/musicapp.dart';

class MusicState {
  final bool? isPlaying;
  final int? currentIndex;
  final Duration? position;
  final Duration? duration;
  // ignore: non_constant_identifier_names
  final List<Musicapp>? ListMusic;
  // ignore: non_constant_identifier_names
  final List<Musicapp>? ListMusic1;
  final bool allOrFavorite;

  const MusicState({
    required this.isPlaying,
    this.currentIndex,
    this.position,
    this.duration,
    // ignore: non_constant_identifier_names
    this.ListMusic = const [],
    // ignore: non_constant_identifier_names
    this.ListMusic1 = const [],
    this.allOrFavorite =false,
  });

  MusicState copyWith({
    bool? isPlaying,
    int? currentIndex,
    // ignore: non_constant_identifier_names
    Duration? Position,
    Duration? duration,
    List<Musicapp>? listMusic,
    List<Musicapp>? listMusic1,
    // ignore: non_constant_identifier_names
    bool? AllOraFavorite, 
  }) {
    return MusicState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentIndex: currentIndex ?? this.currentIndex,
      // ignore: unnecessary_this
      position: Position ?? this.position,
      duration: duration ?? this.duration,
      // ignore: unnecessary_this
      ListMusic: listMusic ?? this.ListMusic,
      // ignore: unnecessary_this
      ListMusic1: listMusic1 ?? this.ListMusic1,
      // ignore: unnecessary_this
      allOrFavorite: AllOraFavorite ?? this.allOrFavorite,
    );
  }
}
