import 'package:flutter/material.dart';
import 'package:spotless/ui/theme/app_colors.dart';

class SpotlessSimpleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  final VoidCallback onBackPressed;
  const SpotlessSimpleAppBar(
      {Key? key, required this.title, required this.onBackPressed})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
      title: title,
      backgroundColor: Colors.white,
    );
  }
}
