// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musicapp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicappAdapter extends TypeAdapter<Musicapp> {
  @override
  final int typeId = 0;

  @override
  Musicapp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Musicapp(
      url: fields[0] as String,
      name: fields[1] as String,
      isFavorite: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Musicapp obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicappAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
