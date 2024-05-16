import 'package:alladin/common/components/button/custom_button.dart';
import 'package:alladin/common/components/refreshbutton/refresh_button.dart';
import 'package:alladin/presentation/budget/provider/budget_cubit.dart';
import 'package:alladin/presentation/budget/view/budget_simulate_view.dart';
import 'package:alladin/presentation/home/provider/home_cubit.dart';
import 'package:alladin/presentation/home/states/home_states.dart';
import 'package:alladin/presentation/home/view/carpet_prices.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarpetContent extends StatefulWidget {
  final HomeLoadedEvent event;
  const CarpetContent(this.event, {super.key});

  @override
  State<StatefulWidget> createState() => CarpetContentState();
}

class CarpetContentState extends State<CarpetContent> {
  bool hasDialog = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: RefreshButton(
                onTap: () => HomeCubit.read(context).getPrices(),
              ),
            ),
            _buildLottieAnimation(),
            const Text(
              "Veja nossa tabela de preços atualizada e faça seu orçamento agora mesmo.",
              textAlign: TextAlign.center, // Center the text
            ),
            CarpetPrices(carpets: widget.event.carpets),
            Expanded(child: Container()),
            _buildButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildLottieAnimation() {
    return Lottie.network(
      "https://lottie.host/d485fff5-83a6-48f8-adc2-969cb5fc0f0f/1Qrlipcl3l.json",
      repeat: true,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildButtonRow() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust as needed
          children: [
            CustomButton(
              isEnabled: true,
              label: "Faça um orçamento",
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    useSafeArea: true,
                    builder: (_) {
                      return BudgeSimulateView(widget.event.carpets);
                    }).then((value) => BudgetCubit.read(context).clearValue());
              },
            ),
            CustomButton(
              isEnabled: true,
              label: "Meus Orçamentos",
              onPressed: () {
                Navigator.of(context).pushNamed("/history");
              },
            ),
          ],
        ));
  }
}
