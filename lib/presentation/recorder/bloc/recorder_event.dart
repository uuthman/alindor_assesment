import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recorder_event.freezed.dart';

@freezed
class RecorderEvent with _$RecorderEvent {
  const factory RecorderEvent.initPlayer(bool isRecorderInitialized) = RecorderEventInitPlayer;
  const factory RecorderEvent.sendAudio(Uint8List data) = RecorderEventSendAudio;
  const factory RecorderEvent.getAnalysis() = RecorderEventGetAnalysis;
  const factory RecorderEvent.logOut() = RecorderEventLogOut;

}