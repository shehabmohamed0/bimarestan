part of '../appointment_booking_view.dart';

class _AppointmentTimesComponent extends StatelessWidget {
  const _AppointmentTimesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AppointmentViewModel, Tuple2<List<DateTime>, DateTime?>>(
      selector: (_, model) => Tuple2(
        model.availableTimes,
        model.selectedTime,
      ),
      builder: (context, tuple, _) {
        final model = context.read<AppointmentViewModel>();
        return Wrap(
          children: tuple.value1.map((e) {
            final timeNow = TimeOfDay.fromDateTime(DateTime.now());
            final timeSelected = TimeOfDay.fromDateTime(e);

            bool isBefore = timeNow.hour > timeSelected.hour ||
                (timeNow.hour == timeSelected.hour &&
                    timeNow.minute > timeSelected.minute);

            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 4.w, 0),
              child: RawChip(
                showCheckmark: false,
                selectedColor: ColorManager.primary.withOpacity(0.5),
                selected: tuple.value2 == e,
                disabledColor: Colors.grey,
                backgroundColor: isBefore ? Colors.grey.shade300 : null,
                onSelected: isBefore
                    ? null
                    : (_) {
                        if (isBefore) {
                          locator<SnackBarService>().showSnackBar(
                            'You can not select past time',
                          );
                          return;
                        }
                        model.setSelectedAppointmentTime(e);
                      },
                label: Text(
                  format(e),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
