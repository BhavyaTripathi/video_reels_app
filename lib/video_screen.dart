
import 'package:flutter/material.dart';
import 'package:video_reels_app/model_class.dart';
import 'package:video_reels_app/page_item.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen(this.data, {Key? key}) : super(key: key);
  final List<Data>? data;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.data?.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (ctx, index) {
          return PageItem(data: widget.data![index]);
        },
      ),
    );
  }
}
