part of '../appointment_booking_view.dart';

class _ClinicPriceComponent extends StatelessWidget {
  const _ClinicPriceComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AppointmentViewModel, List<Price>>(
      selector: (context, value) => value.prices,
      builder: (context, prices, _) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            prices.isEmpty
                ? r'Booking salary: $30'
                : 'Booking salary ${prices.first.price} \$',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
