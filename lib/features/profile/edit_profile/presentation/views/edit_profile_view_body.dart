import 'dart:ui';
import 'package:fitness_app/core/utils/enums/activity_enum.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/edit_profile_fields_section.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/profile_photo_widget.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/widgets/tap_to_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  @override
  void initState() {
    final editProfileCubit = context.read<EditProfileCubit>();
    editProfileCubit.doIntent(GetLoggedUserDataIntent());

    super.initState();
  }

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
              color: AppColors.neutral90.withValues(alpha: .01),
              borderRadius: BorderRadius.circular(25.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: BlocConsumer<EditProfileCubit, ProfileState>(
                listener: (context, state) {
                  // if (state is UploadPhotoFailure) {
                  //   showErrorSnackBar(context, state.error);
                  // } else if (state is UploadPhotoSuccess) {
                  //   showSnackBar(context, "Photo Upload Success");
                  // } else if (state is ProfileSuccess) {
                  //   showSnackBar(context, "Profile Edit Success");
                  // } else if (state is ProfileFailure) {
                  //   showSnackBar(context, state.error);
                  // }
                  // if (state is UploadPhotoSuccess) {
                  //   showSnackBar(context, "Upload success");
                  // } else if (state is UploadPhotoFailure) {
                  //   showErrorSnackBar(context, state.error);
                  // }
                },
                builder: (context, state) {
                  if (state is ProfileSuccess) {
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
                              ],
                            ),
                          ),
                          responsiveHeight(context, 0.02),
                          ProfilePhotoWidget(),
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
                              Navigator.pushNamed(
                                context,
                                RoutesName.editWeight,
                                arguments: context.read<EditProfileCubit>(),
                              );
                            },
                            title: context.loc.yourWeight,
                            value:
                                "${editProfileCubit.weight} ${context.loc.kg}",
                          ),
                          // responsiveHeight(context, 0.010),
                          // TapToEditWidget(
                          //   onPressed: () {
                          //     Navigator.pushNamed(
                          //       context,
                          //       RoutesName.editHeight,
                          //       arguments: context.read<EditProfileCubit>(),
                          //     );
                          //   },
                          //   title: context.loc.yourHeight,
                          //   value:
                          //       "${editProfileCubit.height} ${context.loc.cm}",
                          // ),
                          // responsiveHeight(context, 0.010),
                          // TapToEditWidget(
                          //   onPressed: () {
                          //     Navigator.pushNamed(
                          //       context,
                          //       RoutesName.editAge,
                          //       arguments: context.read<EditProfileCubit>(),
                          //     );
                          //   },
                          //   title: context.loc.yourAge,
                          //   value:
                          //       "${editProfileCubit.age} ${context.loc.year}",
                          // ),
                          responsiveHeight(context, 0.010),
                          TapToEditWidget(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.editGoals,
                                arguments: context.read<EditProfileCubit>(),
                              );
                            },
                            title: context.loc.yourGoal,
                            value: "${editProfileCubit.goal}",
                          ),
                          responsiveHeight(context, 0.010),
                          TapToEditWidget(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.editActivityLevel,
                                arguments: context.read<EditProfileCubit>(),
                              );
                            },
                            title: context.loc.yourActivityLevel,
                            value: parseLevelsToActivity(
                              editProfileCubit.activityLevel ?? "",
                            ),
                          ),
                          responsiveHeight(context, 0.010),
                          // TapToEditWidget(
                          //   onPressed: () {
                          //     Navigator.pushNamed(
                          //       context,
                          //       RoutesName.editGender,
                          //       arguments: context.read<EditProfileCubit>(),
                          //     );
                          //   },
                          //   title: context.loc.yourGender,
                          //   value: EditProfileCubit.selectedGender.name,
                          // ),
                          // responsiveHeight(context, 0.010),
                        ],
                      ),
                    );
                  } else if (state is ProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  // else if (state is UploadPhotoSuccess) {
                  //   return const Center(child: Text("Succsss"));
                  // } else if (state is UploadPhotoFailure) {
                  //   return Center(child: Text(state.error));
                  // }
                  else {
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
