// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class taskAdapter extends TypeAdapter<task> {
  @override
  final int typeId = 1;

  @override
  task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return task(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      isdone: fields[2] as bool,
      time: fields[3] as DateTime,
      taskType: fields[4] as TaskType,
    );
  }

  @override
  void write(BinaryWriter writer, task obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.isdone)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.taskType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is taskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
