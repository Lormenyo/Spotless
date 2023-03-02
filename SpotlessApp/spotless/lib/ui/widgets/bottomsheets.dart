import 'dart:ui';

import 'package:flutter/material.dart';

class LyricsBottomSheet extends StatelessWidget {
  const LyricsBottomSheet({Key? key}) : super(key: key);

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
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Flexible(
                              child: Text(
                            "Lately, I think of you lots \n" +
                                "'Cause my mind's in circles for you \n" +
                                "Please connect the dots And bring me, bring me to you \n" +
                                "'Cause you bring out the freak in me It's only for you",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(height: 1.7),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
