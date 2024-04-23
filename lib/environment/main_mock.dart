import 'package:alladin/flavors/flavor.dart';
import 'package:alladin/flavors/flavor_config.dart';
import 'package:alladin/flavors/flavor_values.dart';
import 'package:alladin/main.dart';

void main() {
  FlavorConfig.initialize(
    flavor: Flavor.mock,
    values: const FlavorValues(
        apiBaseUrl: "https://testedefensoriapr.pythonanywhere.com/",
        showLogs: false),
  );

  startApp();
}
