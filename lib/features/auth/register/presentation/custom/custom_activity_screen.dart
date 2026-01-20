import 'package:fitness_app/core/animation/animated_widgets.dart';
import 'package:fitness_app/core/utils/enums/activity_enum.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/blur_background.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/custom_widgets/activity_selection_widget.dart';
import 'package:flutter/material.dart';

class CustomActivtiesScreen extends StatefulWidget {
  final ActivityEnum? initialActivity;
  final bool isEditProfile;
  final void Function(String?) onChanged;
  const CustomActivtiesScreen({
    super.key,
    this.initialActivity,
    required this.isEditProfile,
    required this.onChanged,
  });

  @override
  State<CustomActivtiesScreen> createState() => _CustomActivtiesScreenState();
}

class _CustomActivtiesScreenState extends State<CustomActivtiesScreen> {
  late ActivityEnum? selectedActivity;

  @override
  void initState() {
    super.initState();
    selectedActivity = widget.initialActivity;
  }

  void _onActivitySelected(ActivityEnum? value) {
    setState(() => selectedActivity = value);
    widget.onChanged.call(activityEnumToBackend(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlurredBackground(imagePath: AppAssets.goalBackground),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: AnimatedSlideInWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),
                          Image.asset(AppAssets.fit, width: 80),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      widget.isEditProfile
                          ? const SizedBox()
                          : const CircularPercentIndicatorWidget(
                            currentStep: 6,
                            totalSteps: 6,
                          ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Text(
                        context.loc.your_regular,
                        style: AppTextStyle.instance.textStyle20.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        context.loc.activity_level,
                        style: AppTextStyle.instance.textStyle20.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      ActivitySelectionWidget(
                        initialActivity: selectedActivity,
                        isEditProfile: widget.isEditProfile,
                        onActivitySelected: _onActivitySelected,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
