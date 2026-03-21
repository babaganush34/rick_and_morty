import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morti/presentation/detail/pages/rick_detail_page.dart';
import 'package:rick_and_morti/presentation/rick/pages/rick_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: RickRoute.page, initial: true),
    AutoRoute(page: RickDetailRoute.page),
  ];
}