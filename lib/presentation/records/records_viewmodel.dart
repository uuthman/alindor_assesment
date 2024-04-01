import 'package:alindor_assessment/domain/model.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class RecordsViewModel extends ChangeNotifier {

  String? _filePath;
  String? get filePath => _filePath;

  AnalysedData? _data;
  AnalysedData? get data => _data;

  String? _fullTranscription;
  String? get fullTranscription => _fullTranscription;

  PlayerState _playerState = PlayerState.initialized;
  PlayerState get playerState => _playerState;


  void setData(String? filePath, AnalysedData? data,String? transcription) {
    _filePath = filePath;
    _data = data;
    _fullTranscription = transcription;
    notifyListeners();
  }

  void setPlayerState(PlayerState state) {
    _playerState = state;
    notifyListeners();
  }

  void disposeData() {
    _playerState = PlayerState.initialized;
    _filePath = null;
    _fullTranscription = null;
    _data = null;
  }
}