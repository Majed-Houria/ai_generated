import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../networking/api_error_handler.dart';
import '../data/models/histories_text.dart';

part 'histories_text_state.freezed.dart';

@freezed
class HistoriesTextState with _$HistoriesTextState {
  const factory HistoriesTextState.initial() = HistoriesTextInitial;
  const factory HistoriesTextState.loading() = HistoriesTextLoading;
  const factory HistoriesTextState.success(List<HistoriesText> historiesText) = HistoriesTextSuccessState;
  const factory HistoriesTextState.error({required ErrorHandler error}) = HistoriesTextError;
}
