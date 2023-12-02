import 'package:azercell_task_application/utilities/exports/widgets.dart';
import 'package:azercell_task_application/utilities/extensions/string_extentions.dart';
import 'package:azercell_task_application/utilities/extensions/widget_extentions.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
  final ListTileControlAffinity affinity;
  final bool busy;
  final double height;

  const StyledButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.icon,
    this.affinity = ListTileControlAffinity.leading,
    this.busy = false,
    this.height = 56.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: busy ? null : onTap,
      child: Container(
        height: height,
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: backgroundColor ?? Colors.pink,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: busy
              ? const LoadingIndicator(
                  storkeWidth: 3.0,
                ).inSizeOf(24.0, 24.0)
              : SizedBox(
                  key: ValueKey('$busy'),
                  width: double.maxFinite,
                  child: icon == null
                      ? Text(
                          title.asValidString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textColor ?? Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (affinity == ListTileControlAffinity.leading)
                              icon!.padRight(8.0),
                            Text(title.asValidString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: textColor ?? Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600)),
                            if (affinity == ListTileControlAffinity.trailing)
                              icon!.padLeft(8.0),
                          ],
                        ),
                ),
        ),
      ),
    );
  }
}
