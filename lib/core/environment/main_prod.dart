import 'package:alladin/core/flavors/flavor.dart';
import 'package:alladin/core/flavors/flavor_config.dart';
import 'package:alladin/core/flavors/flavor_values.dart';
import 'package:alladin/main.dart';

void main() {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
        apiBaseUrl: "https://testedefensoriapr.pythonanywhere.com/",
        showLogs: false),
  );

  startApp();
}
