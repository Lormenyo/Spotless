import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              getSearchBar(),
              getPageTitle()
            ],
          ),
        ),
      ),
    );
  }

  Widget getSearchBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CircleAvatar(),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.search),
          )
        ],
      ),
    );
  }

  Widget getPageTitle() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(width: 50, child: const Text('Find the best music for you')),
          SizedBox(
              width: 100,
              child: SvgPicture.asset('assets/icons/hand-point-right.svg'))
        ],
      ),
    );
  }
}
