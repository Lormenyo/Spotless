import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotless/ui/theme/app_assets.dart';

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
