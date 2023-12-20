import '../../domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath:
            json['backdrop_path'] ?? '/ta17TLthGdz5PZz6oUD3N5BRurh.jpg',
        id: json['id'],
      );
}
