import '../../core/state_management/view_state.dart';
import '../../locator/locator.dart';
import 'clinics_view_model.dart';
import '../../router/routes.dart';
import '../../shared/loading_widget.dart';
import '../../shared/something_went_wrong_widget.dart';
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
              return SomethingWentWrongWidget(
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
