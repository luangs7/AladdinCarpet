import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/model/carpet_budget.dart';
import 'package:alladin/presentation/history/provider/history_cubit.dart';
import 'package:alladin/presentation/history/view/history_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<StatefulWidget> createState() => HistoryViewState();
}

class HistoryViewState extends State<HistoryView> {
  List<CarpetBudget> budgets = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, ViewEvent>(builder: (context, state) {
      context.watch<HistoryCubit>().getHistory();
      return HistoryContent(
        viewEvent: state,
      );
    });
  }
}
