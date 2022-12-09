import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../core/state_management/custom_selector.dart';
import '../../core/state_management/view_state.dart';
import '../../models/profile.dart';
import '../../router/routes.dart';
import '../../shared/no_internet_connection_widget.dart';
import 'home_view_model.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '${Routes.home}2',
                arguments: Profile(id: '2', name: 'asdd'),
              );
            },
            child: const Text('View 1'),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('data'),
            ),
          ),
          Selector<HomeViewModel, ViewState>(
            selector: (context, model) => model.viewState1,
            builder: (context, viewState1, child) {
              final model = context.read<HomeViewModel>();
              switch (viewState1) {
                case ViewState.initial:
                case ViewState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ViewState.error:
                  return NoInternetConnectionWidget(onTap: () {});
                case ViewState.success:
                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.profiles.length,
                        itemBuilder: (context, index) =>
                            Text(model.profiles[index].name)),
                  );
              }
            },
          ),
          ViewModelSelector<HomeViewModel, Tuple2<List<Profile>, ViewState>>(
            selector: (context, model) => Tuple2(
              model.profiles2,
              model.viewState2,
            ),
            builder: (context, model, child) {
              switch (model.viewState2) {
                case ViewState.initial:
                case ViewState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ViewState.error:
                  return NoInternetConnectionWidget(onTap: () {});
                case ViewState.success:
                  return Expanded(
                    child: ListView.builder(
                      itemCount: model.profiles2.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {},
                        title: Text(model.profiles2[index].name),
                      ),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
