import 'package:bimarestan/core/state_management/view_state.dart';
import 'package:bimarestan/locator/locator.dart';
import 'package:bimarestan/presentation/clinics/clinics_view_model.dart';
import 'package:bimarestan/router/routes.dart';
import 'package:bimarestan/shared/loading_widget.dart';
import 'package:bimarestan/shared/no_internet_connection_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClinicsView extends StatelessWidget {
  const ClinicsView({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context)!.settings.arguments as int;
    return ChangeNotifierProvider<ClinicsViewModel>(
      create: (context) => locator<ClinicsViewModel>()..init(doctorId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clinics'),
        ),
        body: Consumer<ClinicsViewModel>(
          builder: (context, model, child) {
            if (model.viewState.isLoading) {
              return const LoadingWidget();
            }
            if (model.viewState.isError) {
              return NoInternetConnectionWidget(
                onTap: () => model.init(doctorId),
              );
            }
            return ListView.builder(
              itemCount: model.clinics.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(model.clinics[index].name),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Routes.appointment,
                      arguments: model.clinics[index],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
