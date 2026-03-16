import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morti/data/repositories/repository.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';

part 'rick_state.dart';

@Injectable()
class RickCubit extends Cubit<RickState> {
  final Repository repository;

  RickCubit({required this.repository}) : super(RickInitial());

  void getCharacters() async {
    emit(Loading());
    try {
      final reponse = await repository.getCharacters();
      emit(Success(rickModel: reponse));
    } catch (e) {
      emit(Error());
    }
  }

  Future<void> getCharacterDetail(int id) async {
    try {
      print('>>> загружаем персонажа $id');
      final result = await repository.getDetailCharacters(id);
      print('>>> персонаж загружен: ${result.name}');
      print('>>> эпизодов: ${result.episode.length}');
      final episodes = await repository.getEpisodes(result.episode);
      print('>>> эпизоды загружены: ${episodes.length}');
      emit(SuccessDetail(rickResult: result, episodes: episodes));
      print('>>> стейт эмитнут');
    } catch (e) {
      print('>>> ОШИБКА: $e');
      emit(Error());
    }
  }
}
