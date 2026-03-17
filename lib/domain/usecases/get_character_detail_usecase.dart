import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morti/core/error/failure.dart';
import 'package:rick_and_morti/core/usecase/usecase.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';
import 'package:rick_and_morti/domain/repos/rick_repository.dart';

@lazySingleton
class GetCharacterDetailUsecase implements Usecase<RickResult, int> {
  final RickRepository repository;

  GetCharacterDetailUsecase(this.repository);

  @override
  Future<Either<Failure, RickResult>> call(int id) {
    return repository.getCharacterDetail(id);
  }
}
