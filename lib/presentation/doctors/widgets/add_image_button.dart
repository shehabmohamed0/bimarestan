part of'../send_radiological_analysis_view.dart';



class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      constraints: BoxConstraints(
        minHeight: 80.w,
        minWidth: 80.w,
      ),
      style: IconButton.styleFrom(
        surfaceTintColor: context.colorScheme.surfaceTint,
        backgroundColor: Colors.white,
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      onPressed: onPressed,
      icon: const Icon(
        Icons.add,
      ),
    );
  }
}
