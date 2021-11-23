// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListDataAdapter extends TypeAdapter<ListData> {
  @override
  final int typeId = 0;

  @override
  ListData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListData(
      listTitle: fields[0] as String?,
      color: fields[1] != null
          ? Color(int.parse(fields[1].split('(0x')[1].split(')')[0], radix: 16))
          : Colors.blueAccent,
      todos: (fields[2] as List).cast<TodoStructure>(),
    );
  }

  @override
  void write(BinaryWriter writer, ListData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.listTitle)
      ..writeByte(1)
      ..write(obj.color.toString())
      ..writeByte(2)
      ..write(obj.todos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoStructureAdapter extends TypeAdapter<TodoStructure> {
  @override
  final int typeId = 1;

  @override
  TodoStructure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoStructure(
      title: fields[0] as String,
    )..statusCompleted = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, TodoStructure obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.statusCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoStructureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
