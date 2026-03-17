import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/di/inject_module.dart';
import 'package:rick_and_morti/presentation/detail/widgets/character_card_detail_widget.dart';
import '../../cubit/rick_cubit.dart';

class RickDetailPage extends StatefulWidget {
  const RickDetailPage({super.key, required this.id});

  final int id;

  @override
  State<RickDetailPage> createState() => _RickDetailPageState();
}

class _RickDetailPageState extends State<RickDetailPage> {
  late RickCubit cubit;

  @override
  void initState() {
    cubit = getIt<RickCubit>()..getCharacterDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<RickCubit, RickState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is SuccessDetail) {
            final item = state.rickResult;
            return Center(
              child: CharacterCardDetailWidget(
                name: item.name,
                image: item.image,
                id: item.id,
                status: item.status,
                gender: item.gender,
                species: item.species, 
                episodes: state.episodes,
              ),
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
