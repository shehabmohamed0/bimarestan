part of '../appointment_booking_view.dart';

class _AppointmentTimesComponent extends StatelessWidget {
  const _AppointmentTimesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AppointmentViewModel,
        Tuple3<List<DateTime>, DateTime?, DateTime?>>(
      selector: (_, model) => Tuple3(
        model.availableTimes,
        model.selectedTime,
        model.selectedAppointmentDate,
      ),
      builder: (context, tuple, _) {
        final model = context.read<AppointmentViewModel>();
        return Wrap(
          children: tuple.value1.map((e) {
            final timeNow = DateTime.now();
            final timeSelected = DateTime(
              tuple.value3!.year,
              tuple.value3!.month,
              tuple.value3!.day,
              e.hour,
              e.minute,
            );

            bool isBefore = timeSelected.isBefore(timeNow);

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
