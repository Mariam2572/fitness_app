import 'package:fitness_app/core/animation/animated_widgets.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/core/utils/widgets/grid_view_item.dart';
import 'package:fitness_app/features/workOuts/presentation/view_model/cubit/work_outs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkOutsView extends StatefulWidget {
  const WorkOutsView({super.key});

  @override
  State<WorkOutsView> createState() => _WorkOutsViewState();
}

class _WorkOutsViewState extends State<WorkOutsView>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TabController? _tabController;

  bool tabInitialized = false;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<WorkOutsCubit>();
    cubit.doIntent(GetAllMusclesGroupsIntent()).then((value) {
      if (cubit.groups.isNotEmpty) {
        _tabController = TabController(
          length: cubit.groups.length,
          vsync: this,
        );
        _tabController!.addListener(() {
          if (!_tabController!.indexIsChanging) {
            final id = cubit.groups[_tabController!.index].id;
            cubit.doIntent(GetAllMusclesByMuscleGroupIdIntent(id: id ?? ''));
          }
        });
        tabInitialized = true;
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _tabController?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.homeBackground,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: BlocConsumer<WorkOutsCubit, WorkOutsState>(
              listenWhen: (prev, curr) => curr is WorkOutsSuccess,
              listener: (context, state) {
                if (state is WorkOutsSuccess && !tabInitialized) {}
              },
              buildWhen:
                  (prev, curr) =>
                      curr is WorkOutsByIdSuccess ||
                      curr is WorkOutsByIdFailure,
              builder: (context, state) {
                List muscles = [];
                if (state is WorkOutsByIdSuccess) {
                  muscles = state.response.muscles ?? [];
                }

                return AnimatedSlideInWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          context.loc.workOuts,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.instance.textStyle24.copyWith(
                            color: AppColors.baseWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (context.read<WorkOutsCubit>().groups.isNotEmpty &&
                          _tabController != null)
                        SizedBox(
                          height: 56,
                          child: AppTabBar(
                            controller: _tabController!,
                            tabs:
                                context
                                    .read<WorkOutsCubit>()
                                    .groups
                                    .map((level) => Tab(text: level.name ?? ''))
                                    .toList(),
                          ),
                        ),
                      const SizedBox(height: 8),
                      Expanded(
                        child:
                            state is WorkOutsByIdSuccess
                                ? GridView.builder(
                                  itemCount: muscles.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                      ),
                                  itemBuilder: (context, index) {
                                    return GridViewItem(
                                      name: muscles[index].name ?? '',
                                      image: muscles[index].image ?? '',
                                      muscle: state.response.muscles![index],
                                    );
                                  },
                                )
                                : state is WorkOutsByIdFailure
                                ? Center(child: Text(state.error))
                                : const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.mainRed,
                                  ),
                                ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
