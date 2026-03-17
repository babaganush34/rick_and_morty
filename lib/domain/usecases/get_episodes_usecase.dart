import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morti/core/error/failure.dart';
import 'package:rick_and_morti/core/usecase/usecase.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';
import 'package:rick_and_morti/domain/repos/rick_repository.dart';

@lazySingleton
class GetEpisodesUsecase implements Usecase<List<EpisodeModel>, List<String>> {
  final RickRepository repository;

  GetEpisodesUsecase(this.repository);

  @override
  Future<Either<Failure, List<EpisodeModel>>> call(List<String> urls) {
    return repository.getEpisodes(urls);
  }
}
