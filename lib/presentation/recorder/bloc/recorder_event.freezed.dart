// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recorder_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecorderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRecorderInitialized) initPlayer,
    required TResult Function(Uint8List data) sendAudio,
    required TResult Function() getAnalysis,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRecorderInitialized)? initPlayer,
    TResult? Function(Uint8List data)? sendAudio,
    TResult? Function()? getAnalysis,
    TResult? Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRecorderInitialized)? initPlayer,
    TResult Function(Uint8List data)? sendAudio,
    TResult Function()? getAnalysis,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecorderEventInitPlayer value) initPlayer,
    required TResult Function(RecorderEventSendAudio value) sendAudio,
    required TResult Function(RecorderEventGetAnalysis value) getAnalysis,
    required TResult Function(RecorderEventLogOut value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecorderEventInitPlayer value)? initPlayer,
    TResult? Function(RecorderEventSendAudio value)? sendAudio,
    TResult? Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult? Function(RecorderEventLogOut value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecorderEventInitPlayer value)? initPlayer,
    TResult Function(RecorderEventSendAudio value)? sendAudio,
    TResult Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult Function(RecorderEventLogOut value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecorderEventCopyWith<$Res> {
  factory $RecorderEventCopyWith(
          RecorderEvent value, $Res Function(RecorderEvent) then) =
      _$RecorderEventCopyWithImpl<$Res, RecorderEvent>;
}

/// @nodoc
class _$RecorderEventCopyWithImpl<$Res, $Val extends RecorderEvent>
    implements $RecorderEventCopyWith<$Res> {
  _$RecorderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecorderEventInitPlayerImplCopyWith<$Res> {
  factory _$$RecorderEventInitPlayerImplCopyWith(
          _$RecorderEventInitPlayerImpl value,
          $Res Function(_$RecorderEventInitPlayerImpl) then) =
      __$$RecorderEventInitPlayerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRecorderInitialized});
}

/// @nodoc
class __$$RecorderEventInitPlayerImplCopyWithImpl<$Res>
    extends _$RecorderEventCopyWithImpl<$Res, _$RecorderEventInitPlayerImpl>
    implements _$$RecorderEventInitPlayerImplCopyWith<$Res> {
  __$$RecorderEventInitPlayerImplCopyWithImpl(
      _$RecorderEventInitPlayerImpl _value,
      $Res Function(_$RecorderEventInitPlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecorderInitialized = null,
  }) {
    return _then(_$RecorderEventInitPlayerImpl(
      null == isRecorderInitialized
          ? _value.isRecorderInitialized
          : isRecorderInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RecorderEventInitPlayerImpl implements RecorderEventInitPlayer {
  const _$RecorderEventInitPlayerImpl(this.isRecorderInitialized);

  @override
  final bool isRecorderInitialized;

  @override
  String toString() {
    return 'RecorderEvent.initPlayer(isRecorderInitialized: $isRecorderInitialized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecorderEventInitPlayerImpl &&
            (identical(other.isRecorderInitialized, isRecorderInitialized) ||
                other.isRecorderInitialized == isRecorderInitialized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRecorderInitialized);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecorderEventInitPlayerImplCopyWith<_$RecorderEventInitPlayerImpl>
      get copyWith => __$$RecorderEventInitPlayerImplCopyWithImpl<
          _$RecorderEventInitPlayerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRecorderInitialized) initPlayer,
    required TResult Function(Uint8List data) sendAudio,
    required TResult Function() getAnalysis,
    required TResult Function() logOut,
  }) {
    return initPlayer(isRecorderInitialized);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRecorderInitialized)? initPlayer,
    TResult? Function(Uint8List data)? sendAudio,
    TResult? Function()? getAnalysis,
    TResult? Function()? logOut,
  }) {
    return initPlayer?.call(isRecorderInitialized);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRecorderInitialized)? initPlayer,
    TResult Function(Uint8List data)? sendAudio,
    TResult Function()? getAnalysis,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (initPlayer != null) {
      return initPlayer(isRecorderInitialized);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecorderEventInitPlayer value) initPlayer,
    required TResult Function(RecorderEventSendAudio value) sendAudio,
    required TResult Function(RecorderEventGetAnalysis value) getAnalysis,
    required TResult Function(RecorderEventLogOut value) logOut,
  }) {
    return initPlayer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecorderEventInitPlayer value)? initPlayer,
    TResult? Function(RecorderEventSendAudio value)? sendAudio,
    TResult? Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult? Function(RecorderEventLogOut value)? logOut,
  }) {
    return initPlayer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecorderEventInitPlayer value)? initPlayer,
    TResult Function(RecorderEventSendAudio value)? sendAudio,
    TResult Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult Function(RecorderEventLogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (initPlayer != null) {
      return initPlayer(this);
    }
    return orElse();
  }
}

abstract class RecorderEventInitPlayer implements RecorderEvent {
  const factory RecorderEventInitPlayer(final bool isRecorderInitialized) =
      _$RecorderEventInitPlayerImpl;

  bool get isRecorderInitialized;
  @JsonKey(ignore: true)
  _$$RecorderEventInitPlayerImplCopyWith<_$RecorderEventInitPlayerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecorderEventSendAudioImplCopyWith<$Res> {
  factory _$$RecorderEventSendAudioImplCopyWith(
          _$RecorderEventSendAudioImpl value,
          $Res Function(_$RecorderEventSendAudioImpl) then) =
      __$$RecorderEventSendAudioImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List data});
}

/// @nodoc
class __$$RecorderEventSendAudioImplCopyWithImpl<$Res>
    extends _$RecorderEventCopyWithImpl<$Res, _$RecorderEventSendAudioImpl>
    implements _$$RecorderEventSendAudioImplCopyWith<$Res> {
  __$$RecorderEventSendAudioImplCopyWithImpl(
      _$RecorderEventSendAudioImpl _value,
      $Res Function(_$RecorderEventSendAudioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RecorderEventSendAudioImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$RecorderEventSendAudioImpl implements RecorderEventSendAudio {
  const _$RecorderEventSendAudioImpl(this.data);

  @override
  final Uint8List data;

  @override
  String toString() {
    return 'RecorderEvent.sendAudio(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecorderEventSendAudioImpl &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecorderEventSendAudioImplCopyWith<_$RecorderEventSendAudioImpl>
      get copyWith => __$$RecorderEventSendAudioImplCopyWithImpl<
          _$RecorderEventSendAudioImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRecorderInitialized) initPlayer,
    required TResult Function(Uint8List data) sendAudio,
    required TResult Function() getAnalysis,
    required TResult Function() logOut,
  }) {
    return sendAudio(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRecorderInitialized)? initPlayer,
    TResult? Function(Uint8List data)? sendAudio,
    TResult? Function()? getAnalysis,
    TResult? Function()? logOut,
  }) {
    return sendAudio?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRecorderInitialized)? initPlayer,
    TResult Function(Uint8List data)? sendAudio,
    TResult Function()? getAnalysis,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (sendAudio != null) {
      return sendAudio(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecorderEventInitPlayer value) initPlayer,
    required TResult Function(RecorderEventSendAudio value) sendAudio,
    required TResult Function(RecorderEventGetAnalysis value) getAnalysis,
    required TResult Function(RecorderEventLogOut value) logOut,
  }) {
    return sendAudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecorderEventInitPlayer value)? initPlayer,
    TResult? Function(RecorderEventSendAudio value)? sendAudio,
    TResult? Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult? Function(RecorderEventLogOut value)? logOut,
  }) {
    return sendAudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecorderEventInitPlayer value)? initPlayer,
    TResult Function(RecorderEventSendAudio value)? sendAudio,
    TResult Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult Function(RecorderEventLogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (sendAudio != null) {
      return sendAudio(this);
    }
    return orElse();
  }
}

abstract class RecorderEventSendAudio implements RecorderEvent {
  const factory RecorderEventSendAudio(final Uint8List data) =
      _$RecorderEventSendAudioImpl;

  Uint8List get data;
  @JsonKey(ignore: true)
  _$$RecorderEventSendAudioImplCopyWith<_$RecorderEventSendAudioImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecorderEventGetAnalysisImplCopyWith<$Res> {
  factory _$$RecorderEventGetAnalysisImplCopyWith(
          _$RecorderEventGetAnalysisImpl value,
          $Res Function(_$RecorderEventGetAnalysisImpl) then) =
      __$$RecorderEventGetAnalysisImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecorderEventGetAnalysisImplCopyWithImpl<$Res>
    extends _$RecorderEventCopyWithImpl<$Res, _$RecorderEventGetAnalysisImpl>
    implements _$$RecorderEventGetAnalysisImplCopyWith<$Res> {
  __$$RecorderEventGetAnalysisImplCopyWithImpl(
      _$RecorderEventGetAnalysisImpl _value,
      $Res Function(_$RecorderEventGetAnalysisImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RecorderEventGetAnalysisImpl implements RecorderEventGetAnalysis {
  const _$RecorderEventGetAnalysisImpl();

  @override
  String toString() {
    return 'RecorderEvent.getAnalysis()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecorderEventGetAnalysisImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRecorderInitialized) initPlayer,
    required TResult Function(Uint8List data) sendAudio,
    required TResult Function() getAnalysis,
    required TResult Function() logOut,
  }) {
    return getAnalysis();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRecorderInitialized)? initPlayer,
    TResult? Function(Uint8List data)? sendAudio,
    TResult? Function()? getAnalysis,
    TResult? Function()? logOut,
  }) {
    return getAnalysis?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRecorderInitialized)? initPlayer,
    TResult Function(Uint8List data)? sendAudio,
    TResult Function()? getAnalysis,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (getAnalysis != null) {
      return getAnalysis();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecorderEventInitPlayer value) initPlayer,
    required TResult Function(RecorderEventSendAudio value) sendAudio,
    required TResult Function(RecorderEventGetAnalysis value) getAnalysis,
    required TResult Function(RecorderEventLogOut value) logOut,
  }) {
    return getAnalysis(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecorderEventInitPlayer value)? initPlayer,
    TResult? Function(RecorderEventSendAudio value)? sendAudio,
    TResult? Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult? Function(RecorderEventLogOut value)? logOut,
  }) {
    return getAnalysis?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecorderEventInitPlayer value)? initPlayer,
    TResult Function(RecorderEventSendAudio value)? sendAudio,
    TResult Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult Function(RecorderEventLogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (getAnalysis != null) {
      return getAnalysis(this);
    }
    return orElse();
  }
}

abstract class RecorderEventGetAnalysis implements RecorderEvent {
  const factory RecorderEventGetAnalysis() = _$RecorderEventGetAnalysisImpl;
}

/// @nodoc
abstract class _$$RecorderEventLogOutImplCopyWith<$Res> {
  factory _$$RecorderEventLogOutImplCopyWith(_$RecorderEventLogOutImpl value,
          $Res Function(_$RecorderEventLogOutImpl) then) =
      __$$RecorderEventLogOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecorderEventLogOutImplCopyWithImpl<$Res>
    extends _$RecorderEventCopyWithImpl<$Res, _$RecorderEventLogOutImpl>
    implements _$$RecorderEventLogOutImplCopyWith<$Res> {
  __$$RecorderEventLogOutImplCopyWithImpl(_$RecorderEventLogOutImpl _value,
      $Res Function(_$RecorderEventLogOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RecorderEventLogOutImpl implements RecorderEventLogOut {
  const _$RecorderEventLogOutImpl();

  @override
  String toString() {
    return 'RecorderEvent.logOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecorderEventLogOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRecorderInitialized) initPlayer,
    required TResult Function(Uint8List data) sendAudio,
    required TResult Function() getAnalysis,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRecorderInitialized)? initPlayer,
    TResult? Function(Uint8List data)? sendAudio,
    TResult? Function()? getAnalysis,
    TResult? Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRecorderInitialized)? initPlayer,
    TResult Function(Uint8List data)? sendAudio,
    TResult Function()? getAnalysis,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecorderEventInitPlayer value) initPlayer,
    required TResult Function(RecorderEventSendAudio value) sendAudio,
    required TResult Function(RecorderEventGetAnalysis value) getAnalysis,
    required TResult Function(RecorderEventLogOut value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecorderEventInitPlayer value)? initPlayer,
    TResult? Function(RecorderEventSendAudio value)? sendAudio,
    TResult? Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult? Function(RecorderEventLogOut value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecorderEventInitPlayer value)? initPlayer,
    TResult Function(RecorderEventSendAudio value)? sendAudio,
    TResult Function(RecorderEventGetAnalysis value)? getAnalysis,
    TResult Function(RecorderEventLogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class RecorderEventLogOut implements RecorderEvent {
  const factory RecorderEventLogOut() = _$RecorderEventLogOutImpl;
}
