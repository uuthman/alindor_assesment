import 'dart:async';
import 'dart:io';

import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/app/extensions/app_extension.dart';
import 'package:alindor_assessment/presentation/recorder/bloc/recorder_bloc.dart';
import 'package:alindor_assessment/presentation/recorder/bloc/recorder_event.dart';
import 'package:alindor_assessment/presentation/recorder/bloc/recorder_state.dart'
    as rs;
import 'package:alindor_assessment/presentation/records/records_viewmodel.dart';
import 'package:alindor_assessment/router.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class RecorderPage extends StatelessWidget {
  const RecorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecorderBloc>(
      create: (context) => instance<RecorderBloc>(),
      child: const _RecorderPageView(),
    );
  }
}

class _RecorderPageView extends StatefulWidget {
  const _RecorderPageView({super.key});

  @override
  State<_RecorderPageView> createState() => _RecorderPageViewState();
}

class _RecorderPageViewState extends State<_RecorderPageView> {
  FlutterSoundRecorder? _recorder;
  File? filePath;

  @override
  void initState() {
    _recorder = FlutterSoundRecorder();
    _initRecorder().then((value) =>
        context.read<RecorderBloc>().add(const RecorderEventInitPlayer(true)));
    super.initState();
  }

  Future _initRecorder() async {
    await _recorder?.openRecorder();

    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));
  }

  void record() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final downloadsDirectoryPath = directory.path;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd_HH-mm-ss').format(now);
    filePath = File("$downloadsDirectoryPath/${formattedDate}_recording.mp4");
    _recorder
        ?.startRecorder(
            toFile: filePath?.path,
            codec: Codec.aacMP4,
            audioSource: AudioSource.microphone)
        .then((value) {
      _recorder?.recorderState.name;
      setState(() {});
    });
  }

  bool updateState() {
    return (_recorder?.isRecording ?? false) || (_recorder?.isPaused ?? false);
  }

  void stopRecording() async {
    await _recorder?.stopRecorder().then((value) => setState(() {}));
    final data = await filePath?.readAsBytes();
    if (mounted && data != null) {
      context.read<RecorderBloc>()
        ..add(RecorderEventSendAudio(data))
        ..add(const RecorderEventGetAnalysis());
    }
  }

  void pauseRecording() async {
    await _recorder?.pauseRecorder().then((value) => setState(() {}));
  }

  void resumeRecording() async {
    await _recorder?.resumeRecorder().then((value) => setState(() {}));
  }

  recordingState(bool isInitialized) {
    if (!isInitialized) {
      return null;
    }

    if (_recorder?.isRecording ?? false) {
      pauseRecording();
      return;
    }

    if (_recorder?.isPaused ?? false) {
      resumeRecording();
      return;
    }

    record();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecorderBloc, rs.RecorderState>(
        listenWhen: (prevState, nextState) {
      if (prevState.state.isLoading) {
        Navigator.pop(context);
      }
      return true;
    }, listener: (context, state) {
      final pState = state.state;

      if (pState.isLoading) {
        context.showLoader();
      }

      if (pState.isFailure) {
        context.showErrorAlert(state.errorMessage ?? "");
      }

      if (pState.isSuccess) {
        context
            .read<RecordsViewModel>()
            .setData(filePath?.path, state.analysedData, state.data);
        context.push(ScreenPaths.analysis);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: $color.recorderBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: $color.recorderBackground,
          elevation: 0.5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, ${state.loggedInUser}",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: $color.textColor,
                    fontSize: $fontSize.s16,
                    fontWeight: $fontWeight.semiBold),
              ),
              GestureDetector(
                onTap: () {
                  context.read<RecorderBloc>().add(const RecorderEventLogOut());
                  context.pushReplacement(ScreenPaths.login);
                },
                child: Icon(
                  Icons.logout_outlined,
                  color: $color.boxColor,
                  size: $size.s28,
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: $padding.p16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox.shrink(),
                Center(
                  child: Text(
                    "Record entry",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: $color.textColor,
                        fontSize: $fontSize.s26,
                        fontWeight: $fontWeight.semiBold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: $padding.p40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (updateState()) ...[
                        GestureDetector(
                          onTap: () async {
                            await _recorder
                                ?.stopRecorder()
                                .then((value) => setState(() {}));
                          },
                          child: Text(
                            "Stop",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: $color.textColor,
                                    fontSize: $fontSize.s14,
                                    fontWeight: $fontWeight.medium),
                          ),
                        ),
                      ] else ...[
                        const SizedBox.shrink()
                      ],
                      GestureDetector(
                        onTap: () {
                          recordingState(state.isRecorderInitialized);
                        },
                        child: Container(
                          padding: EdgeInsets.all($padding.p32),
                          decoration: BoxDecoration(
                              borderRadius: _recorder?.isPaused ?? false
                                  ? BorderRadius.all(Radius.circular($size.s10))
                                  : null,
                              shape: _recorder?.isPaused ?? false
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              color: $color.boxColor),
                          child: _iconState(),
                        ),
                      ),
                      if (updateState()) ...[
                        GestureDetector(
                          onTap: () {
                            stopRecording();
                          },
                          child: Text(
                            "Process",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: $color.textColor,
                                    fontSize: $fontSize.s14,
                                    fontWeight: $fontWeight.medium),
                          ),
                        ),
                      ] else ...[
                        const SizedBox.shrink()
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _iconState() {
    if (_recorder?.isRecording ?? false) {
      return SvgPicture.asset(
        $asset.recorderProcessingIcon,
        height: 30,
        width: 30,
      );
    }

    if (_recorder?.isPaused ?? false) {
      return Text(
        "Resume",
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Colors.white,
            fontSize: $fontSize.s16,
            fontWeight: $fontWeight.medium),
      );
    }

    return SvgPicture.asset(
      $asset.recorderInitialIcon,
      height: 30,
      width: 30,
    );
  }

  @override
  void dispose() {
    _recorder?.closeRecorder();
    super.dispose();
  }
}
