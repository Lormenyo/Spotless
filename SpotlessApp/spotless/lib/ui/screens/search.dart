import 'package:flutter/material.dart';
import 'package:spotless/data/api/apicalls.dart';
import 'package:spotless/ui/theme/app_colors.dart';
import 'package:spotless/ui/widgets/custom_appbars.dart';
import 'package:spotless/ui/widgets/music_card.dart';

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
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 17),
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
      body: Container(
        child: ListView(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                    future: getAllTopGenreList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return GenreMusicCard(
                                  music: snapshot.data![index]);
                              // return SquareMusicCard(
                              //     music: snapshot.data![index]);
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ],
        ),
      ),
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
