import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotless/data/api/apicalls.dart';
import 'package:spotless/data/models/album.dart';
import 'package:spotless/ui/screens/search.dart';
import 'package:spotless/ui/theme/app_assets.dart';
import 'package:spotless/ui/theme/app_colors.dart';
import 'package:spotless/ui/widgets/music_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Album>? albums = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                getSearchBar(),
                const SizedBox(
                  height: 10,
                ),
                getPageTitle(),
                const SizedBox(
                  height: 20,
                ),
                getTopSongs(),
                getDiscover(),
                getNewRelease()
              ],
            ),
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
          CircleAvatar(
            backgroundColor: AppColors.spotlessBrown,
            child: Image.asset(kProfileImage),
          ),
          InkWell(
            onTap: onSearchPressed,
            child: CircleAvatar(
              backgroundColor: AppColors.spotlessPurple3,
              child: SvgPicture.asset(kSearchIcon),
            ),
          )
        ],
      ),
    );
  }

  onSearchPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const Search())));
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
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          SizedBox(width: 100, child: Image.asset(kRightHandPoint))
        ],
      ),
    );
  }

  Widget getDiscover() {
    return Container(
      padding: const EdgeInsets.all(20.00),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: FutureBuilder(
                  future: getAllTrendingAlbums(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      print(snapshot.data?[0].images);
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return SquareMusicCard(
                                music: snapshot.data![index]);
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        ],
      ),
    );
  }

  Widget getNewRelease() {
    return Container(
      padding: const EdgeInsets.all(20.00),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Release',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: FutureBuilder(
                  future: getAllNewReleases(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return SquareMusicCard(
                                music: snapshot.data![index]);
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        ],
      ),
    );
  }

  Widget getTopSongs() {
    return Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: FutureBuilder(
            future: getAllNewReleases(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return RectangularMusicCard(music: snapshot.data![index]);
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
