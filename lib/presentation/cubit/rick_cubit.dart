import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morti/core/error/failure.dart';
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
  String? nextUrl;

  RickCubit(
    GetCharactersUsecase getCharactersUsecase,
    GetCharacterDetailUsecase getCharacterDetailUsecase,
    GetEpisodesUsecase getEpisodesUsecase,
  )   : _getCharacterDetailUsecase = getCharacterDetailUsecase,
        _getEpisodesUsecase = getEpisodesUsecase,
        _getCharactersUsecase = getCharactersUsecase,
        super(RickInitial());

  final List<RickResult> _allCharacters = [];

  void getCharacters() async {
    emit(Loading());
    final result = await _getCharactersUsecase.call(null);
    result.fold((failure) => emit(Error(failure.message)), (response) {
      nextUrl = response.info.next;
      _allCharacters
        ..clear()
        ..addAll(response.results);
      emit(Success(rickModel: response, characters: List.from(_allCharacters)));
    });
  }

  Future<void> getNextPage() async {
    if (nextUrl == null || state is Loading || state is LoadingMore) return;
    emit(LoadingMore(characters: List.from(_allCharacters)));
    final results = await Future.wait([
      _getCharactersUsecase.call(nextUrl),
      Future.delayed(Duration(seconds: 2)),
    ]);

    final result = results[0] as Either<Failure, RickModel>;
    result.fold((failure) => emit(Error(failure.message)), (response) {
      nextUrl = response.info.next;
      _allCharacters.addAll(response.results);
      emit(Success(rickModel: response, characters: List.from(_allCharacters)));
    });
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
