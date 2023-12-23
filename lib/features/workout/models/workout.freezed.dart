// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Workout {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  WorkoutScheduleEnum get schedule => throw _privateConstructorUsedError;
  @HiveField(3)
  Map<String, bool> get weekdays => throw _privateConstructorUsedError;
  @HiveField(4)
  Map<int, bool> get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) WorkoutScheduleEnum schedule,
      @HiveField(3) Map<String, bool> weekdays,
      @HiveField(4) Map<int, bool> color});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? schedule = null,
    Object? weekdays = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as WorkoutScheduleEnum,
      weekdays: null == weekdays
          ? _value.weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
          _$WorkoutImpl value, $Res Function(_$WorkoutImpl) then) =
      __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) WorkoutScheduleEnum schedule,
      @HiveField(3) Map<String, bool> weekdays,
      @HiveField(4) Map<int, bool> color});
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
      _$WorkoutImpl _value, $Res Function(_$WorkoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? schedule = null,
    Object? weekdays = null,
    Object? color = null,
  }) {
    return _then(_$WorkoutImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as WorkoutScheduleEnum,
      weekdays: null == weekdays
          ? _value._weekdays
          : weekdays // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      color: null == color
          ? _value._color
          : color // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$WorkoutImpl implements _Workout {
  _$WorkoutImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.schedule,
      @HiveField(3) required final Map<String, bool> weekdays,
      @HiveField(4) required final Map<int, bool> color})
      : _weekdays = weekdays,
        _color = color;

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final WorkoutScheduleEnum schedule;
  final Map<String, bool> _weekdays;
  @override
  @HiveField(3)
  Map<String, bool> get weekdays {
    if (_weekdays is EqualUnmodifiableMapView) return _weekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weekdays);
  }

  final Map<int, bool> _color;
  @override
  @HiveField(4)
  Map<int, bool> get color {
    if (_color is EqualUnmodifiableMapView) return _color;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_color);
  }

  @override
  String toString() {
    return 'Workout(id: $id, name: $name, schedule: $schedule, weekdays: $weekdays, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality().equals(other._weekdays, _weekdays) &&
            const DeepCollectionEquality().equals(other._color, _color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      schedule,
      const DeepCollectionEquality().hash(_weekdays),
      const DeepCollectionEquality().hash(_color));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);
}

abstract class _Workout implements Workout {
  factory _Workout(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final WorkoutScheduleEnum schedule,
      @HiveField(3) required final Map<String, bool> weekdays,
      @HiveField(4) required final Map<int, bool> color}) = _$WorkoutImpl;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  WorkoutScheduleEnum get schedule;
  @override
  @HiveField(3)
  Map<String, bool> get weekdays;
  @override
  @HiveField(4)
  Map<int, bool> get color;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
