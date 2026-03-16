part of 'rick_cubit.dart';

@immutable
sealed class RickState {}

final class RickInitial extends RickState {}

final class Loading extends RickState {}

final class Error extends RickState {}

final class Success extends RickState {
  Success({required this.rickModel});

  final RickModel rickModel;
}

class SuccessDetail extends RickState {
  final RickResult rickResult;
  final List<EpisodeModel> episodes;
  SuccessDetail({required this.rickResult, required this.episodes});
}
