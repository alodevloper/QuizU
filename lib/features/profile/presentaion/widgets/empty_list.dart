import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/fixed_assets.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset(
            emptyList,
            width: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            "No previous scores",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
