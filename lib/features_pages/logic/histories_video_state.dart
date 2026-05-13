import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../networking/api_error_handler.dart';
import '../data/models/histories_video.dart';

part 'histories_video_state.freezed.dart';

@freezed
class HistoriesVideoState with _$HistoriesVideoState {
  const factory HistoriesVideoState.initial() = HistoriesVideoInitial;
  const factory HistoriesVideoState.loading() = HistoriesVideoLoading;
  const factory HistoriesVideoState.success(List<HistoriesVideo> historiesVideo) = HistoriesVideoSuccessState;
  const factory HistoriesVideoState.error({required ErrorHandler error}) = HistoriesVideoError;
}
