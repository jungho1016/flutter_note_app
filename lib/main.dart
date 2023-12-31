import 'package:flutter/material.dart';
import 'package:flutter_note_app/di/di_setup.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'router.dart';

void main() async {
  // 플랫폼 채널의 위젯 바인딩을 보장
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
        primaryColor: Colors.white,
        canvasColor: darkGray,
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: lightBlue,
                  foregroundColor: darkGray,
                ),
        appBarTheme:
            Theme.of(context).appBarTheme.copyWith(backgroundColor: darkGray),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
            ),
      ),
    );
  }
}
