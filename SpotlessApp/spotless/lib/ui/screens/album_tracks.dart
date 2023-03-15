import 'package:flutter/material.dart';
import 'package:spotless/data/api/apiCalls.dart';
import 'package:spotless/data/models/album.dart';
import 'package:spotless/data/models/music.dart';
import 'package:spotless/data/models/track.dart';
import 'package:spotless/helpers/artists.dart';
import 'package:spotless/ui/screens/now_playing.dart';
import 'package:spotless/ui/theme/app_colors.dart';

class AlbumTracks extends StatefulWidget {
  final Album album;
  const AlbumTracks({super.key, required this.album});

  @override
  State<AlbumTracks> createState() => _AlbumTracksState();
}

class _AlbumTracksState extends State<AlbumTracks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.album.images?[0]["url"]),
                      fit: BoxFit.cover)),
            ),
            getAlbumTrackList()
          ],
        ),
      ),
    );
  }

  Widget getAlbumTrackList() {
    return Expanded(
      child: FutureBuilder(
          future: getAllAlbumTracks("${widget.album.id}"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return buildTrackTile(snapshot.data![index]);
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildTrackTile(Track track) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NowPlaying(
                    music: Music(
                        artUrl: "${widget.album.images?[0]['url']}",
                        title: "${track.name}",
                        genre: "genre",
                        artistName: getArtistNames(track.artists ?? []),
                        artistImage: "${widget.album.images?[0]['url']}",
                        url: "${track.preview_url}")))),
        // leading: Container(
        //   width: 100,
        //   height: 100,
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(image: NetworkImage(""))),
        // ),
        title: Text(
          "${track.name}",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black),
        ),
        subtitle: Text(getArtistNames(track.artists ?? []),
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: AppColors.spotlessGray3, fontSize: 12)),
      ),
    );
  }
}
