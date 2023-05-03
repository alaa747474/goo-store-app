import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.onPressed,required this.inFavorites});
  final VoidCallback onPressed;
  final bool inFavorites;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.none,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).cardColor,
        shape: const CircleBorder(),
        fixedSize: Size(40.r, 40.r)
      ),
      child: Center(
        child:inFavorites?const Icon(Icons.favorite,color: Colors.red,): Icon(
          Icons.favorite_border_outlined,
          color: Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
