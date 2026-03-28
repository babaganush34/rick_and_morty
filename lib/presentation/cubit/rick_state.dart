part of 'rick_cubit.dart';

@immutable
sealed class RickState {}

final class RickInitial extends RickState {}

final class Loading extends RickState {}

final class LoadingMore extends RickState {
  final List<RickResult> characters;
  LoadingMore({required this.characters});
}

final class Error extends RickState {
  final String error;

  Error(this.error);
}

final class Success extends RickState {
  Success({required this.rickModel, required this.characters});

  final RickModel rickModel;
  final List<RickResult> characters;
}

class SuccessDetail extends RickState {
  final RickResult rickResult;
  final List<EpisodeModel> episodes;
  SuccessDetail({required this.rickResult, required this.episodes});
}
