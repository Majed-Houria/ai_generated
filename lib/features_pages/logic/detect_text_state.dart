import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../networking/api_error_handler.dart';
import '../data/models/detect_text.dart';

part 'detect_text_state.freezed.dart';

@freezed
class DetectTextState with _$DetectTextState {
  const factory DetectTextState.initial() = DetectTextInitial;
  const factory DetectTextState.loading() = DetectTextLoading;
  const factory DetectTextState.success(DetectText detectText) = DetectTextSuccessState;
  const factory DetectTextState.error({required ErrorHandler error}) = DetectTextError;
}
