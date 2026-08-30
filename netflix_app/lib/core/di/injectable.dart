import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  asExtension: true, // Uses getIt.init() syntax
)
Future<void> configureInjection() async {
  await getIt.init(environment: Environment.prod);
}