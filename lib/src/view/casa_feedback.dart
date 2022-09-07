import 'package:flutter/material.dart';
import 'package:flutter_feedback_view/casa_flutter_feedback.dart';
import 'package:flutter_feedback_view/config/consts.dart';
import 'package:flutter_feedback_view/src/view/casa_feedback_view.dart';

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
