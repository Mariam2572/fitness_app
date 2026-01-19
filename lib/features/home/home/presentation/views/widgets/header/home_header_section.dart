import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/header/user_avatar.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/header/user_greeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Header section displaying user greeting and profile image
class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return BlocBuilder<HomeViewCubit, HomeViewState>(
      buildWhen:
          (previous, current) =>
              previous.userDataStatus != current.userDataStatus ||
              previous.userName != current.userName ||
              previous.userImage != current.userImage,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserGreeting(
              userName: state.userName,
              isLoading: state.userDataStatus.isLoading,
              error:
                  state.userDataStatus.isFailure
                      ? (state.userDataError ?? loc.unableToGetUserName)
                      : null,
            ),
            UserAvatar(
              imageUrl: state.userImage,
              isLoading: state.userDataStatus.isLoading,
            ),
          ],
        );
      },
    );
  }
}
