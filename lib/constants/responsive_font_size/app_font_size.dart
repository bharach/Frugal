
import 'package:flutter/material.dart';

import '../screen_size/app_screen_size.dart';


double respnsvFont( BuildContext context) {
  
 final double fontsize;
  fontsize = ScreenSize.width(context) <= 360
      ? 15
      : ScreenSize.width(context) <= 411
          ?  18   
          : ScreenSize.width(context) <= 480
              ? 20
              : 26;
//           print(ScreenSize.width(context).toString());
// print(fontsize.toString());
  return fontsize;
}