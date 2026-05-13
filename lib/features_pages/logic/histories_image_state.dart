import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../networking/api_error_handler.dart';
import '../data/models/histories_image.dart';

part 'histories_image_state.freezed.dart';

@freezed
class HistoriesImageState with _$HistoriesImageState {
  const factory HistoriesImageState.initial() = HistoriesImageInitial;
  const factory HistoriesImageState.loading() = HistoriesImageLoading;
  const factory HistoriesImageState.success(List<HistoriesImage> historiesImage) = HistoriesImageSuccessState;
  const factory HistoriesImageState.error({required ErrorHandler error}) = HistoriesImageError;
}
