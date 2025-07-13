import 'dart:io';
import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_age_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_profile_fields_section.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/profile_photo_widget.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/tap_to_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = context.read<EditProfileCubit>();
    return Stack(
      children: [
        Image.asset(
          AppAssets.homeBackGround,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            width: double.infinity,
            height: context.height,
            decoration: BoxDecoration(
              color: AppColors.neutral90.withOpacity(.01),
              borderRadius: BorderRadius.circular(25.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: BlocConsumer<EditProfileCubit, EditProfileState>(
                listener: (context, state) {
               if (state is EditProfileSuccess) {
                    showSnackBar(context, "Profile Edit Success");
                  } else if (state is EditProfileFailure) {
                    showSnackBar(context, "Profile Edit Fail");
                  }

                },
                builder: (context, state) {
                  if (state is GetProfileSuccess) {
                    if (editProfileCubit.emailController.text !=
                            state.response.user!.email ||
                        editProfileCubit.firstNameController.text !=
                            state.response.user!.firstName ||
                        editProfileCubit.lastNameController.text !=
                            state.response.user!.lastName ||
                        editProfileCubit.weight !=
                            state.response.user!.weight ||
                        editProfileCubit.height !=
                            state.response.user!.height ||
                        editProfileCubit.age != state.response.user!.age ||
                        editProfileCubit.goal != state.response.user!.goal ||
                        editProfileCubit.activityLevel !=
                            state.response.user!.activityLevel ||
                        editProfileCubit.selectedGender.name !=
                            state.response.user!.gender) {
                      editProfileCubit.isEdited = true;
                    } else {
                      editProfileCubit.isEdited = false;
                    }
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: context.padding.top,
                              bottom: context.padding.bottom + 25.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: SvgPicture.asset(AppAssets.backIcon),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  context.loc.editProfile,
                                  style: context.textTheme.headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (editProfileCubit.formKey.currentState!
                                        .validate()) {
                                      if (editProfileCubit.selectedImage != null) {
                                         editProfileCubit.doIntent(UploadPhotoIntent(photo: editProfileCubit.selectedImage!));
                                      }

                                      editProfileCubit.doIntent(
                                        EditProfileInfoIntent(
                                          editProfileRequest:
                                              EditProfileRequest(
                                                email:
                                                    editProfileCubit
                                                        .emailController
                                                        .text,
                                                height: editProfileCubit.height,
                                                activityLevel:
                                                    editProfileCubit
                                                        .activityLevel
                                                        ?.name,
                                                age: editProfileCubit.age,
                                                firstName:
                                                    editProfileCubit
                                                        .firstNameController
                                                        .text,
                                                gender:
                                                    editProfileCubit
                                                        .selectedGender
                                                        .name,
                                                goal: editProfileCubit.goal,
                                                lastName:
                                                    editProfileCubit
                                                        .lastNameController
                                                        .text,
                                                weight: editProfileCubit.weight,
                                              ),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Icon(
                                    Icons.check,
                                    color:
                                        editProfileCubit.isEdited
                                            ? Colors.green
                                            : AppColors.neutral40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          responsiveHeight(context, 0.02),

                          ProfilePhotoWidget(userData: state.response),
                          responsiveHeight(context, 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                "${state.response.user!.firstName} ",
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                state.response.user!.lastName!,
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const EditProfileFieldsSection(),
                          responsiveHeight(context, 0.03),
                          TapToEditWidget(
                            onPressed: () {
                              editProfileCubit.isEditProfile=true;
                              Navigator.pushNamed(
                                context,
                                RoutesName.chooseWeightScreen,
                                arguments:   {
                                  'editProfileCubit': context.read<EditProfileCubit>(),
                                },                              );
                            },
                            title: context.loc.yourWeight,
                            value:
                                "${editProfileCubit.weight} ${context.loc.kg}",
                          ),
                          responsiveHeight(context, 0.010),
                          TapToEditWidget(
                            onPressed: () {
                              editProfileCubit.isEditProfile=true;
                              Navigator.pushNamed(
                                context,
                                RoutesName.chooseHeightScreen,
                                arguments:   {
                                  'editProfileCubit': context.read<EditProfileCubit>(),
                                },
                              );
                            },
                            title: context.loc.yourHeight,
                            value:
                                "${editProfileCubit.height} ${context.loc.cm}",
                          ),
                          responsiveHeight(context, 0.010),
                          TapToEditWidget(
                            onPressed: () {
                              editProfileCubit.isEditProfile=true;
                              Navigator.pushNamed(
                                context,
                                RoutesName.chooseAgeScreen,
                                arguments:   {
                                  'editProfileCubit': context.read<EditProfileCubit>(),
                                },                              );
                            },
                            title: context.loc.yourAge,
                            value:
                                "${editProfileCubit.age} ${context.loc.year}",
                          ),
                          responsiveHeight(context, 0.010),
                          TapToEditWidget(
                            onPressed: () {
                              editProfileCubit.isEditProfile=true;
                              Navigator.pushNamed(
                                context,
                                RoutesName.goals,
                                arguments:   {
                                  'editProfileCubit': context.read<EditProfileCubit>(),
                                },                              );
                            },
                            title: context.loc.yourGoal,
                            value: "${editProfileCubit.goal}",
                          ),
                          responsiveHeight(context, 0.010),
                          TapToEditWidget(
                            onPressed: () {
                              editProfileCubit.isEditProfile=true;
                              Navigator.pushNamed(
                                context,
                                RoutesName.activities,
                                arguments:   {
                                  'editProfileCubit': context.read<EditProfileCubit>(),
                                },                              );
                            },
                            title: context.loc.yourActivityLevel,
                            value: "${editProfileCubit.activityLevel}",
                          ),
                          responsiveHeight(context, 0.010),
                          TapToEditWidget(
                            onPressed: () {
                              editProfileCubit.isEditProfile=true;
                              Navigator.pushNamed(
                                context,
                                RoutesName.chooseGenderScreen,
                                arguments:   {
                                  'editProfileCubit': context.read<EditProfileCubit>(),
                                },                              );
                            },
                            title: context.loc.yourGender,
                            value: "${editProfileCubit.selectedGender.name}",
                          ),
                          responsiveHeight(context, 0.010),
                        ],
                      ),
                    );
                  } else if (state is GetProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  } else {
                    return Center(
                      child: TextButton(
                        onPressed: () {
                          editProfileCubit.doIntent(GetLoggedUserDataIntent());
                        },
                        child: const Text(
                          "try again",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
