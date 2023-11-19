import 'package:app/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class IconsStacked extends StatelessWidget {

 
  const IconsStacked(
    {
      super.key,
      required this.main,
      required this.helper,
    });

    final IconData main;
    final IconData helper;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Icon(
            main,
            size: 32,
            color: ThemeColors.primaryText,
          ),
        Positioned(
          right: -2,
          top: 12,
          child: Icon(helper,
            size: 18,
            //color: ThemeColors.accentColor,
            
          ),
        ),
      ],
    );
  }

}