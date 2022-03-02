import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/app/core/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
