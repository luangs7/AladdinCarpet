import 'package:alladin/common/components/button/custom_button.dart';
import 'package:alladin/common/observer/model/observer.dart';
import 'package:alladin/common/utils/string_utils.dart';
import 'package:alladin/domain/model/carpet.dart';
import 'package:alladin/domain/model/shape.dart';
import 'package:alladin/presentation/budget/view/bugdet_simulate_field.dart';
import 'package:alladin/presentation/budget/view/carpet_item.dart';
import 'package:alladin/presentation/budget/viewmodel/budget_simulate_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BudgeSimulateView extends StatefulWidget {
  final List<Carpet> carpets;

  const BudgeSimulateView(this.carpets, {super.key});

  @override
  State<StatefulWidget> createState() => BudgeSimulateViewState();
}

class BudgeSimulateViewState extends State<BudgeSimulateView>
    implements Observer {
  final viewModel = GetIt.instance.get<BudgetSimulateViewModel>();
  Carpet? selectedShape;
  TextEditingController side1 = TextEditingController();
  TextEditingController side2 = TextEditingController();
  double totalValue = -1;

  @override
  void initState() {
    super.initState();
    viewModel.subscribe(this);
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.unsubscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 7,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(children: [
                Column(
                  children: [
                    createHeader(),
                    createRadio(),
                    const SizedBox(
                      height: 16,
                    ),
                    createInputValues(),
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
                          )),
                    CustomButton(
                      isEnabled: totalValue > 0,
                      label: "Salvar",
                      onPressed: () {
                        save();
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                )
              ])),
        ));
  }

  @override
  void update(data) {
    setState(() {
      if (data is double) {
        totalValue = data;
      }
    });
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

  Widget createRadio() {
    return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.carpets.map((e) => createItem(carpet: e)).toList());
  }

  Widget createInputValues() {
    return Wrap(children: [
      BudgetSimulateField(
          label: "Lado 1 (em metros)",
          hint: "0.0",
          controller: side1,
          enabled: selectedShape != null,
          onChanged: (value) {
            setState(() {
              getValue();
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
              getValue();
              side2.text = value;
            });
          },
        )
    ]);
  }

  Widget createItem({required Carpet carpet}) {
    return CarpetItem(
        carpet: carpet,
        selectedShape: selectedShape,
        onSelected: (value) {
          setState(() {
            totalValue = 0;
            selectedShape = value;
            if (canSeeBudget()) {
              getValue();
            }
          });
        });
  }

  void getValue() {
    final sideOne = double.tryParse(side1.text) ?? 0;
    final sideTwo = double.tryParse(side2.text) ?? 0;
    viewModel.getValue(selectedShape!, sideOne, sideTwo);
  }

  void save() {
    final sideOne = double.tryParse(side1.text) ?? 0;
    final sideTwo = double.tryParse(side2.text) ?? 0;
    viewModel.save(selectedShape!, sideOne, sideTwo, totalValue);
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
