import 'package:flutter/material.dart';
import 'package:spotless/data/models/album.dart';

class AlbumTracks extends StatefulWidget {
  final Album album;
  const AlbumTracks({super.key, required this.album});

  @override
  State<AlbumTracks> createState() => _AlbumTracksState();
}

class _AlbumTracksState extends State<AlbumTracks> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
