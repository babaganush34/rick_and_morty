import 'package:dartz/dartz.dart';
import 'package:rick_and_morti/core/error/failure.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';

abstract class RickRepository {
  Future<Either<Failure, RickModel>> getCharacters({String? nextUrl});
  Future<Either<Failure, List<EpisodeModel>>> getEpisodes(List<String> urls);
  Future<Either<Failure, RickResult>> getCharacterDetail(int id);
}
