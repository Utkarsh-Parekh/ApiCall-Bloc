import 'package:api_call_bloc/screen/api_page.dart';
import 'package:api_call_bloc/screen/favorite_page.dart';
import 'package:api_call_bloc/screen/home_page.dart';
import 'package:api_call_bloc/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final _navigatorKey = GlobalKey<NavigatorState>();
  static final _navigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: "shellHome");

  static final _navigatorFavoriteKey =
  GlobalKey<NavigatorState>(debugLabel: "shellFavorite");

  static final _navigatorProfileKey =
  GlobalKey<NavigatorState>(debugLabel: "shellProfile");

  static final GoRouter routes = GoRouter(

    initialLocation: "/ApiPage",
    navigatorKey: _navigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomePage(
            navigationShell: navigationShell,
          );
        },
        branches: [
          //Api Page
          StatefulShellBranch(
            navigatorKey: _navigatorHomeKey,
            routes: [
              GoRoute(
                path: "/ApiPage",
                name: "ApiPage",
                builder: (context,state){
                  return ApiPage(
                    key: state.pageKey,
                  );
                }
              ),
            ],
          ),

          //Favorite Page
          StatefulShellBranch(
            navigatorKey: _navigatorFavoriteKey,
            routes: [
              GoRoute(
                  path: "/FavoritePage",
                  name: "FavoritePage",
                  builder: (context,state){
                    return FavoritePage(
                      key: state.pageKey,
                    );
                  }
              ),
            ],
          ),

          //Profile Page
          StatefulShellBranch(
            navigatorKey: _navigatorProfileKey,
            routes: [
              GoRoute(
                  path: "/ProfilePage",
                  name: "ProfilePage",
                  builder: (context,state){
                    return ProfilePage(
                      key: state.pageKey,
                    );
                  }
              ),
            ],
          )
        ],
      ),


    ],
  );
}
