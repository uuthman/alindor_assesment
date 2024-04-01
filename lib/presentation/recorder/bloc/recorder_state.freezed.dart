// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recorder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecorderState {
  ViewState get state => throw _privateConstructorUsedError;
  bool get isRecorderInitialized => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;
  String? get loggedInUser => throw _privateConstructorUsedError;
  AnalysedData? get analysedData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecorderStateCopyWith<RecorderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecorderStateCopyWith<$Res> {
  factory $RecorderStateCopyWith(
          RecorderState value, $Res Function(RecorderState) then) =
      _$RecorderStateCopyWithImpl<$Res, RecorderState>;
  @useResult
  $Res call(
      {ViewState state,
      bool isRecorderInitialized,
      String? errorMessage,
      String? data,
      String? loggedInUser,
      AnalysedData? analysedData});
}

/// @nodoc
class _$RecorderStateCopyWithImpl<$Res, $Val extends RecorderState>
    implements $RecorderStateCopyWith<$Res> {
  _$RecorderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? isRecorderInitialized = null,
    Object? errorMessage = freezed,
    Object? data = freezed,
    Object? loggedInUser = freezed,
    Object? analysedData = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ViewState,
      isRecorderInitialized: null == isRecorderInitialized
          ? _value.isRecorderInitialized
          : isRecorderInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      loggedInUser: freezed == loggedInUser
          ? _value.loggedInUser
          : loggedInUser // ignore: cast_nullable_to_non_nullable
              as String?,
      analysedData: freezed == analysedData
          ? _value.analysedData
          : analysedData // ignore: cast_nullable_to_non_nullable
              as AnalysedData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecorderStateImplCopyWith<$Res>
    implements $RecorderStateCopyWith<$Res> {
  factory _$$RecorderStateImplCopyWith(
          _$RecorderStateImpl value, $Res Function(_$RecorderStateImpl) then) =
      __$$RecorderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ViewState state,
      bool isRecorderInitialized,
      String? errorMessage,
      String? data,
      String? loggedInUser,
      AnalysedData? analysedData});
}

/// @nodoc
class __$$RecorderStateImplCopyWithImpl<$Res>
    extends _$RecorderStateCopyWithImpl<$Res, _$RecorderStateImpl>
    implements _$$RecorderStateImplCopyWith<$Res> {
  __$$RecorderStateImplCopyWithImpl(
      _$RecorderStateImpl _value, $Res Function(_$RecorderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? isRecorderInitialized = null,
    Object? errorMessage = freezed,
    Object? data = freezed,
    Object? loggedInUser = freezed,
    Object? analysedData = freezed,
  }) {
    return _then(_$RecorderStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ViewState,
      isRecorderInitialized: null == isRecorderInitialized
          ? _value.isRecorderInitialized
          : isRecorderInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      loggedInUser: freezed == loggedInUser
          ? _value.loggedInUser
          : loggedInUser // ignore: cast_nullable_to_non_nullable
              as String?,
      analysedData: freezed == analysedData
          ? _value.analysedData
          : analysedData // ignore: cast_nullable_to_non_nullable
              as AnalysedData?,
    ));
  }
}

/// @nodoc

class _$RecorderStateImpl implements _RecorderState {
  _$RecorderStateImpl(
      {this.state = ViewState.initial,
      this.isRecorderInitialized = false,
      this.errorMessage,
      this.data,
      this.loggedInUser,
      this.analysedData});

  @override
  @JsonKey()
  final ViewState state;
  @override
  @JsonKey()
  final bool isRecorderInitialized;
  @override
  final String? errorMessage;
  @override
  final String? data;
  @override
  final String? loggedInUser;
  @override
  final AnalysedData? analysedData;

  @override
  String toString() {
    return 'RecorderState(state: $state, isRecorderInitialized: $isRecorderInitialized, errorMessage: $errorMessage, data: $data, loggedInUser: $loggedInUser, analysedData: $analysedData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecorderStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isRecorderInitialized, isRecorderInitialized) ||
                other.isRecorderInitialized == isRecorderInitialized) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.loggedInUser, loggedInUser) ||
                other.loggedInUser == loggedInUser) &&
            (identical(other.analysedData, analysedData) ||
                other.analysedData == analysedData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, isRecorderInitialized,
      errorMessage, data, loggedInUser, analysedData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecorderStateImplCopyWith<_$RecorderStateImpl> get copyWith =>
      __$$RecorderStateImplCopyWithImpl<_$RecorderStateImpl>(this, _$identity);
}

abstract class _RecorderState implements RecorderState {
  factory _RecorderState(
      {final ViewState state,
      final bool isRecorderInitialized,
      final String? errorMessage,
      final String? data,
      final String? loggedInUser,
      final AnalysedData? analysedData}) = _$RecorderStateImpl;

  @override
  ViewState get state;
  @override
  bool get isRecorderInitialized;
  @override
  String? get errorMessage;
  @override
  String? get data;
  @override
  String? get loggedInUser;
  @override
  AnalysedData? get analysedData;
  @override
  @JsonKey(ignore: true)
  _$$RecorderStateImplCopyWith<_$RecorderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
