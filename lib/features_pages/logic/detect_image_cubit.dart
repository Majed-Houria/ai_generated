import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../networking/api_result.dart';
import '../data/repository/detect_repository.dart';
import 'detect_image_state.dart';

class DetectImageCubit extends Cubit<DetectImageState> {
  final DetectRepository detectRepository;

  DetectImageCubit(this.detectRepository)
      : super(const DetectImageState.initial());


  Future<void> detectImage(FormData body) async {
    emit(const DetectImageState.loading());

    final result = await detectRepository.detectImage(body);

    result.when(
      success: (detectImage) async {
        emit(DetectImageState.success(detectImage));
      },
      failure: (error) => emit(DetectImageState.error(error: error)),
    );
  }
}
