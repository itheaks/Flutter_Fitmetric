// import 'package:flutter/material.dart';
// import 'package:scratch/models/samples.dart';
// import 'package:scratch/samples/animations/animation_samples_list.dart';
// import 'package:scratch/samples/animations/custom_caret/custom_caret.dart';
// import 'package:scratch/screens/samples_list_view.dart';
// import 'package:scratch/samples/ui/rive_app/home.dart';
// import 'package:scratch/samples/animations/grid_magnification/grid_magnification.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Samples',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: {
//         RiveAppHome.route: (context) => const RiveAppHome(),
//         // AnimationSamplesList.route: (context) => const AnimationSamplesList(),
//         // GridMagnification.route: (context) => const GridMagnification(),
//         // CustomCaret.route: (context) => const CustomCaret(),
//       },
//       home: SamplesListView(
//         title: "Flutter Samples",
//         backEnabled: false,
//         listData: SampleData.sampleTypes,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:scratch/samples/ui/rive_app/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Rive App',
      home: RiveAppHome(),
    );
  }
}
