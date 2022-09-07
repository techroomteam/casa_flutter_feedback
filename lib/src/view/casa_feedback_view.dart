import 'package:casa_flutter_feedback/config/colors.dart';
import 'package:casa_flutter_feedback/config/consts.dart';
import 'package:casa_flutter_feedback/config/images.dart';
import 'package:casa_flutter_feedback/config/styles.dart';
import 'package:casa_flutter_feedback/src/model/casa_feedback_model.dart';
import 'package:casa_flutter_feedback/src/model/user_survey_icon.dart';
import 'package:casa_flutter_feedback/src/view/casa_button.dart';
import 'package:casa_flutter_feedback/src/view/casatextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

// User Survey Icon List...
List<UserSurveyIcon> userSurveyIconList = [
  UserSurveyIcon(
      selectedIcon: selectedUserSurveyIcon1, unSelectedIcon: userSurveyIcon1),
  UserSurveyIcon(
      selectedIcon: selectedUserSurveyIcon2, unSelectedIcon: userSurveyIcon2),

  UserSurveyIcon(
      selectedIcon: selectedUserSurveyIcon3, unSelectedIcon: userSurveyIcon3),

  UserSurveyIcon(
      selectedIcon: selectedUserSurveyIcon4, unSelectedIcon: userSurveyIcon4),
  UserSurveyIcon(
      selectedIcon: selectedUserSurveyIcon5,
      unSelectedIcon: userSurveyIcon5), // userSurveyIcon1,
];

class CasaFeedbackView extends StatefulWidget {
  final CasaFeedbackModel casaFeedback;
  const CasaFeedbackView({required this.casaFeedback, super.key});

  @override
  State<CasaFeedbackView> createState() => _CasaFeedbackViewState();
}

class _CasaFeedbackViewState extends State<CasaFeedbackView> {
  bool clickOnSubmitButton = false;
  bool showTextField = false;
  String? question;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: widget.casaFeedback.userRating == null
          ? 0.36
          : widget.casaFeedback.points!.isEmpty
              ? 0.6
              : widget.casaFeedback.points!.isNotEmpty &&
                      !showTextField &&
                      widget.casaFeedback.userPointChoice!.isEmpty
                  ? 0.62
                  : widget.casaFeedback.points!.isNotEmpty &&
                          !showTextField &&
                          widget.casaFeedback.userPointChoice!.isNotEmpty &&
                          widget.casaFeedback.multiSelection == false
                      ? 0.5
                      : widget.casaFeedback.points!.isNotEmpty &&
                              showTextField == false &&
                              widget.casaFeedback.userPointChoice!.isNotEmpty &&
                              widget.casaFeedback.multiSelection == true
                          ? 0.6
                          : widget.casaFeedback.points!.isNotEmpty &&
                                  showTextField &&
                                  widget.casaFeedback.userPointChoice!
                                      .isNotEmpty &&
                                  widget.casaFeedback.multiSelection == false
                              ? 0.62
                              : 0.76,
      child: clickOnSubmitButton
          ? const ThanksFeedbackView()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 12,
                  bottom: 32,
                ).r,
                child: Column(
                  children: [
                    // Horizontal Line...
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 73.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0))),
                        ),
                      ],
                    ),
                    // Sized Box...
                    SizedBox(height: 24.h),
                    // Main Question and sub_title Column...
                    Visibility(
                      visible: (widget.casaFeedback.userRating == null &&
                              widget.casaFeedback.points!.isEmpty) ||
                          (widget.casaFeedback.userRating != null &&
                              widget.casaFeedback.points!.isEmpty) ||
                          widget.casaFeedback.userRating == null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title (Heading)...
                          Text(
                            'Hey! How was your day today?',
                            style: headline2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: blackAccent2,
                            ),
                          ),
                          // Sized Box...
                          SizedBox(height: 8.h),
                          // Text (SubTitle)...
                          Text(
                            'Your feedback is really valueable for us.',
                            style: bodyText2.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Sized Box...
                    SizedBox(height: 24.h),
                    // userSurveyIcon...
                    SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userSurveyIconList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (widget.casaFeedback.userRating != index) {
                                  widget.casaFeedback.userRating = index;
                                } else {
                                  widget.casaFeedback.userRating = null;
                                }

                                if (index <= 1) {
                                  question =
                                      widget.casaFeedback.dislikeQuestion;
                                } else if (index == 2) {
                                  question = widget.casaFeedback.okayQuestion;
                                } else {
                                  question = widget.casaFeedback.likeQuestion;
                                }
                                setState(() {});
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: padding3).r,
                                child: Container(
                                  padding: const EdgeInsets.all(4).r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        widget.casaFeedback.userRating == index
                                            ? Border.all(
                                                color: index == 0
                                                    ? errorColor
                                                    : index >= 3
                                                        ? primaryColor
                                                        : borderColor1)
                                            : null,
                                  ),
                                  child: SvgPicture.asset(
                                    widget.casaFeedback.userRating == index
                                        ? userSurveyIconList[index].selectedIcon
                                        : userSurveyIconList[index]
                                            .unSelectedIcon,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    // widget.casaFeedback.points!.isEmpty
                    Visibility(
                        visible: widget.casaFeedback.userRating != null &&
                            widget.casaFeedback.points!.isEmpty,
                        child: const WithOutPointsView()),
                    Visibility(
                      visible: widget.casaFeedback.userRating != null &&
                          widget.casaFeedback.points!.isNotEmpty,
                      child: PointsView(
                          multiSelection: widget.casaFeedback.multiSelection,
                          showTextField: showTextField,
                          index: widget.casaFeedback.userRating,
                          question: question,
                          points: widget.casaFeedback.points!,
                          userPointChoice: widget.casaFeedback.userPointChoice!,
                          onTapMoreDetail: () {
                            showTextField = true;
                            setState(() {});
                          },
                          onTap: (value) {
                            if (widget.casaFeedback.userPointChoice!
                                .contains(value)) {
                              widget.casaFeedback.userPointChoice!
                                  .remove(value);
                            } else {
                              widget.casaFeedback.userPointChoice!.add(value);
                            }

                            setState(() {});
                          }),
                    ),
                    // Sized box..
                    SizedBox(
                      height: widget.casaFeedback.userRating != null &&
                              widget.casaFeedback.points!.isEmpty
                          ? 20.h
                          : showTextField
                              ? 16.h
                              : 20.h,
                    ),
                    // Casa Button... (Submit Button)...
                    CasaButton(
                      text: 'Submit',
                      textColor: surfaceColor,
                      backgroundColor: primaryColor,
                      onPressed: widget.casaFeedback.userRating != null
                          ? () {
                              clickOnSubmitButton = true;
                              setState(() {});
                            }
                          : null,
                      size: Size(double.infinity, 52.h),
                    ),
                    // Sized Box...
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
    );
  }
}

class WithOutPointsView extends StatelessWidget {
  const WithOutPointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sized Box...
        SizedBox(height: 19.h),
        // Text...
        Text(
          'Whats wrong?',
          style: bodyText1.copyWith(
            fontWeight: FontWeight.w500,
            color: blackAccent2,
          ),
        ),
        // Sized Box...
        SizedBox(height: 20.h),
        // Text Field...
        CasaTextField(
          hintText: 'Details',
          hintStyle: bodyText2,
          color: backgroundAccentColor,
          maxLines: 6,
        )
      ],
    );
  }
}

class PointsView extends StatelessWidget {
  final Function(String) onTap;
  final bool multiSelection;
  final VoidCallback onTapMoreDetail;
  final int? index;
  final String? question;
  final List<String> userPointChoice;
  final List<String> points;
  final bool showTextField;
  const PointsView(
      {required this.onTap,
      this.index,
      required this.userPointChoice,
      this.question,
      required this.points,
      required this.showTextField,
      required this.onTapMoreDetail,
      required this.multiSelection,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sized Box...
        SizedBox(height: 10.h),
        // Text...
        Center(
          child: Text(
            index! <= 1
                ? 'Bad!'
                : index! == 2
                    ? 'Ok!'
                    : 'Great!',
            style: headline2.copyWith(
              fontWeight: FontWeight.w700,
              color: blackAccent2,
            ),
          ),
        ),
        // Text...
        Center(
          child: Text(
            question!,
            style: bodyText2.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // Sized Box...
        SizedBox(height: 24.h),
        // Staggered Grid View...
        (userPointChoice.isEmpty) ||
                (userPointChoice.isNotEmpty && multiSelection == true)
            ? SizedBox(
                height: 0.22.sh,
                child: SingleChildScrollView(
                  child: Wrap(
                    children: points
                        .map((f) => GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                        horizontal: padding5,
                                        vertical: padding4)
                                    .r,
                                margin: const EdgeInsets.only(
                                        right: padding2, bottom: padding1)
                                    .r,
                                decoration: BoxDecoration(
                                  color: userPointChoice.contains(f)
                                      ? primaryAccentColor
                                      : surfaceColor,
                                  border: Border.all(
                                      color: userPointChoice.contains(f)
                                          ? primaryColor
                                          : blackAccent2,
                                      width: 1.0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(borderRadius3),
                                  ),
                                ),
                                child: Text(f,
                                    style: bodyText2.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: userPointChoice.contains(f)
                                          ? primaryColor
                                          : blackAccent2,
                                    )),
                              ),
                              onTap: () => onTap(f),
                            ))
                        .toList(),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: padding).r,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                            horizontal: padding1, vertical: padding4)
                        .r,
                    decoration: BoxDecoration(
                      color: primaryAccentColor,
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(borderRadius3),
                    ),
                    child: Text(
                      userPointChoice[0].toString(),
                      style: bodyText2.copyWith(
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
        // Sized Box...
        SizedBox(height: points.length > 6 ? 12.h : 0.h),
        showTextField
            ?
            // Text Field...
            CasaTextField(
                hintText: 'Details',
                hintStyle: bodyText2,
                color: backgroundAccentColor,
                maxLines: 6,
              )
            : GestureDetector(
                onTap: onTapMoreDetail,
                child: Center(
                  child: Text(
                    'For more detail leave a comment.',
                    style: bodyText2.copyWith(
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

class ThanksFeedbackView extends StatefulWidget {
  const ThanksFeedbackView({super.key});
  @override
  State<ThanksFeedbackView> createState() => _ThanksFeedbackViewState();
}

class _ThanksFeedbackViewState extends State<ThanksFeedbackView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lottie Success Asset...
        Lottie.asset(
          'assets/animations/success.json',
          width: 228.w,
          height: 228.h,
          fit: BoxFit.fill,
        ),
        // Sized Box...
        SizedBox(height: 24.h),
        // Text (Thanks For Your)...
        Text(
          'Thanks For Your',
          style: headline1.copyWith(
              fontWeight: FontWeight.w600, color: blackAccent1),
        ),
        // Text (Feedback)...
        Text(
          'Feedback',
          style: headline1.copyWith(
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        )
      ],
    );
  }
}
