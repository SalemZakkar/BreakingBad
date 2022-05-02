import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(const BreakingBadApp());
}
ThemeData activeTheme = AppTheme.light;
class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: activeTheme,
      onGenerateRoute: AppRouter.generate,
      initialRoute: AppRouter.home,
      builder: (context , child) => child!,
    );
  }
}
