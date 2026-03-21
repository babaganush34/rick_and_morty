import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';
import 'package:rick_and_morti/domain/usecases/get_character_detail_usecase.dart';
import 'package:rick_and_morti/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morti/domain/usecases/get_episodes_usecase.dart';

part 'rick_state.dart';

@Injectable()
class RickCubit extends BaseCubit<RickState> {
  final GetCharactersUsecase _getCharactersUsecase;
  final GetCharacterDetailUsecase _getCharacterDetailUsecase;
  final GetEpisodesUsecase _getEpisodesUsecase;

  RickCubit(
    GetCharactersUsecase getCharactersUsecase,
    GetCharacterDetailUsecase getCharacterDetailUsecase,
    GetEpisodesUsecase getEpisodesUsecase,
  )   : _getCharacterDetailUsecase = getCharacterDetailUsecase,
        _getEpisodesUsecase = getEpisodesUsecase,
        _getCharactersUsecase = getCharactersUsecase,
        super(RickInitial());

  void getCharacters() async {
    emit(Loading());
    final result = await _getCharactersUsecase.call(NoParams());
    result.fold(
      (failure) => emit(Error(failure.message)),
      (response) => emit(Success(rickModel: response)),
    );
  }

  Future<void> getCharacterDetail(int id) async {
    emit(Loading());
    final charResult = await _getCharacterDetailUsecase.call(id);
    charResult.fold((failure) => emit(Error(failure.message)),
        (character) async {
      final episodesResult = await _getEpisodesUsecase.call(character.episode);
      episodesResult.fold(
          (failure) => emit(Error(failure.message)),
          (episodes) =>
              emit(SuccessDetail(rickResult: character, episodes: episodes)));
    });
  }
}

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  void printEmit(S state) {
    print(state.toString());
    emit(state);
  }
}
