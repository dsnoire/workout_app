// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_schedule_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutScheduleEnumAdapter extends TypeAdapter<WorkoutScheduleEnum> {
  @override
  final int typeId = 1;

  @override
  WorkoutScheduleEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WorkoutScheduleEnum.fullBodyWorkout;
      case 1:
        return WorkoutScheduleEnum.pushPullLegs;
      case 2:
        return WorkoutScheduleEnum.upperLower;
      case 3:
        return WorkoutScheduleEnum.split;
      default:
        return WorkoutScheduleEnum.fullBodyWorkout;
    }
  }

  @override
  void write(BinaryWriter writer, WorkoutScheduleEnum obj) {
    switch (obj) {
      case WorkoutScheduleEnum.fullBodyWorkout:
        writer.writeByte(0);
        break;
      case WorkoutScheduleEnum.pushPullLegs:
        writer.writeByte(1);
        break;
      case WorkoutScheduleEnum.upperLower:
        writer.writeByte(2);
        break;
      case WorkoutScheduleEnum.split:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutScheduleEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
