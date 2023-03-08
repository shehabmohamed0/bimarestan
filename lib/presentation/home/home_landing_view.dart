import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../locator/locator.dart';
import 'health_care_page/health_care_page.dart';
import 'home_page/home_page.dart';
import 'settings_page/settings_page.dart';
import 'settings_page/settings_page_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

const initialPage = 0;

class _HomeViewState extends State<HomeView> {
  final ValueNotifier<int> indexNotifier = ValueNotifier(initialPage);
  final PageController controller = PageController(initialPage: initialPage);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsPageViewModel>(
          create: (_) => locator<SettingsPageViewModel>(),
        ),
      ],
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            HomePage(),
            HealthCarePage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, index, _) {
              return BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: index,
                onTap: (value) {
                  if (value != index) {
                    controller.jumpToPage(value);
                    indexNotifier.value = value;
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.heartPulse,
                    ),
                    label: 'heart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'settings',
                  ),
                ],
              );
            }),
      ),
    );
  }
}
