import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/core/router/app_router.dart';
import 'package:rick_and_morti/di/inject_module.dart';
import 'package:rick_and_morti/presentation/rick/widgets/character_card_widget.dart';
import '../../cubit/rick_cubit.dart';

@RoutePage()
class RickPage extends StatefulWidget {
  const RickPage({super.key});

  @override
  State<RickPage> createState() => _RickPageState();
}

class _RickPageState extends State<RickPage> {
  final cubit = getIt<RickCubit>();
  final _scrollController = ScrollController();
  bool _isFetching = false;
  DateTime? _lastFetch;

  @override
  void initState() {
    super.initState();
    cubit.getCharacters();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_isBottom || _isFetching) return;
    final now = DateTime.now();
    if (_lastFetch != null &&
        now.difference(_lastFetch!) < Duration(seconds: 1)) {
      return;
    }
    _isFetching = true;
    _lastFetch = now;
    cubit.getNextPage().whenComplete(() => _isFetching = false);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
      ),
      body: BlocBuilder<RickCubit, RickState>(
        bloc: cubit,
        builder: (BuildContext context, RickState state) {
          if (state is Error) {
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 35,
                ),
                Text(
                  'ERROR',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ));
          }
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Success || state is LoadingMore) {
            final characters = state is Success
                ? state.characters
                : (state as LoadingMore).characters;
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = characters[index];
                        return InkWell(
                          onTap: () => context.pushRoute(
                              RickDetailRoute(id: item.id, name: item.name)),
                          child: CharacterCardWidget(
                            name: item.name,
                            image: item.image,
                            id: item.id,
                            status: item.status,
                          ),
                        );
                      },
                      childCount: characters.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                  ),
                ),
                if (state is LoadingMore)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
