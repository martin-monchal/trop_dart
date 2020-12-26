// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_beer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBeerAdapter extends TypeAdapter<HiveBeer> {
  @override
  final int typeId = 0;

  @override
  HiveBeer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBeer(
      id: fields[0] as int,
      publicationDate: fields[2] as DateTime,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBeer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.publicationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBeerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
