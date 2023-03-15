import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotless/data/api/apiCalls.dart';
import 'package:spotless/data/models/track.dart';

class LyricsBottomSheet extends StatelessWidget {
  final String song;
  final String artist;
  const LyricsBottomSheet({Key? key, required this.song, required this.artist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        boxShadow: const [
          BoxShadow(
              color: Color(0x09E5E5E5),
              blurRadius: 0,
              spreadRadius: 0,
              offset: Offset(0, -2))
        ],
      ),
      child: DraggableScrollableSheet(
          minChildSize: 0.25,
          maxChildSize: 1,
          snap: true,
          expand: false,
          builder: ((context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Column(
                  children: [
                    FutureBuilder(
                        future: getSongLyrics(song, artist),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Text(
                                    "${snapshot.data}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(height: 1.7),
                                  )),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
                  ],
                ),
              ),
            );
          })),
    );
  }
}
