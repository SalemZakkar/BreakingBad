import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/buisness_logic/cubit/theme_mode_cubit.dart';
import 'package:breaking_bad/data/shared_preference/shared_preference.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await optionService.init();
  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => themeModeCubit,
      )
    ],
    child: const BreakingBadApp(),
  ));
}

class BreakingBadApp extends StatefulWidget {
  const BreakingBadApp({Key? key}) : super(key: key);

  @override
  State<BreakingBadApp> createState() => _BreakingBadAppState();
}

class _BreakingBadAppState extends State<BreakingBadApp> {
   int activeTheme = AppTheme.initTheme();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeModeCubit, ThemeModeState>(
      listener: (context, state) {
        if(state is ThemeModeChange)
          {
            setState(() {
              activeTheme = state.index;
            });
          }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemes[activeTheme],
        onGenerateRoute: AppRouter.generate,
        initialRoute: AppRouter.home,
        builder: (context, child) => child!,
      ),
    );
  }
}

