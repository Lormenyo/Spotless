import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotless/ui/theme/app_assets.dart';

class LyricsBottomSheet extends StatelessWidget {
  const LyricsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
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
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 22,
                                child: SvgPicture.asset(kArrowUp)))
                      ],
                    ),
                  ),
                  ...List.generate(
                      10,
                      (index) => const ListTile(
                            tileColor: Colors.redAccent,
                            title: Text('Hannah'),
                          ))
                ],
              ),
            );
          })),
    );
  }
}
