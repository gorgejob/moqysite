import 'dart:io';

import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musicapp/model/musicapp.dart';
import 'package:path_provider/path_provider.dart';

Future<void> notication(AudioPlayer player, List<Musicapp> playerlist) async {
  try {
    final arturi = await _assetToFileUri("assets/gorge5.jpg");

    await player.setAudioSource(
      // ignore: deprecated_member_use
      ConcatenatingAudioSource(
        children:
            playerlist
                .map(
                  (audio) => AudioSource.asset(
                    audio.url,
                    tag: MediaItem(
                      id: audio.url,
                      album: "Music App",
                      title: audio.name,
                      artUri: arturi,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  } catch (E) {
    return;
  }
}

Future<Uri> _assetToFileUri(String assetPath) async {
  final byteData = await rootBundle.load(assetPath);
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/${assetPath.split('/').last}');
  await file.writeAsBytes(byteData.buffer.asUint8List());
  return file.uri;
}
