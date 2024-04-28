import 'package:contactcars_task/features/movie/data/model/result.dart';

class MovieModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MovieModel({this.page, this.results, this.totalPages, this.totalResults});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      page: json['page'],
      results: json['results'] != null
          ? (json['results'] as List).map((i) => Results.fromJson(i)).toList()
          : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
