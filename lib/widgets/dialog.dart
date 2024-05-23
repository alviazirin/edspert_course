import 'package:edspert_course/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

showMessageDialog(BuildContext context, Size size,
    {required String message, Function()? onTap}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          decoration:
              customBoxDecoration(context: context, borderCircularSize: 16),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(message),
              const Gap(16),
              Row(
                children: [
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      height: 60,
                      width: size.width * 0.4,
                      decoration: customBoxDecoration(context: context),
                      padding: const EdgeInsets.all(16),
                      child: Center(child: Text("Ya")),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 60,
                      width: size.width * 0.4,
                      decoration: customBoxDecoration(context: context),
                      padding: const EdgeInsets.all(16),
                      child: Center(child: Text("Tidak")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
