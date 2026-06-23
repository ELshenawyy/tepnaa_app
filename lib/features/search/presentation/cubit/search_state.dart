part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Map<String, dynamic>> results;

  const SearchSuccess({required this.results});

  @override
  List<Object?> get props => [results];
}

final class SearchEmpty extends SearchState {}

final class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
