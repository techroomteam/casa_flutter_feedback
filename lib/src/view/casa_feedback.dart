import 'package:casa_flutter_feedback/config/consts.dart';
import 'package:casa_flutter_feedback/src/model/casa_feedback_model.dart';
import 'package:casa_flutter_feedback/src/view/casa_feedback_view.dart';
import 'package:flutter/material.dart';

class CasaFeedback {
  static show(
    BuildContext context, {
    required CasaFeedbackModel casaFeedbackModel,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius1),
          topRight: Radius.circular(borderRadius1),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (_) => CasaFeedbackView(casaFeedback: casaFeedbackModel),
    );
  }
}
