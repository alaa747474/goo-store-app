import 'package:flutter/material.dart';


class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    required this.text,
    required this.price
  }) : super(key: key);
  final num price;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text('$price \$',
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      );
  }
}
