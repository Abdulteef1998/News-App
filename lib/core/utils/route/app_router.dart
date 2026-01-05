import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/route/app_routes.dart';
import 'package:news_app/features/home/views/pages/home_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      // case AppRoutes.search:
      //   return CupertinoPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => SearchCubit(),
      //       child: const SearchPage(),
      //     ),
      //     settings: settings,
      //   );
      // case AppRoutes.favorites:
      //   return CupertinoPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) {
      //         final cubit = FavoritesCubit();
      //         cubit.getFavoriteItems();
      //         return cubit;
      //       },
      //       child: const FavoritesPage(),
      //     ),
      //     settings: settings,
      //   );
      // case AppRoutes.articleDetails:
      //   final article = settings.arguments as Article;
      //   return CupertinoPageRoute(
      //     builder: (_) => ArticleDetailsPage(article: article),
      //     settings: settings,
      //   );
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          settings: settings,
        );
    }
  }
}
