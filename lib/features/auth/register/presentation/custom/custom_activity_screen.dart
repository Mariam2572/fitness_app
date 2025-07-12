// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/utils/enums/activity_enum.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/blur_background.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/item_option.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';

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
    selectedActivity = 
      widget.initialActivity;
    
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    const CircularPercentIndicatorWidget(
                      currentStep: 6,
                      totalSteps: 6,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.46,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppColors.neutral80.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                OptionItem<ActivityEnum>(
                                  label: activityEnumToString(
                                    ActivityEnum.level1,
                                  ),
                                  value: ActivityEnum.level1,
                                  selectedValue: selectedActivity,
                                  onChanged: _onActivitySelected,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                OptionItem<ActivityEnum>(
                                  label: activityEnumToString(
                                    ActivityEnum.level2,
                                  ),
                                  value: ActivityEnum.level2,
                                  selectedValue: selectedActivity,
                                  onChanged: _onActivitySelected,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                OptionItem<ActivityEnum>(
                                  label: activityEnumToString(
                                    ActivityEnum.level3,
                                  ),
                                  value: ActivityEnum.level3,
                                  selectedValue: selectedActivity,
                                  onChanged: _onActivitySelected,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                OptionItem<ActivityEnum>(
                                  label: activityEnumToString(
                                    ActivityEnum.level4,
                                  ),
                                  value: ActivityEnum.level4,
                                  selectedValue: selectedActivity,
                                  onChanged: _onActivitySelected,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                OptionItem<ActivityEnum>(
                                  label: activityEnumToString(
                                    ActivityEnum.level5,
                                  ),
                                  value: ActivityEnum.level5,
                                  selectedValue: selectedActivity,
                                  onChanged: _onActivitySelected,
                                ),
                                if (!widget.isEditProfile)
                                  BlocListener<RegisterCubit, RegisterState>(
                                    listener: (context, state) {
                                      if (state is RegisterSuccess) {
                                        showSnackBar(
                                          context,
                                          'registeredSuccessfully',
                                        );
                                        Navigator.pushReplacementNamed(
                                          context,
                                          RoutesName.login,
                                        );
                                      } else if (state is RegisterFailure) {
                                        showErrorSnackBar(context, state.error);
                                      }
                                    },
                                    child: ElevatedButton(
                                      onPressed: () {
                                        final cubit =
                                            context.read<RegisterCubit>();
                                        if (selectedActivity == null) {
                                          showSnackBar(
                                            context,
                                            ' context.loc.pleaseSelectActivity',
                                          );
                                          return;
                                        }

                                        cubit.activityLevel =
                                            activityEnumToBackend(
                                              selectedActivity,
                                            );

                                        final request = RegisterRequest(
                                          firstName:
                                              cubit.firstNameController.text,
                                          lastName:
                                              cubit.lastNameController.text,
                                          email: cubit.emailController.text,
                                          password:
                                              cubit.passwordController.text,
                                          rePassword:
                                              cubit.rePasswordController.text,
                                          height: cubit.height,
                                          weight: cubit.weight,
                                          age: cubit.age,
                                          goal: cubit.goal,
                                          activityLevel: cubit.activityLevel,
                                          gender:
                                              RegisterCubit.selectedGender.name,
                                        );

                                        cubit.doIntent(
                                          RegisterUserIntent(request: request),
                                        );
                                      },
                                      child: Text(context.loc.next),
                                    ),
                                  )
                                else
                                  ElevatedButton(
                                    onPressed: () {
                                      if (selectedActivity == null) {
                                        showSnackBar(
                                          context,
                                          'context.loc.pleaseSelectActivity',
                                        );
                                        return;
                                      }
                                      context
                                              .read<EditProfileCubit>()
                                              .activityLevel =
                                          activityEnumToBackend(
                                            selectedActivity,
                                          );
                                      // Navigator.pop(context);
                                      showSnackBar(
                                        context,
                                        'context.loc.savedSuccessfully',
                                      );
                                    },
                                    child: Text(context.loc.done),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
