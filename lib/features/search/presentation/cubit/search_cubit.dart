import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/features/search/data/models/search_filter_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  // TODO : WAITING FOR THE DATA 
  String _query = '';
  SearchFilterModel? _filter;

  void search(String query) {
    _query = query;
    _performSearch();
  }

  void applyfilter(SearchFilterModel filter) {
    _filter = filter;
    _performSearch();
  }

  void clearFilter() {
    _filter = null;
    _performSearch();
  }


  void _performSearch(){
      emit(SearchLoading());

  }
}
