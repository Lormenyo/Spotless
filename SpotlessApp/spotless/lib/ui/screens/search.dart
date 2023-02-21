import 'package:flutter/material.dart';
import 'package:spotless/ui/theme/app_colors.dart';
import 'package:spotless/ui/widgets/custom_appbars.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpotlessSimpleAppBar(
          title: SizedBox(
            height: 50,
            child: TextFormField(
              cursorColor: AppColors.spotlessBlack,
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 17),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.spotlessGray1,
                  ),
                  hintText: 'Search for your song',
                  enabledBorder: getInputBorder(),
                  focusedBorder: getInputBorder(),
                  border: getInputBorder()),
            ),
          ),
          onBackPressed: onBackPressed),
      body: Container(),
    );
  }

  OutlineInputBorder getInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.spotlessGray1, width: 1));
  }

  onBackPressed() {
    Navigator.of(context).pop();
  }
}
