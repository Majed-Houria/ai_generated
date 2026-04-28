import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../networking/api_result.dart';
import '../data/models/detect_text.dart';
import '../data/repository/detect_repository.dart';
import 'detect_text_state.dart';

class DetectTextCubit extends Cubit<DetectTextState> {
  final DetectRepository detectRepository;

  DetectTextCubit(this.detectRepository)
      : super(const DetectTextState.initial());


  Future<void> detectText(Map<String, dynamic> body) async {
    emit(const DetectTextState.loading());

    final result = await detectRepository.detectText(body);

    result.when(
      success: (detectText) async {
        // Automatically calculate safety scores from the returned matches
        final derivedScores = TextScores.fromMatches(detectText.profanity.matches);
        
        final updatedData = DetectText(
          status: detectText.status,
          request: detectText.request,
          profanity: detectText.profanity,
          personal: detectText.personal,
          link: detectText.link,
          scores: detectText.scores ?? derivedScores,
        );
        
        emit(DetectTextState.success(updatedData));
      },
      failure: (error) => emit(DetectTextState.error(error: error)),
    );
  }
}
