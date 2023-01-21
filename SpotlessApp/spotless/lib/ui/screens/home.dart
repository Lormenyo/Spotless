import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotless/ui/theme/app_assets.dart';
import 'package:spotless/ui/theme/app_colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              getSearchBar(),
              getPageTitle(),
              getDiscover(),
              getNewRelease()
            ],
          ),
        ),
      ),
    );
  }

  Widget getSearchBar() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.spotlessBrown,
          ),
          CircleAvatar(
            backgroundColor: AppColors.spotlessPurple3,
            child: SvgPicture.asset(kSearchIcon),
          )
        ],
      ),
    );
  }

  Widget getPageTitle() {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 270,
              child: Text(
                'Find the best music for you',
                style: Theme.of(context).textTheme.headline1,
              )),
          SizedBox(width: 100, child: Image.asset(kRightHandPoint))
        ],
      ),
    );
  }

  Widget getDiscover() {
    return Container(
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }

  Widget getNewRelease() {
    return Container(
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Text(
            'New Release',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
