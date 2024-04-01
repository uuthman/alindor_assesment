import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/app/extensions/dimen_extension.dart';
import 'package:alindor_assessment/presentation/records/records_viewmodel.dart';
import 'package:alindor_assessment/presentation/widgets/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  PlayerController? playerController;
  RecordsViewModel? _viewModel;

  final playerWaveStyle = const PlayerWaveStyle(
    fixedWaveColor: Colors.white54,
    liveWaveColor: Colors.white,
    spacing: 6,
  );

  @override
  void initState() {
    _viewModel = Provider.of<RecordsViewModel>(context, listen: false);
    final filePath = _viewModel?.filePath;
    playerController = PlayerController();
    playerController?.preparePlayer(path: filePath ?? "");
    playerController?.extractWaveformData(
        path: filePath ?? "",
        noOfSamples: playerWaveStyle.getSamplesForWidth(500));
    playerController?.onPlayerStateChanged.listen((state) {
      _viewModel?.setPlayerState(state);
    });
    super.initState();
  }

  void _playandPause(PlayerState state) async {
    state == PlayerState.playing
        ? await playerController?.pausePlayer()
        : await playerController?.startPlayer(finishMode: FinishMode.loop);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: $color.recorderBackground,
        elevation: 0.5,
        title:  GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: $color.boxColor,
            size: $size.s28,
          ),
        ),
      ),
      backgroundColor: $color.recorderBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all($padding.p16),
          child:
              Consumer<RecordsViewModel>(builder: (context, viewModel, child) {
            final data = viewModel.data;
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all($padding.p14),
                  decoration: BoxDecoration(
                    color: $color.boxColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular($size.s32)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quote",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Colors.grey,
                                fontSize: $fontSize.s14,
                                fontWeight: $fontWeight.medium),
                      ),
                      $padding.p8.ph,
                      Text(
                        data?.quote ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Colors.white,
                                fontSize: $fontSize.s14,
                                fontWeight: $fontWeight.medium),
                      ),
                    ],
                  ),
                ),
                $padding.p16.ph,
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all($padding.p14),
                  decoration: BoxDecoration(
                    color: $color.boxColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular($size.s32)),
                  ),
                  child: Column(
                    children: [
                      _tile(context, "Humour", data?.humor.toString() ?? ""),
                      $padding.p10.ph,
                      _tile(context, "Loyalty", data?.loyalty.toString() ?? ""),
                      $padding.p10.ph,
                      _tile(context, "Courage", data?.courage.toString() ?? ""),
                      $padding.p10.ph,
                      _tile(context, "Leadership",
                          data?.leadership.toString() ?? ""),
                      $padding.p10.ph,
                      _tile(context, "Personality",
                          data?.personality.toString() ?? ""),
                    ],
                  ),
                ),
                $padding.p16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showSheet(context, data?.summary ?? "", "Summary");
                      },
                      child: Text(
                        "View summary",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: $color.boxColor,
                                fontSize: $fontSize.s14,
                                fontWeight: $fontWeight.medium),
                      ),
                    ),
                    $padding.p16.pw,
                    GestureDetector(
                      onTap: () {
                        _showSheet(context, viewModel.fullTranscription ?? "",
                            "Transcription");
                      },
                      child: Text(
                        "View transcription",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: $color.boxColor,
                                fontSize: $fontSize.s14,
                                fontWeight: $fontWeight.medium),
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox.shrink()),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all($padding.p14),
                  decoration: BoxDecoration(
                    color: $color.boxColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular($size.s32)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _playandPause(viewModel.playerState);
                        },
                        child: Icon(
                          viewModel.playerState == PlayerState.playing
                              ? Icons.pause
                              : Icons.play_arrow_sharp,
                          color: Colors.white,
                          size: $size.s38,
                        ),
                      ),
                      //$padding.p16.pw,
                      AudioFileWaveforms(
                        size: Size(MediaQuery.of(context).size.width / 2, 70),
                        playerController: playerController!,
                        playerWaveStyle: playerWaveStyle,
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  _tile(BuildContext context, String title, String score) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all($padding.p12),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular($size.s32)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Colors.grey,
                fontSize: $fontSize.s16,
                fontWeight: $fontWeight.medium),
          ),
          Text(
            "$score/10",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Colors.grey,
                fontSize: $fontSize.s16,
                fontWeight: $fontWeight.medium),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    playerController?.dispose();
    _viewModel?.disposeData();
    super.dispose();
  }

  Future _showSheet(BuildContext context, String data, String title) {
    return appBottomSheet(
        context,
        title,
        SingleChildScrollView(
          child: Text(data,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.black,
                  fontSize: $fontSize.s16,
                  fontWeight: $fontWeight.regular)),
        ));
  }
}
