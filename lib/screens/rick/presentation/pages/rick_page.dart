import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/di/inject_module.dart';
import 'package:rick_and_morti/screens/detail/presentation/pages/rick_detail_page.dart';
import 'package:rick_and_morti/screens/rick/presentation/widgets/character_card_widget.dart';
import 'package:rick_and_morti/screens/rick/cubit/rick_cubit.dart';

class RickPage extends StatefulWidget {
  const RickPage({super.key});

  @override
  State<RickPage> createState() => _RickPageState();
}

class _RickPageState extends State<RickPage> {
  final cubit = getIt<RickCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getCharacters();
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
            return Text('ERROR');
          }
          if (state is Success) {
            final list = state.rickModel.results;
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RickDetailPage(id: item.id),
                      ),
                    );
                  },
                  child: CharacterCardWidget(
                    name: item.name,
                    image: item.image,
                    id: item.id,
                    status: item.status,
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
