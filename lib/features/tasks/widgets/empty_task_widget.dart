import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_next_x/resources/constants/assets_paths.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(AssetsPaths.emptyTask),
          Text("Not task found", style: Theme.of(context).textTheme.titleMedium,),
        ],
      ),
    );
  }
}
