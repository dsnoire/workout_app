// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutImplAdapter extends TypeAdapter<_$WorkoutImpl> {
  @override
  final int typeId = 0;

  @override
  _$WorkoutImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WorkoutImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      schedule: fields[2] as WorkoutScheduleEnum,
    );
  }

  @override
  void write(BinaryWriter writer, _$WorkoutImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.schedule);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}