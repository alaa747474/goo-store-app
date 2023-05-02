import 'package:flutter/material.dart';


class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).cardColor,
      child: Icon(
        Icons.favorite_border_outlined,
        color: Theme.of(context).hintColor,
      ),
    );
  }
}
