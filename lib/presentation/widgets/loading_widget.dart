import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        color: Color(0xff6C3293),
        size: 40,
      ),
    );
  }
}
