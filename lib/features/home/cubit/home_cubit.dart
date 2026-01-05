import 'package:bloc/bloc.dart';
import 'package:news_app/features/home/models/top_headlines_api_response.dart';
import 'package:news_app/features/home/models/top_headlines_body.dart';
import 'package:news_app/features/home/views/pages/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeServices = HomeServices();
  Future<void> getTopHeadlines() async {
    emit(TopHeadlinesLoading());
    try {
      final body = TopHeadlinesBody(
        category: 'business',
        country: 'us',
        page: 1,
        pageSize: 7,
      );
      final result = await homeServices.getTopHeadLines(body);
      emit(TopHeadlinesLoaded(result.articles));
    } catch (e) {
      emit(TopHeadlinesError(e.toString()));
    }
  }

  Future<void> getRecommendationsItems() async {
    emit(RecommendedNewsLoading());
    try {
      final body = TopHeadlinesBody(page: 1, pageSize: 15);
      final result = await homeServices.getTopHeadLines(body);
      emit(RecommendedNewsLoaded(result.articles));
    } catch (e) {
      emit(RecommendedNewsError(e.toString()));
    }
  }
}
