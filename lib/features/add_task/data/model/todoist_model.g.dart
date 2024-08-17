// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoistModelAdapter extends TypeAdapter<TodoistModel> {
  @override
  final int typeId = 0;

  @override
  TodoistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoistModel(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      date: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodoistModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
