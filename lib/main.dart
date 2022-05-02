import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/buisness_logic/cubit/theme_mode_cubit.dart';
import 'package:breaking_bad/data/shared_preference/shared_preference.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await optionService.init();
  AppTheme.initTheme();
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

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ThemeModeState themeModeState =
        BlocProvider.of<ThemeModeCubit>(context).state;
    ThemeData activeTheme = (themeModeState is ThemeModeLight ? AppTheme.light : AppTheme.dark);
    return BlocListener<ThemeModeCubit, ThemeModeState>(
      listener: (context, state) {
        if(state is ThemeModeLight)
          {
            activeTheme = AppTheme.light;
          }
        else
          {
            activeTheme = AppTheme.dark;
          }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: activeTheme,
        onGenerateRoute: AppRouter.generate,
        initialRoute: AppRouter.home,
        builder: (context, child) => child!,
      ),
    );
  }
}
