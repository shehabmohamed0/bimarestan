import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../router/routes.dart';
import '../../auth/app/app_view_model.dart';
import 'settings_page_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.select(
      (AppViewModel model) => model.profile!,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.logo_white,
                height: 38,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 42.w,
                  vertical: 24.h,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70.r,
                      backgroundImage: const NetworkImage(
                        'https://www.w3schools.com/howto/img_avatar.png',
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      profile.fullName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      profile.email,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 42.w,
              ),
              child: Text(
                'Account',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Edit profile'),
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.profile);
                    },
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on_rounded),
                    title: const Text('Location'),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),

                  // notifications list tile with ios switch
                  Selector<SettingsPageViewModel, bool>(
                    selector: (context, model) => model.isSwitched,
                    builder: (context, active, child) => ListTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text('Notifications'),
                      onTap: () {},
                      trailing: // cupertino switch
                          CupertinoSwitch(
                        value: active,
                        onChanged:
                            context.read<SettingsPageViewModel>().toggleSwitch,
                        activeColor: ColorManager.primary,
                      ),
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: context.read<SettingsPageViewModel>().logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
