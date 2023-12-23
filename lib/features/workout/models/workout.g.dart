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
      weekdays: (fields[3] as Map).cast<String, bool>(),
      color: (fields[4] as Map).cast<int, bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$WorkoutImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.schedule)
      ..writeByte(3)
      ..write(obj.weekdays)
      ..writeByte(4)
      ..write(obj.color);
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
