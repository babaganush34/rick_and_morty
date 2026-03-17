import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morti/core/error/failure.dart';
import 'package:rick_and_morti/data/datasources/api_service.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';
import 'package:rick_and_morti/domain/repos/rick_repository.dart';

@LazySingleton(as: RickRepository)
class RickRepositoryImpl implements RickRepository {
  final ApiService apiService;

  RickRepositoryImpl(this.apiService);
  @override
  Future<Either<Failure, RickModel>> getCharacters() async {
    try {
      final list = await apiService.getCharacters();
      return Right(list);
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.data['message'] ?? 'Server error'));
    } catch (e) {
      return Left(UnimplementedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RickResult>> getCharacterDetail(int id) async {
    try {
      final result = await apiService.getDetailCharacters(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EpisodeModel>>> getEpisodes(List<String> urls) async {
    try {
      final episodes = await apiService.getEpisodes(urls);
      return Right(episodes);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
