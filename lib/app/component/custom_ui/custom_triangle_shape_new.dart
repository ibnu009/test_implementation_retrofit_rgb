import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomShapeTriangleNew extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9409657,size.height*-0.01945568);
    path_0.cubicTo(size.width*0.9883691,size.height*-0.01945568,size.width*1.026803,size.height*0.01848631,size.width*1.026803,size.height*0.06529025);
    path_0.lineTo(size.width*1.026803,size.height*0.7912373);
    path_0.cubicTo(size.width*1.026803,size.height*0.8670254,size.width*0.9337425,size.height*0.9047076,size.width*0.8798455,size.height*0.8507415);
    path_0.lineTo(size.width*0.1547983,size.height*0.1247924);
    path_0.cubicTo(size.width*0.1013086,size.height*0.07123602,size.width*0.1397365,size.height*-0.01945568,size.width*0.2159185,size.height*-0.01945568);
    path_0.lineTo(size.width*0.9409657,size.height*-0.01945568);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffDCB81D).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.5643948,size.height*0.1522237);
    path_1.lineTo(size.width*0.4942876,size.height*0.2250551);
    path_1.lineTo(size.width*0.4719614,size.height*0.2041085);
    path_1.lineTo(size.width*0.5811202,size.height*0.09070890);
    path_1.lineTo(size.width*0.5989142,size.height*0.1074055);
    path_1.lineTo(size.width*0.5863348,size.height*0.2378593);
    path_1.lineTo(size.width*0.6581330,size.height*0.1632712);
    path_1.lineTo(size.width*0.6804549,size.height*0.1842178);
    path_1.lineTo(size.width*0.5714549,size.height*0.2974581);
    path_1.lineTo(size.width*0.5528498,size.height*0.2800025);
    path_1.lineTo(size.width*0.5643948,size.height*0.1522237);
    path_1.close();
    path_1.moveTo(size.width*0.6295966,size.height*0.3550504);
    path_1.cubicTo(size.width*0.6228026,size.height*0.3486754,size.width*0.6177296,size.height*0.3417894,size.width*0.6143820,size.height*0.3343928);
    path_1.cubicTo(size.width*0.6111373,size.height*0.3268894,size.width*0.6094678,size.height*0.3193462,size.width*0.6093777,size.height*0.3117636);
    path_1.cubicTo(size.width*0.6093906,size.height*0.3040746,size.width*0.6107768,size.height*0.2966627,size.width*0.6135408,size.height*0.2895280);
    path_1.cubicTo(size.width*0.6165150,size.height*0.2823877,size.width*0.6207682,size.height*0.2759428,size.width*0.6263004,size.height*0.2701928);
    path_1.cubicTo(size.width*0.6339914,size.height*0.2622072,size.width*0.6427897,size.height*0.2565831,size.width*0.6527039,size.height*0.2533208);
    path_1.cubicTo(size.width*0.6627253,size.height*0.2501593,size.width*0.6729742,size.height*0.2497462,size.width*0.6834549,size.height*0.2520801);
    path_1.cubicTo(size.width*0.6941416,size.height*0.2544089,size.width*0.7040730,size.height*0.2598742,size.width*0.7132403,size.height*0.2684754);
    path_1.cubicTo(size.width*0.7225150,size.height*0.2771780,size.width*0.7284936,size.height*0.2866386,size.width*0.7311760,size.height*0.2968576);
    path_1.cubicTo(size.width*0.7339657,size.height*0.3069699,size.width*0.7339056,size.height*0.3169462,size.width*0.7310043,size.height*0.3267860);
    path_1.cubicTo(size.width*0.7283090,size.height*0.3366203,size.width*0.7233262,size.height*0.3453178,size.width*0.7160472,size.height*0.3528775);
    path_1.cubicTo(size.width*0.7148155,size.height*0.3541555,size.width*0.7134807,size.height*0.3554356,size.width*0.7120429,size.height*0.3567186);
    path_1.cubicTo(size.width*0.7107039,size.height*0.3578953,size.width*0.7095708,size.height*0.3588589,size.width*0.7086438,size.height*0.3596093);
    path_1.lineTo(size.width*0.6431245,size.height*0.2981356);
    path_1.cubicTo(size.width*0.6394549,size.height*0.3027996,size.width*0.6371073,size.height*0.3076898,size.width*0.6360815,size.height*0.3128068);
    path_1.cubicTo(size.width*0.6351674,size.height*0.3180250,size.width*0.6355064,size.height*0.3230038,size.width*0.6370987,size.height*0.3277432);
    path_1.cubicTo(size.width*0.6389056,size.height*0.3324775,size.width*0.6416953,size.height*0.3366153,size.width*0.6454721,size.height*0.3401572);
    path_1.cubicTo(size.width*0.6497854,size.height*0.3442047,size.width*0.6548026,size.height*0.3469877,size.width*0.6605236,size.height*0.3485064);
    path_1.cubicTo(size.width*0.6664592,size.height*0.3500199,size.width*0.6717639,size.height*0.3497305,size.width*0.6764464,size.height*0.3476386);
    path_1.lineTo(size.width*0.6901330,size.height*0.3702055);
    path_1.cubicTo(size.width*0.6839828,size.height*0.3725419,size.width*0.6773777,size.height*0.3735390,size.width*0.6703176,size.height*0.3731970);
    path_1.cubicTo(size.width*0.6633648,size.height*0.3729559,size.width*0.6563777,size.height*0.3713653,size.width*0.6493562,size.height*0.3684246);
    path_1.cubicTo(size.width*0.6424378,size.height*0.3653775,size.width*0.6358498,size.height*0.3609195,size.width*0.6295966,size.height*0.3550504);
    path_1.close();
    path_1.moveTo(size.width*0.6557082,size.height*0.2841042);
    path_1.lineTo(size.width*0.7000343,size.height*0.3256941);
    path_1.cubicTo(size.width*0.7037039,size.height*0.3210301,size.width*0.7059957,size.height*0.3161928,size.width*0.7069227,size.height*0.3111822);
    path_1.cubicTo(size.width*0.7080558,size.height*0.3061665,size.width*0.7078240,size.height*0.3012890,size.width*0.7062275,size.height*0.2965496);
    path_1.cubicTo(size.width*0.7047339,size.height*0.2917034,size.width*0.7019914,size.height*0.2874085,size.width*0.6980043,size.height*0.2836644);
    path_1.cubicTo(size.width*0.6941202,size.height*0.2800216,size.width*0.6896910,size.height*0.2775873,size.width*0.6847124,size.height*0.2763619);
    path_1.cubicTo(size.width*0.6799442,size.height*0.2751309,size.width*0.6750000,size.height*0.2751513,size.width*0.6698755,size.height*0.2764229);
    path_1.cubicTo(size.width*0.6649614,size.height*0.2776894,size.width*0.6602403,size.height*0.2802496,size.width*0.6557082,size.height*0.2841042);
    path_1.close();
    path_1.moveTo(size.width*0.8720086,size.height*0.4201801);
    path_1.lineTo(size.width*0.8925536,size.height*0.4394576);
    path_1.lineTo(size.width*0.7765665,size.height*0.4899068);
    path_1.lineTo(size.width*0.7584464,size.height*0.4729068);
    path_1.lineTo(size.width*0.7788026,size.height*0.4236140);
    path_1.lineTo(size.width*0.7302961,size.height*0.4464958);
    path_1.lineTo(size.width*0.7120172,size.height*0.4293432);
    path_1.lineTo(size.width*0.7573133,size.height*0.3125627);
    path_1.lineTo(size.width*0.7776953,size.height*0.3316881);
    path_1.lineTo(size.width*0.7420515,size.height*0.4186153);
    path_1.lineTo(size.width*0.7782103,size.height*0.4005627);
    path_1.lineTo(size.width*0.7979270,size.height*0.3509729);
    path_1.lineTo(size.width*0.8158798,size.height*0.3678216);
    path_1.lineTo(size.width*0.8000172,size.height*0.4015729);
    path_1.lineTo(size.width*0.8335150,size.height*0.3843665);
    path_1.lineTo(size.width*0.8514721,size.height*0.4012148);
    path_1.lineTo(size.width*0.8023133,size.height*0.4231788);
    path_1.lineTo(size.width*0.7860515,size.height*0.4599025);
    path_1.lineTo(size.width*0.8720086,size.height*0.4201801);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}