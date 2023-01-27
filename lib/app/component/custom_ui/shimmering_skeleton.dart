import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const Color primaryColor = Color(0xFF2967FF);
const Color grayColor = Color(0x9AE5E5E5);

const double defaultPadding = 16.0;
class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width, this.radius}) : super(key: key);

  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffcbcbcb),
      highlightColor: const Color(0xffededed),
      enabled: true,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration:  BoxDecoration(
            color: grayColor,
            borderRadius:
            BorderRadius.all(Radius.circular(radius ?? defaultPadding))),
      ),
    );
  }
}

class SkeletonIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  const SkeletonIcon({Key? key, required this.icon, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffcbcbcb),
      highlightColor: const Color(0xffededed),
      enabled: true,
      child: Icon(icon, color: Colors.grey, size: size ?? 32),
    );
  }
}

class SkeletonNoRadius extends StatelessWidget {
  const SkeletonNoRadius({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffcbcbcb),
      highlightColor: const Color(0xffededed),
      enabled: true,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
            color: grayColor),
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: grayColor,
        shape: BoxShape.circle,
      ),
    );
  }
}