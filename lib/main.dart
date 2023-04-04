import 'package:fit_hub_project/main.import.dart';
import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ProductBinding(),
      home: const HomeScreen(),
      getPages: AppPages.pages,
    );
  }
}
