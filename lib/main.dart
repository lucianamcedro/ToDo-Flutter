import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_flutter/screens/tasks_screen.dart';
import 'package:to_do_flutter/services/app_router.dart';
import 'blocs/bloc_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Tasks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
