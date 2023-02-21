import 'package:flutter/material.dart';
import 'package:spotless/ui/theme/app_colors.dart';

class SpotlessSimpleAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;
  const SpotlessSimpleAppBar(
      {Key? key, required this.title, required this.onBackPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title,
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(color: Colors.black, fontSize: 25),
      ),
      backgroundColor: Colors.white,
    );
  }
}
