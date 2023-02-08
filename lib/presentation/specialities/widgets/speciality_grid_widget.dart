part of '../search_speciality_view.dart';

class SpecialityGridWidget extends StatelessWidget {
  const SpecialityGridWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.onTap,
  }) : super(key: key);
  final String name;
  final String imagePath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Flexible(
                child: AutoSizeText(
                  name,
                  maxLines: 2,
                  wrapWords: false,
                  minFontSize: 8,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
