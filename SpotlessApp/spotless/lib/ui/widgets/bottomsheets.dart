import 'package:flutter/material.dart';

class LyricsBottomSheet extends StatelessWidget {
  const LyricsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: DraggableScrollableSheet(
          minChildSize: 0.25,
          maxChildSize: 1,
          snap: true,
          expand: false,
          builder: ((context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
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
                              .headline2
                              ?.copyWith(height: 1.7),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
