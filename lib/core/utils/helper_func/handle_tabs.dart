import 'package:flutter/material.dart';

typedef TabIdGetter<CubitType> = String? Function(CubitType cubit, int index);
typedef TabCountGetter<CubitType> = int Function(CubitType cubit);
typedef TabChangeIntent<CubitType> = Future<void> Function(CubitType cubit, String? tabId);

Future<TabController?> setupTabs<CubitType>({
  required CubitType cubit,
  required Future<void> Function() fetchTabsIntent,
  required TabCountGetter<CubitType> getTabCount,
  required TabIdGetter<CubitType> getTabId,
  required TabChangeIntent<CubitType> fetchListIntent,
  required TickerProvider vsync,
  void Function(int index)? onTabChanged,
}) async {
  await fetchTabsIntent();

  final tabCount = getTabCount(cubit);
  if (tabCount > 0) {
    final controller = TabController(length: tabCount, vsync: vsync);

    // Fetch the list for the first tab
    final firstTabId = getTabId(cubit, 0);
    await fetchListIntent(cubit, firstTabId);

    controller.addListener(() {
      if (!controller.indexIsChanging) {
        final tabId = getTabId(cubit, controller.index);
        fetchListIntent(cubit, tabId);
        if (onTabChanged != null) {
          onTabChanged(controller.index);
        }
      }
    });

    return controller;
  }
  return null;
}