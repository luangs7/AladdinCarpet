import 'package:alladin/common/components/baseview/base_view.dart';
import 'package:alladin/common/components/stateview/state_view.dart';
import 'package:alladin/common/observer/model/observer.dart';
import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/data/local/di/local_module.dart';
import 'package:alladin/data/remote/di/remote_module.dart';
import 'package:alladin/data/respository/di/repository_module.dart';
import 'package:alladin/domain/di/domain_module.dart';
import 'package:alladin/presentation/budget/di/budget_module.dart';
import 'package:alladin/presentation/history/di/history_module.dart';
import 'package:alladin/presentation/history/view/history_view.dart';
import 'package:alladin/presentation/home/di/home_module.dart';
import 'package:alladin/presentation/home/states/home_states.dart';
import 'package:alladin/presentation/home/view/carpet_content.dart';
import 'package:alladin/presentation/home/view/carpet_prices.dart';
import 'package:alladin/presentation/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialiseGetIt();
  runApp(const MyApp());
}

Future _initialiseGetIt() async {
  GetIt.instance
    ..localModule()
    ..remoteModule()
    ..domainModule()
    ..repositoryModule()
    ..homeModule()
    ..budgetModule()
    ..historyModule();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => FutureBuilder(
            future: GetIt.instance.allReady(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BaseView(child: MyHomePage());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        '/history': (context) => BaseView(child: HistoryView()),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements Observer {
  final viewModel = GetIt.instance.get<HomeViewModel>();
  ViewEvent? viewEvent;

  @override
  void initState() {
    super.initState();
    viewModel.subscribe(this);
    viewModel.getPrices();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.unsubscribe(this);
  }

  @override
  void update(data) {
    setState(() {
      viewEvent = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    switch (viewEvent.runtimeType) {
      case HomeLoadingEvent:
        return const CircularProgressIndicator(color: Colors.red);
      case HomeLoadedEvent:
        return CarpetContent(viewEvent as HomeLoadedEvent);
      case HomeEmptyEvent:
        return const StateView(
          url:
              "https://lottie.host/f92f76b7-d310-467e-a5f3-7c6a8b0c382b/chTsRX2yCg.json",
          message: "Não conseguimos encontrar valores disponíveis no momento.",
        );
      case HomeExceptionEvent:
        return const StateView(
          url:
              "https://lottie.host/dc5bedd2-37d7-41ad-8d6d-5535c3a33291/Aol9ZytV3G.json",
          message:
              "Ocorreu um erro ao buscar as informações. Por favor, verifique sua internet.",
        );
      default:
        return const Text("nothing here");
    }
  }
}
