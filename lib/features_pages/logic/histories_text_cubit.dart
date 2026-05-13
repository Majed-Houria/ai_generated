import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../networking/api_result.dart';
import '../data/repository/detect_repository.dart';
import 'histories_text_state.dart';

class HistoriesTextCubit extends Cubit<HistoriesTextState> {
  final DetectRepository detectRepository;

  HistoriesTextCubit(this.detectRepository)
      : super(const HistoriesTextState.initial());


  Future<void> historiesText() async {
    emit(const HistoriesTextState.loading());

    final result = await detectRepository.historiesText();

    result.when(
      success: (historiesText) async {
        emit(HistoriesTextState.success(historiesText));
      },
      failure: (error) => emit(HistoriesTextState.error(error: error)),
    );
  }
}
