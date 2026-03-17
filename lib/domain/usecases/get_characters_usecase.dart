import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morti/core/error/failure.dart';
import 'package:rick_and_morti/core/usecase/usecase.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';
import 'package:rick_and_morti/domain/repos/rick_repository.dart';

@lazySingleton
class GetCharactersUsecase implements Usecase<RickModel, NoParams> {
  final RickRepository repository;

  GetCharactersUsecase(this.repository);

  @override
  Future<Either<Failure, RickModel>> call(params) {
    return repository.getCharacters();
  }
}

class NoParams {}
