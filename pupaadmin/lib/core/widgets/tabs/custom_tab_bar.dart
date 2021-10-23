import 'package:flutter/material.dart';
import 'package:pupaadmin/core/widgets/buttons/circular_icon_button.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  const CustomTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.red,
            automaticIndicatorColorAdjustment: true,
            tabs: tabs,
          ),
        ),
        CircularIconButton(
          icon: Icons.add,
          onPressed: () {},
          size: 30,
        ),
      ],
    );
  }
}
