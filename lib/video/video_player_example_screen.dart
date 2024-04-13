import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../base/base_stateful_widget.dart';

class VideoPlayerExampleScreenResult {
  final String message;
  VideoPlayerExampleScreenResult(this.message);
}

class VideoPlayerExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerExampleScreenState();
  }
}

class _VideoPlayerExampleScreenState extends BaseState<VideoPlayerExampleScreen> {
  //_VideoPlayerExampleScreenState() : super();

  late VideoPlayerController _controller;
  bool initSwitch = false;
  bool complate = false;
  bool playSwitch = false;
  bool _isPlayComplete = false;
  VoidCallback? _listener;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/movies/IMG_5946.MOV');
    _controller.initialize().then((_) {

      setState(() {});

      _controller.play();

      // イベント監視
      _listener = () {
        if (!_controller.value.isPlaying) {

          // 再生完了
          setState(() {
            _isPlayComplete = true;
          });
        }
      };
      _controller.addListener(_listener!);

      // 最初のフレームを描画するため初期化後に更新
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:
      Container(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            children: <Widget>[

              /*
               * 動画プレーヤー
               */
              VideoPlayer(_controller),

              _isPlayComplete ? InkWell(
                onTap: (() {

                  setState(() {
                    _isPlayComplete = false;
                  });
                  _controller.seekTo(Duration.zero);
                  _controller.play();

                }),
                child: Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              )
                  : Container()
            ],
          ),
        ),
      )
      /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // 動画を表示
            child: VideoPlayer(_controller),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // 動画を最初から再生
                  _controller
                      .seekTo(Duration.zero)
                      .then((_) => _controller.play());
                },
                icon: Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {
                  // 動画を再生
                  _controller.play();
                },
                icon: Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: () {
                  // 動画を一時停止
                  _controller.pause();
                },
                icon: Icon(Icons.pause),
              ),
            ],
          ),
        ],
      ),*/
    );
  }

  /*
  @override
  void initState() {
    super.initState();
  }

  Future<void> _initVideoPlayer() async {
    _controller = VideoPlayerController.asset('assets/movies/IMG_5946.MOV');
    await _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return initSwitch
        ? !complate
        ? Scaffold(
      appBar: AppBar(
        title: const Text('Video Player example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text("ローディング中"),
            ],
          )),
    )
        : Scaffold(
      appBar: AppBar(
        title: const Text('Video Player example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // 動画を表示
            child: VideoPlayer(_controller),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // 動画を最初から再生
                  _controller
                      .seekTo(Duration.zero)
                      .then((_) => _controller.play());
                  playSwitch = true;
                  setState(() {});
                },
                icon: const Icon(Icons.refresh),
              ),
              playSwitch
                  ? IconButton(
                onPressed: () {
                  // 動画を一時停止
                  _controller.pause();
                  playSwitch = !playSwitch;
                  setState(() {});
                },
                icon: const Icon(Icons.pause),
              )
                  : IconButton(
                onPressed: () {
                  // 動画を再生
                  _controller.play();
                  playSwitch = !playSwitch;
                  setState(() {});
                },
                icon: const Icon(Icons.play_arrow),
              )
            ],
          ),
        ],
      ),
    )
        : Scaffold(
      appBar: AppBar(
        title: const Text('Video Player example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          initSwitch = true;
          setState(() {});
          await _initVideoPlayer();
          complate = true;
          setState(() {});
        },
        child: const Icon(Icons.play_circle_outline),
      ),
    );
  }
*/
}