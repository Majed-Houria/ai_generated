import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../networking/api_error_handler.dart';
import '../data/models/detect_video.dart';

part 'detect_video_state.freezed.dart';

@freezed
class DetectVideoState with _$DetectVideoState {
  const factory DetectVideoState.initial() = DetectVideoInitial;
  const factory DetectVideoState.loading() = DetectVideoLoading;
  const factory DetectVideoState.success(DetectVideo detectVideo) = DetectVideoSuccessState;
  const factory DetectVideoState.error({required ErrorHandler error}) = DetectVideoError;
}
