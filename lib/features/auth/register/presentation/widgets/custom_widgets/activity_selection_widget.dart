import 'package:fitness_app/core/utils/enums/activity_enum.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/item_option.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitySelectionWidget extends StatefulWidget {
  final ActivityEnum? initialActivity;
  final bool isEditProfile;
  final void Function(ActivityEnum?) onActivitySelected;

  const ActivitySelectionWidget({
    super.key,
    required this.initialActivity,
    required this.isEditProfile,
    required this.onActivitySelected,
  });

  @override
  State<ActivitySelectionWidget> createState() =>
      _ActivitySelectionWidgetState();
}

class _ActivitySelectionWidgetState extends State<ActivitySelectionWidget> {
  late ActivityEnum? selectedActivity;

  @override
  void initState() {
    super.initState();
    selectedActivity = widget.initialActivity;
  }

  void _onActivitySelected(ActivityEnum? value) {
    setState(() => selectedActivity = value);
    widget.onActivitySelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.46,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.neutral80.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SingleChildScrollView(
            child: RadioGroup<ActivityEnum>(
              groupValue: selectedActivity,
              onChanged: _onActivitySelected,
              child: Column(
                children: [
                  OptionItem<ActivityEnum>(
                    label: activityEnumToString(ActivityEnum.level1),
                    value: ActivityEnum.level1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  OptionItem<ActivityEnum>(
                    label: activityEnumToString(ActivityEnum.level2),
                    value: ActivityEnum.level2,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  OptionItem<ActivityEnum>(
                    label: activityEnumToString(ActivityEnum.level3),
                    value: ActivityEnum.level3,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  OptionItem<ActivityEnum>(
                    label: activityEnumToString(ActivityEnum.level4),
                    value: ActivityEnum.level4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  OptionItem<ActivityEnum>(
                    label: activityEnumToString(ActivityEnum.level5),
                    value: ActivityEnum.level5,
                  ),
                  if (!widget.isEditProfile)
                    BlocListener<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          showSnackBar(context, 'registeredSuccessfully');
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
                          final cubit = context.read<RegisterCubit>();
                          if (selectedActivity == null) {
                            showSnackBar(
                              context,
                              'context.loc.pleaseSelectActivity',
                            );
                            return;
                          }

                          cubit.activityLevel = activityEnumToBackend(
                            selectedActivity,
                          );

                          final request = RegisterRequest(
                            firstName: cubit.firstNameController.text,
                            lastName: cubit.lastNameController.text,
                            email: cubit.emailController.text,
                            password: cubit.passwordController.text,
                            rePassword: cubit.rePasswordController.text,
                            height: cubit.height,
                            weight: cubit.weight,
                            age: cubit.age,
                            goal: cubit.goal,
                            activityLevel: cubit.activityLevel,
                            gender: RegisterCubit.selectedGender.name,
                          );

                          cubit.doIntent(RegisterUserIntent(request: request));
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
                        context.read<EditProfileCubit>().activityLevel =
                            activityEnumToBackend(selectedActivity);
                        // Navigator.pop(context);
                        showSnackBar(context, 'context.loc.savedSuccessfully');
                      },
                      child: Text(context.loc.done),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
