import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spotless/data/models/music.dart';
import 'package:spotless/ui/theme/app_assets.dart';
import 'package:spotless/ui/theme/app_colors.dart';
import 'package:spotless/ui/widgets/music_card.dart';
import 'package:flutter/services.dart';
import 'package:spotless/ui/widgets/just_audio_common.dart';
import 'package:spotless/ui/widgets/music_controls.dart';

class NowPlaying extends StatefulWidget {
  final Music music;
  const NowPlaying({Key? key, required this.music}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> with WidgetsBindingObserver {
  final _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    _audioPlayer.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });

    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _audioPlayer.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNowPlayingAppbar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            NowPlayingMusicCard(
              music: widget.music,
            ),
            buildMusicSeekBar(),
            buildLyricsSheet()
          ],
        ),
      ),
    );
  }

  buildNowPlayingAppbar() {
    return AppBar(
      leading: IconButton(
          onPressed: onBackPressed,
          icon: const CircleAvatar(
            backgroundColor: AppColors.spotlessPurple3,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      centerTitle: true,
      title: Text(
        'Now Playing',
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(color: Colors.black, fontSize: 25),
      ),
      backgroundColor: Colors.white,
    );
  }

  onBackPressed() {
    Navigator.of(context).pop();
  }

  buildMusicSeekBar() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.music.title,
            style:
                Theme.of(context).textTheme.headline2?.copyWith(fontSize: 23),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.music.artistName,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: 17, color: AppColors.spotlessGray3),
          ),
          const SizedBox(
            height: 40,
          ),
          // Display seek bar. Using StreamBuilder, this widget rebuilds
          // each time the position, buffered position or duration changes.
          StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                duration: positionData?.duration ?? Duration.zero,
                position: positionData?.position ?? Duration.zero,
                bufferedPosition:
                    positionData?.bufferedPosition ?? Duration.zero,
                onChangeEnd: _audioPlayer.seek,
              );
            },
          ),

          buildMusicControls(),
        ],
      ),
    );
  }

  buildMusicControls() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(kSkipPreviousButton),
          const SizedBox(
            width: 30,
          ),
          ControlButtons(_audioPlayer),
          const SizedBox(
            width: 30,
          ),
          SvgPicture.asset(kSkipNextButton),
        ],
      ),
    );
  }

  buildLyricsSheet() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: DraggableScrollableSheet(
            minChildSize: 0.25,
            maxChildSize: 1,
            snap: true,
            builder: ((context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(kGreyMusicSign),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Lyrics',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const Expanded(
                          child: SizedBox(
                            width: 50,
                          ),
                        ),
                        Expanded(
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 22,
                                child: SvgPicture.asset(kArrowUp)))
                      ],
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
