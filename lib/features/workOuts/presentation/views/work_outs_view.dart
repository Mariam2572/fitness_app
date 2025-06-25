import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/core/utils/widgets/grid_view_item.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/blur_background.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
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
  List<MusclesGroupBean> groups = [];
  bool tabInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
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
                if (state is WorkOutsSuccess && !tabInitialized) {
                  groups = state.response.musclesGroup ?? [];
                  if (groups.isNotEmpty) {
                    _tabController = TabController(
                      length: groups.length,
                      vsync: this,
                    );
                    _tabController!.addListener(() {
                      final index = _tabController!.index;
                      if (index != selectedIndex) {
                        setState(() => selectedIndex = index);
                        context.read<WorkOutsCubit>().doIntent(
                          GetAllMusclesByMuscleGroupIdIntent(
                            id: groups[index].id!,
                          ),
                        );
                      }
                    });
                    tabInitialized = true;
                    selectedIndex = 0;
                    context.read<WorkOutsCubit>().doIntent(
                      GetAllMusclesByMuscleGroupIdIntent(id: groups[0].id!),
                    );
                    setState(() {});
                  }
                }
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

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      context.loc.workOuts,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.instance.textStyle24.copyWith(
                        color: AppColors.baseWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (groups.isNotEmpty && _tabController != null)
                      SizedBox(
                        height: 56,
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          labelPadding: const EdgeInsets.only(right: 8),
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          tabs: List.generate(groups.length, (index) {
                            return TabItem(
                              workOut: groups[index],
                              isSelected: selectedIndex == index,
                            );
                          }),
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
                                child: CircularProgressIndicator(),
                              ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final MusclesGroupBean workOut;
  final bool isSelected;

  const TabItem({super.key, required this.workOut, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration:
          isSelected
              ? BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: AppColors.mainRed,
                border: Border.all(color: AppColors.mainRed),
              )
              : null,
      child: Text(
        workOut.name ?? 'not found',
        style: const TextStyle(color: AppColors.baseWhite),
      ),
    );
  }
}
