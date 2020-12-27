import 'package:flutter/cupertino.dart';

int _nextImage = 1;

/// Get one of the 5 built in images.
/// Used to get an avatar for each user.
AssetImage get nextAvatar {
  final res = _nextImage++;
  if (_nextImage == 6) _nextImage = 1;
  return AssetImage('assets/$res.jpg');
}
