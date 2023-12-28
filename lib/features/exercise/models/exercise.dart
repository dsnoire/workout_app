import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'exercise.freezed.dart';

part 'exercise.g.dart';

@freezed
class Exercise with _$Exercise {
  @HiveType(typeId: 2)
  factory Exercise({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
  }) = _Exercise;
}
