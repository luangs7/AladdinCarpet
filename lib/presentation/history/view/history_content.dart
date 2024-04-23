import 'package:alladin/common/components/stateview/state_view.dart';
import 'package:alladin/common/utils/string_utils.dart';
import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/presentation/history/states/history_states.dart';
import 'package:flutter/material.dart';

class HistoryContent extends StatelessWidget {
  final ViewEvent viewEvent;
  List<CarpetBudget> budgets = [];

  HistoryContent({super.key, required this.viewEvent});

  Widget createList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: budgets.length,
      itemBuilder: (context, index) {
        return createItem(budgets[index]);
        // return createItem(budgets[index]);
      },
    );
  }

  Widget createItem(CarpetBudget budget) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 10),
                  blurRadius: 50),
            ],
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Align children to the start vertically
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align children to the start horizontally
                  children: [
                    createInformation("Shape", budget.shape.name.capitalize()),
                    const SizedBox(
                      height: 16,
                    ),
                    createInformation(
                        "Dimensions", toDimensions(budget.side1, budget.side2))
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: createInformation(
                      "Valor total:", formatCurrency(budget.totalValue)),
                ),
              ),
            ],
          ),
        ));
  }

  Widget createInformation(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (viewEvent.runtimeType) {
      case HistoryEmptyEvent:
        return const StateView(
          url:
              "https://lottie.host/f92f76b7-d310-467e-a5f3-7c6a8b0c382b/chTsRX2yCg.json",
          message: "Não há orçamentos salvos ainda.",
        );
      case HistoryExceptionEvent:
        return const StateView(
          url:
              "https://lottie.host/dc5bedd2-37d7-41ad-8d6d-5535c3a33291/Aol9ZytV3G.json",
          message: "Ocorreu um erro ao buscar as informações.",
        );

      case HistoryLoadedEvent:
        budgets = (viewEvent as HistoryLoadedEvent).budgets;
        return createList();
      case HistoryLoadingEvent:
        return const CircularProgressIndicator(color: Colors.red);
      default:
        return const Center();
    }
  }
}
