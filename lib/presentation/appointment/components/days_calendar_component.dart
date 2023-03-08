part of '../appointment_booking_view.dart';

class _DaysCalenderComponent extends StatelessWidget {
  const _DaysCalenderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AppointmentViewModel, DateTime?>(
      selector: (context, value) => value.selectedAppointmentDate,
      builder: (context, selectedDay, child) {
        final model = context.read<AppointmentViewModel>();
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: TableCalendar(
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              tablePadding: EdgeInsets.symmetric(horizontal: 8.w),
              cellPadding: const EdgeInsets.all(2),
            ),
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 30)),
            focusedDay: selectedDay ?? DateTime.now(),
            calendarFormat: CalendarFormat.week,
            rowHeight: 62.h,
            selectedDayPredicate: model.selectedDayPredicate,
            onDaySelected: (selectedDay, focusedDay) =>
                model.setSelectedAppointmentDay(selectedDay),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final isAvailable = model.isAvailable(day);
                if (!isAvailable) {
                  return Center(
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
