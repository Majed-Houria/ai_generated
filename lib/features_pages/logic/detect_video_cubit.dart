import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../networking/api_result.dart';
import '../data/repository/detect_repository.dart';
import 'detect_video_state.dart';

class DetectVideoCubit extends Cubit<DetectVideoState> {
  final DetectRepository detectRepository;

  DetectVideoCubit(this.detectRepository)
      : super(const DetectVideoState.initial());


  Future<void> detectVideo(FormData body) async {
    emit(const DetectVideoState.loading());

    final result = await detectRepository.detectVideo(body);

    result.when(
      success: (detectVideo) async {
        emit(DetectVideoState.success(detectVideo));
      },
      failure: (error) => emit(DetectVideoState.error(error: error)),
    );
  }
}
