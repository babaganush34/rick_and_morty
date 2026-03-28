import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morti/data/models/rick_model.dart';

@Injectable()
class ApiService {
  final dio = Dio();

  Future<RickModel> getCharacters({String? nextUrl}) async {
    final response =
        await dio.get(nextUrl ?? 'https://rickandmortyapi.com/api/character');
    debugPrint(nextUrl);
    final data = RickModel.fromJson(response.data);
    debugPrint(data.toString());
    return data;
  }

  Future<RickResult> getDetailCharacters(int id) async {
    final response =
        await dio.get('https://rickandmortyapi.com/api/character/$id');
    final data = RickResult.fromJson(response.data);
    return data;
  }

  Future<List<EpisodeModel>> getEpisodes(List<String> urls) async {
    try {
      final ids = urls.map((url) => url.split('/').last).join(',');
      final response = await dio.get(
        'https://rickandmortyapi.com/api/episode/$ids',
      );
      if (response.data is List) {
        return (response.data as List)
            .map((e) => EpisodeModel.fromJson(e))
            .toList();
      } else {
        return [EpisodeModel.fromJson(response.data)];
      }
    } catch (e) {
      return [];
    }
  }
}
