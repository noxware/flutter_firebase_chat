import 'package:flutter/cupertino.dart';

int _nextImage = 1;

AssetImage get nextAvatar {
  final res = _nextImage++;
  if (_nextImage == 6) _nextImage = 1;
  return AssetImage('assets/$res.jpg');
}
