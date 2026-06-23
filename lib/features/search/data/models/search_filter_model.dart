import 'package:equatable/equatable.dart';

class SearchFilterModel extends Equatable {
  final String? category;
  final String? subCategory;
  final double? minPrice;
  final double? maxPrice;
  final double? rating;
  final String? country;
  final String? sortBy;

  const SearchFilterModel({
    this.category,
    this.subCategory,
    this.minPrice,
    this.maxPrice,
    this.rating,
    this.country,
    this.sortBy,
  });

  SearchFilterModel copyWith({
    String? category,
    String? subCategory,
    double? minPrice,
    double? maxPrice,
    double? rating,
    String? country,
    String? sortBy,
  }) {
    return SearchFilterModel(
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      rating: rating ?? this.rating,
      country: country ?? this.country,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  @override
  List<Object?> get props => [
        category,
        subCategory,
        minPrice,
        maxPrice,
        rating,
        country,
        sortBy,
      ];
}
