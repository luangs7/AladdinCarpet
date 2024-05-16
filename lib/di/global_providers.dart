import 'package:alladin/presentation/budget/provider/budget_cubit.dart';
import 'package:alladin/presentation/history/provider/history_cubit.dart';
import 'package:alladin/presentation/home/provider/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;
  final getIt = GetIt.instance;

  GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) =>
              HomeCubit(pricesUseCase: getIt.get())..getPrices(),
        ),
        BlocProvider<HistoryCubit>(
          create: (context) => HistoryCubit(getUseCase: getIt.get()),
        ),
        BlocProvider<BudgetCubit>(
            create: (context) => BudgetCubit(
                saveUseCase: getIt.get(), budgetUseCase: getIt.get())),
      ],
      child: child,
    );
  }
}
