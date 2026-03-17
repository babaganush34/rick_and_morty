// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/datasources/api_service.dart' as _i630;
import '../data/repositories/rick_repository_impl.dart' as _i166;
import '../domain/repos/rick_repository.dart' as _i575;
import '../domain/usecases/get_character_detail_usecase.dart' as _i816;
import '../domain/usecases/get_characters_usecase.dart' as _i95;
import '../domain/usecases/get_episodes_usecase.dart' as _i544;
import '../presentation/cubit/rick_cubit.dart' as _i676;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i630.ApiService>(() => _i630.ApiService());
    gh.lazySingleton<_i575.RickRepository>(
        () => _i166.RickRepositoryImpl(gh<_i630.ApiService>()));
    gh.lazySingleton<_i816.GetCharacterDetailUsecase>(
        () => _i816.GetCharacterDetailUsecase(gh<_i575.RickRepository>()));
    gh.lazySingleton<_i95.GetCharactersUsecase>(
        () => _i95.GetCharactersUsecase(gh<_i575.RickRepository>()));
    gh.lazySingleton<_i544.GetEpisodesUsecase>(
        () => _i544.GetEpisodesUsecase(gh<_i575.RickRepository>()));
    gh.factory<_i676.RickCubit>(() => _i676.RickCubit(
          gh<_i95.GetCharactersUsecase>(),
          gh<_i816.GetCharacterDetailUsecase>(),
          gh<_i544.GetEpisodesUsecase>(),
        ));
    return this;
  }
}
