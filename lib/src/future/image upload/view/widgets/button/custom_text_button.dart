import 'package:flutter/material.dart';

import '../../../../../core/utility/constants/border_radius.dart';
import '../../../../../core/utility/constants/padding.dart';



class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.color,
    required this.text,
    required this.iconData,
    required this.onPressed,
  });
  final Color color;
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;
  double iconSize = 25;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiuses.large,
          side: BorderSide(color: color),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: 120,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: Paddings.iconPadding,
              child: Icon(iconData, color: color, size: iconSize),
            ),
                
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
