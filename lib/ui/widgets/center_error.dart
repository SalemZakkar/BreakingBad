import 'package:flutter/material.dart';

class ErrorNetworkWidget extends StatelessWidget {
  const ErrorNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.wifi_off,
        color: Colors.grey,
        size: 40,
      ),
    );
  }
}
