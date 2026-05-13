import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../networking/api_result.dart';
import '../data/repository/detect_repository.dart';
import 'histories_video_state.dart';

class HistoriesVideoCubit extends Cubit<HistoriesVideoState> {
  final DetectRepository detectRepository;

  HistoriesVideoCubit(this.detectRepository)
      : super(const HistoriesVideoState.initial());


  Future<void> historiesVideo() async {
    emit(const HistoriesVideoState.loading());

    final result = await detectRepository.historiesVideo();

    result.when(
      success: (historiesVideo) async {
        emit(HistoriesVideoState.success(historiesVideo));
      },
      failure: (error) => emit(HistoriesVideoState.error(error: error)),
    );
  }
}
