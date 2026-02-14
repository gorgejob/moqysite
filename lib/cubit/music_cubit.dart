import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/cubit/future_cubot/music_cubit.dart';
import 'package:musicapp/cubit/music_state.dart';
import 'package:musicapp/model/musicapp.dart';

// ملاحظة: تأكد من أن الـ Notification ممررة بشكل صحيح في مشروعك
// سأفترض أنها دالة خارجية تقوم بتحديث الـ ConcatenatingAudioSource

class MusicCubit extends Cubit<MusicState> {
  MusicCubit()
      : super(
          const MusicState(
            isPlaying: false,
            currentIndex: 0,
            allOrFavorite: true, // true تعني عرض الكل، false تعني المفضلة
            position: Duration.zero,
            ListMusic: [],
          ),
        ) {
    _init();
  }

  final AudioPlayer _player = AudioPlayer();
  
  // القائمة الكاملة (المرجع الدائم)
  List<Musicapp> _allSongs = []; 
  // القائمة المعروضة حالياً (للبحث أو التصفية)
  List<Musicapp> _currentDisplayList = []; 
  
  late Box<Musicapp> box;

  Future<void> _init() async {
    box = Hive.box<Musicapp>('musicapp');
    
    if (box.isEmpty) {
      await box.addAll(Musicapp.music);
    }

    _allSongs = box.values.toList();
    _currentDisplayList = List.from(_allSongs);

    emit(state.copyWith(listMusic: _currentDisplayList));
    
    // إعداد المشغل
    _updatePlayerSource(_currentDisplayList);
    _setupStreams();
  }

  void _setupStreams() {
    // مراقبة حالة التشغيل
    _player.playerStateStream.listen((playerState) {
      emit(state.copyWith(isPlaying: playerState.playing));
    });

    // مراقبة الوقت الحالي
    _player.positionStream.listen((pos) {
      emit(state.copyWith(Position: pos));
    });

    // مراقبة المدة الكلية
    _player.durationStream.listen((dur) {
      emit(state.copyWith(duration: dur ?? Duration.zero));
    });

    // مراقبة الأغنية الحالية
    _player.currentIndexStream.listen((index) {
      if (index != null) {
        emit(state.copyWith(currentIndex: index));
      }
    });
  }

  // --- منطق التبديل بين الكل والمفضلة ---
  void toggleViewMode(bool isfavorite) {
    final newMode = isfavorite;
    _refreshList(newMode: newMode);
  }

  // دالة موحدة لتحديث القائمة بناءً على الوضع الحالي
  void _refreshList({bool? newMode, String query = ""}) {
    final isAllMode = newMode ?? state.allOrFavorite;
    
    // 1. التصفية حسب الوضع (كل أو مفضلة)
    List<Musicapp> filtered = isAllMode 
        ? List.from(_allSongs) 
        : _allSongs.where((m) => m.isFavorite).toList();

    // 2. التصفية حسب البحث (إذا وجد نص)
    if (query.isNotEmpty) {
      filtered = filtered
          .where((m) => m.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    _currentDisplayList = filtered;
    
    // تحديث المشغل والقائمة في الـ UI
    _updatePlayerSource(_currentDisplayList);
    emit(state.copyWith(
      AllOraFavorite: isAllMode,
      listMusic: _currentDisplayList,
    ));
  }

  // --- البحث ---
  Future<void> search(String title) async {
    _refreshList(query: title);
  }

  // --- الإعجاب (Favorite) ---
  Future<void> changeLike(Musicapp musicItem) async {
    // نجد العنصر في القائمة الأساسية لتحديثه في Hive
    final index = _allSongs.indexWhere((item) => item.name == musicItem.name);
    
    if (index != -1) {
      _allSongs[index].isFavorite = !_allSongs[index].isFavorite;
      await _allSongs[index].save();
      
      // إعادة تحديث العرض الحالي
      _refreshList();
    }
  }

  // تحديث مصدر الصوت في Just Audio
  void _updatePlayerSource(List<Musicapp> songs) {
    // هنا استدعِ دالة الـ Notification أو الـ Sequence الخاصة بك
    notication(_player, songs); 
  }

  // --- التحكم في المشغل ---
  void play() => _player.play();
  void pause() => _player.pause();
  void seek(Duration duration) => _player.seek(duration);
  void seekToNext() => _player.seekToNext();
  void seekToPrevious() => _player.seekToPrevious();
  void stop() => _player.stop();

  Future<void> playSelectedMusic(Musicapp selectedMusic) async {
    int index = _currentDisplayList.indexOf(selectedMusic);
    if (index != -1) {
      await _player.seek(Duration.zero, index: index);
      _player.play();
    }
  }

  @override
  Future<void> close() async {
    await _player.dispose();
    return super.close();
  }
}