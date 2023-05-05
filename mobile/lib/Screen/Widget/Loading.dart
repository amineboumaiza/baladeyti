import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitThreeBounce(
      size: 25,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.blue[600] : Colors.blue[700],
          ),
        );
      },
    );
    return Container(
      child: spinkit,
    );
  }
}
