import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../networking/api_error_handler.dart';
import '../data/models/detect_image.dart';

part 'detect_image_state.freezed.dart';

@freezed
class DetectImageState with _$DetectImageState {
  const factory DetectImageState.initial() = DetectImageInitial;
  const factory DetectImageState.loading() = DetectImageLoading;
  const factory DetectImageState.success(DetectImage detectImage) = DetectImageSuccessState;
  const factory DetectImageState.error({required ErrorHandler error}) = DetectImageError;
}
