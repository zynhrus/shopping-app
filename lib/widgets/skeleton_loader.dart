import 'package:fit_hub_project/main.import.dart';
import 'package:fit_hub_project/main.library.dart';


class _SkeletonLoader extends StatelessWidget {
  final Widget child;

  const _SkeletonLoader({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(0.2),
      highlightColor: Colors.black.withOpacity(0.1),
      child: child,
    );
  }
}

class SkeletonLoaderSquare extends StatelessWidget {
  final double width;
  final double height;
  final double roundedRadius;

  const SkeletonLoaderSquare(
      {Key? key,
      required this.width,
      required this.height,
      this.roundedRadius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SkeletonLoader(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(roundedRadius)),
      ),
    );
  }
}
