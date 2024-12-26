import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';

class ExamLessonAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  const ExamLessonAppBar({
    super.key,
    this.title = '',
    this.showActionIcon = false,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.primaryThirdBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Stack(
            children: [
              Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: AppColors.primaryElementText,
                          ),
                        ),
                      )
                    : Center(
                        child: titleWidget,
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading ??
                      Transform.translate(
                        offset: const Offset(-14, 0),
                        child: const BackButton(
                          color: AppColors.primaryElementText,
                        ),
                      ),
                  if (showActionIcon)
                    Transform.translate(
                      offset: const Offset(10, 0),
                      child: IconButton(
                        onPressed: onMenuActionTap,
                        icon: const Icon(Icons.grid_view_rounded,
                            color: Colors.white),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
