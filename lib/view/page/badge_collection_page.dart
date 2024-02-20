import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/provider/badge_provider.dart';

class BadgeCollectionPage extends StatelessWidget {
  const BadgeCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BadgeProvider>(context, listen: false);

    print("테스트2 : ${provider.badgeList}");
    print("테스트2 : ${provider.userBadgeList}");
    return const Placeholder();
  }
}
