import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../networking/api_result.dart';
import '../data/repository/detect_repository.dart';
import 'histories_image_state.dart';

class HistoriesImageCubit extends Cubit<HistoriesImageState> {
  final DetectRepository detectRepository;

  HistoriesImageCubit(this.detectRepository)
      : super(const HistoriesImageState.initial());


  Future<void> historiesImage() async {
    emit(const HistoriesImageState.loading());

    final result = await detectRepository.historiesImage();

    result.when(
      success: (historiesImage) async {
        emit(HistoriesImageState.success(historiesImage));
      },
      failure: (error) => emit(HistoriesImageState.error(error: error)),
    );
  }
}
