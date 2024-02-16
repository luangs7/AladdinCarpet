import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StateView extends StatelessWidget {
  final String? url;
  final double? size;
  final String? message;

  const StateView({super.key, this.url, this.size, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.network(
          url ?? "",
          repeat: true,
          height: size ?? MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
        ),
        message != null
            ? Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  message!,
                  textAlign: TextAlign.center,
                ),
              )
            : const Center()
      ],
    );
  }
}
