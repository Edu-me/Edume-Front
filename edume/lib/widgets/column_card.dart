import 'package:edume/widgets/service_card.dart';
import 'package:flutter/material.dart';

class ColumCard extends StatelessWidget {
  const ColumCard({
    Key key,
    @required this.services,
  }) : super(key: key);

  final List<ServiceCard> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: services,
    );
  }
}
