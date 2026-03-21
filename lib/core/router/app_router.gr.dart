// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [RickDetailPage]
class RickDetailRoute extends PageRouteInfo<RickDetailRouteArgs> {
  RickDetailRoute({
    required int id,
    required String name,
    List<PageRouteInfo>? children,
  }) : super(
          RickDetailRoute.name,
          args: RickDetailRouteArgs(id: id, name: name),
          initialChildren: children,
        );

  static const String name = 'RickDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RickDetailRouteArgs>();
      return RickDetailPage(id: args.id, name: args.name);
    },
  );
}

class RickDetailRouteArgs {
  const RickDetailRouteArgs({required this.id, required this.name});

  final int id;

  final String name;

  @override
  String toString() {
    return 'RickDetailRouteArgs{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RickDetailRouteArgs) return false;
    return id == other.id && name == other.name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

/// generated route for
/// [RickPage]
class RickRoute extends PageRouteInfo<void> {
  const RickRoute({List<PageRouteInfo>? children})
      : super(RickRoute.name, initialChildren: children);

  static const String name = 'RickRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RickPage();
    },
  );
}
