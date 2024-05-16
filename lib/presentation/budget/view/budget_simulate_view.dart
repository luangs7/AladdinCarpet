import 'package:alladin/common/components/button/custom_button.dart';
import 'package:alladin/common/utils/string_utils.dart';
import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/shape.dart';
import 'package:alladin/presentation/budget/provider/budget_cubit.dart';
import 'package:alladin/presentation/budget/states/budget_states.dart';
import 'package:alladin/presentation/budget/view/bugdet_simulate_field.dart';
import 'package:alladin/presentation/budget/view/carpet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgeSimulateView extends StatefulWidget {
  final List<Carpet> carpets;

  const BudgeSimulateView(this.carpets, {super.key});

  @override
  State<StatefulWidget> createState() => BudgeSimulateViewState();
}

class BudgeSimulateViewState extends State<BudgeSimulateView> {
  Carpet? selectedShape;
  TextEditingController side1 = TextEditingController();
  TextEditingController side2 = TextEditingController();
  double totalValue = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetCubit, ViewEvent>(
      builder: (context, state) {
        if (state is BudgetValueEvent) {
          totalValue = state.value;
        }

        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          elevation: 7,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: [
                  Column(
                    children: [
                      createHeader(),
                      createRadio(context: context),
                      const SizedBox(
                        height: 16,
                      ),
                      createInputValues(context: context),
                      const SizedBox(
                        height: 8,
                      ),
                      if (totalValue > 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "O valor do seu tapete é de: ${formatCurrency(totalValue)}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      CustomButton(
                        isEnabled: totalValue > 0,
                        label: "Salvar",
                        onPressed: () {
                          save(context);
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget createHeader() {
    return Column(children: [
      const SizedBox(
        height: 8,
      ),
      Container(
        alignment: Alignment.topRight,
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Colors.black,
              size: 24,
            )),
      ),
      const Text(
        "Escolha a forma do seu tapete",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 16,
      ),
    ]);
  }

  Widget createRadio({required BuildContext context}) {
    return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.carpets
            .map((e) => createItem(carpet: e, context: context))
            .toList());
  }

  Widget createInputValues({required BuildContext context}) {
    return Wrap(children: [
      BudgetSimulateField(
          label: "Lado 1 (em metros)",
          hint: "0.0",
          controller: side1,
          enabled: selectedShape != null,
          onChanged: (value) {
            setState(() {
              getValue(context: context);
              side1.text = value;
            });
          }),
      if (getShapeFromString(selectedShape?.name ?? "") != Shape.CIRCULO)
        BudgetSimulateField(
          label: "Lado 2 (em metros)",
          hint: "0.0",
          controller: side2,
          enabled: selectedShape != null,
          onChanged: (value) {
            setState(() {
              getValue(context: context);
              side2.text = value;
            });
          },
        )
    ]);
  }

  Widget createItem({required Carpet carpet, required BuildContext context}) {
    return CarpetItem(
        carpet: carpet,
        selectedShape: selectedShape,
        onSelected: (value) {
          setState(() {
            totalValue = 0;
            selectedShape = value;
            if (canSeeBudget()) {
              getValue(context: context);
            }
          });
        });
  }

  void getValue({required BuildContext context}) {
    final sideOne = double.tryParse(side1.text) ?? 0;
    final sideTwo = double.tryParse(side2.text) ?? 0;
    BudgetCubit.read(context).getValue(selectedShape!, sideOne, sideTwo);
  }

  void save(BuildContext context) {
    final sideOne = double.tryParse(side1.text) ?? 0;
    final sideTwo = double.tryParse(side2.text) ?? 0;
    BudgetCubit.read(context)
        .save(selectedShape!, sideOne, sideTwo, totalValue);
  }

  bool canSeeBudget() {
    if (double.tryParse(side1.text) != null) {
      if (getShapeFromString(selectedShape?.name ?? "") != Shape.CIRCULO) {
        return double.tryParse(side2.text) != null;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}
