import 'package:alladin/common/components/button/custom_button.dart';
import 'package:alladin/common/components/stateview/state_view.dart';
import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/presentation/home/provider/home_cubit.dart';
import 'package:alladin/presentation/home/states/home_states.dart';
import 'package:alladin/presentation/home/view/carpet_content.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final ViewEvent viewEvent;

  const HomeContent({super.key, required this.viewEvent});

  @override
  Widget build(BuildContext context) {
    switch (viewEvent.runtimeType) {
      case HomeLoadingEvent:
        return const CircularProgressIndicator(color: Colors.red);
      case HomeLoadedEvent:
        return CarpetContent(viewEvent as HomeLoadedEvent);
      case HomeEmptyEvent:
        return _buildEmptyContent();
      case HomeExceptionEvent:
        return _buildErrorContent(context);
      default:
        return const Text("nothing here");
    }
  }

  Widget _buildErrorContent(BuildContext context) {
    return StateView(
      url:
          "https://lottie.host/dc5bedd2-37d7-41ad-8d6d-5535c3a33291/Aol9ZytV3G.json",
      message:
          "Ocorreu um erro ao buscar as informações. Por favor, verifique sua internet.",
      retry: CustomButton(
        isEnabled: true,
        label: "Tentar novamentee",
        onPressed: () {
          HomeCubit.read(context).getPrices();
        },
      ),
    );
  }

  Widget _buildEmptyContent() {
    return const StateView(
      url:
          "https://lottie.host/f92f76b7-d310-467e-a5f3-7c6a8b0c382b/chTsRX2yCg.json",
      message: "Não conseguimos encontrar valores disponíveis no momento.",
    );
  }
}
