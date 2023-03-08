part of'../send_radiological_analysis_view.dart';

class WrapImage extends StatelessWidget {
  const WrapImage({
    super.key,
    required this.image,
    required this.onRemove,
    required this.onTap,
  });

  final File image;
  final VoidCallback onRemove;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 80.w,
      child: Stack(
        children: [
          Positioned.fill(
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              surfaceTintColor: Colors.white,
              margin: EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Ink.image(
                  fit: BoxFit.cover,
                  image: FileImage(
                    image,
                  ),
                  child: InkWell(
                    onTap: onTap,
                    splashColor: context.colorScheme.primary.withOpacity(0.08),
                  ),
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            end: 0,
            top: 0,
            child: IconButton(
              style: IconButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: context.colorScheme.primary,
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  elevation: 1.0,
                  iconSize: 16,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  )),
              icon: const Icon(
                Icons.close,
              ),
              onPressed: onRemove,
            ),
          ),
        ],
      ),
    );
  }
}
