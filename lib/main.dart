import 'package:alladin/common/components/baseview/base_view.dart';
import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/data/local/di/local_module.dart';
import 'package:alladin/data/remote/di/remote_module.dart';
import 'package:alladin/data/respository/di/repository_module.dart';
import 'package:alladin/core/di/global_providers.dart';
import 'package:alladin/domain/di/domain_module.dart';
import 'package:alladin/presentation/history/view/history_view.dart';
import 'package:alladin/presentation/home/provider/home_cubit.dart';
import 'package:alladin/presentation/home/view/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialiseGetIt();
  runApp(GlobalBlocProviders(child: const MyApp()));
}

Future _initialiseGetIt() async {
  GetIt.instance
    ..localModule()
    ..remoteModule()
    ..domainModule()
    ..repositoryModule();
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, ViewEvent>(builder: (context, state) {
      return HomeContent(
        viewEvent: state,
      );
    });
  }
}
