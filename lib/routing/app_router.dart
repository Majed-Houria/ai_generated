import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/ui/login_screen.dart';
import '../auth/ui/register_screen.dart';
import '../features_pages/logic/histories_image_cubit.dart';
import '../features_pages/logic/histories_text_cubit.dart';
import '../features_pages/logic/histories_video_cubit.dart';
import '../features_pages/ui/history_selector_page.dart';
import '../features_pages/ui/image_history_page.dart';
import '../features_pages/ui/text_history_page.dart';
import '../features_pages/ui/video_history_page.dart';
import '../home_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.historySelectorPage:
        return MaterialPageRoute(builder: (_) => const HistorySelectorPage());
      case Routes.imageHistoryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HistoriesImageCubit>()..historiesImage(),
            child: const ImageHistoryPage(),
          ),
        );
      case Routes.videoHistoryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HistoriesVideoCubit>()..historiesVideo(),
            child: const VideoHistoryPage(),
          ),
        );
      case Routes.textHistoryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HistoriesTextCubit>()..historiesText(),
            child: const TextHistoryPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
