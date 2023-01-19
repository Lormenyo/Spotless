import 'package:flutter/material.dart';

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
              getPageTitle()
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
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
              width: 100, child: Text('Find the best music for you')),
          SizedBox(
              width: 100,
              child: Image.asset('assets/images/hand-point-right.png'))
        ],
      ),
    );
  }
}
