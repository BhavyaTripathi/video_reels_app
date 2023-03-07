
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:video_reels_app/model_class.dart';

class PageItem extends StatefulWidget {
  final Data data;
  const PageItem({Key? key, required this.data}) : super(key: key);

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    initializePlayer(widget.data.url);
  }

  void initializePlayer(String? url) async {
    final fileInfo = await checkCacheFor(url ?? '');
    if (fileInfo == null) {
      _controller = VideoPlayerController.network(url ?? '');
      _controller!.initialize().then((value) {
        cachedForUrl(url ?? '');
        setState(() {
          _controller!.play();
        });
      });
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
      _controller!.initialize().then((value) {
        print("hiii");
        // setState(() {
        //   _controller!.play();
        // });
      });
    }
  }

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {
      print('downloaded successfully done for $url');
    });
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: displayUI(),
    );
  }

  Widget displayUI(){
    return Stack(
      children: [
        Container(
            color: Colors.black,
            child: (_controller == null || (!_controller!.value.isInitialized)) ? Container(color: Colors.black) :
            VideoPlayer(_controller!)
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
          ),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 40,right: 20),
              child: Text(widget.data.caption ?? '', style: TextStyle(color: Colors.white)),
            )),
        Align(
            alignment: Alignment.bottomRight,
            child: buttons())
      ],
    );
  }

  Widget buttons(){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(EvaIcons.heartOutline, color: Colors.white),
          Text(widget.data.likes.toString(), style: TextStyle(color: Colors.white)),
          SizedBox(
              height: 10
          ),
          Icon(EvaIcons.eyeOutline, color: Colors.white),
          Text(widget.data.views.toString(), style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }

}
