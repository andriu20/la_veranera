import 'package:flutter/material.dart';

class LoadingWidget {

  static loading()
  {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withValues(alpha: .12),
      child: Center(child: CircularProgressIndicator.adaptive()));
  }
}