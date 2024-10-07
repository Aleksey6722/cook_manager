import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonsBarWithAddButton extends StatelessWidget {
  const ButtonsBarWithAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // TODO: move tile up
              },
              child: Stack(
                children: [
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          shape: BoxShape.circle),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/chevron-up-circle-outline.svg',
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      theme.hintColor.withOpacity(0.2),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                // TODO: move tile down
              },
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          shape: BoxShape.circle),
                    ),
                    left: 4,
                    top: 4,
                  ),
                  SvgPicture.asset(
                    'assets/icons/chevron-down-circle.svg',
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.onSurface.withOpacity(0.9),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(flex: 25),
        Visibility(
          visible: true,
          replacement: Container(height:56),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    shape: BoxShape.circle),
              ),
              IconButton(
                onPressed: () {
                  // TODO: add new tile
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 40,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 35),
        GestureDetector(
          onTap: () {
           // TODO: delete tile
          },
          child: const Icon(
            Icons.delete_rounded,
            size: 40,
            color: Color(0xFFb84848),
          ),
        ),
      ],
    );
  }
}
