import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nonqueue_app/utils/constants.dart';

class AnimatedAlert extends StatefulWidget {
  final String title;
  final String? desc;
  /// Types of lottie icons: alert, failed, loading, successful, locked.
  final String type;
  final Widget? bodyWidget;
  final bool showButtons;
  final bool? onlyOneButton;
  final String? submitText;
  final String? cancelText;
  final Function? onSubmit;
  final Function? onCancel;

  const AnimatedAlert(
      {Key? key,
      required this.title,
      this.desc,
      required this.type,
      this.bodyWidget,
      required this.showButtons,
      this.onSubmit,
      this.onCancel,
      this.submitText,
      this.cancelText, this.onlyOneButton})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedAlertState();
}

class AnimatedAlertState extends State<AnimatedAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
            decoration: ShapeDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
                shape: const RoundedRectangleBorder(borderRadius: Radiuses.r8)),
            child: FittedBox(
              child: Column(
                children: <Widget>[
                  LottieBuilder.asset('assets/lottie/${widget.type}.json', width: 100),
                  Text(widget.title, style: const TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Text(widget.desc ?? '', style: TextStyle(color: Colors.blueGrey.shade200, fontSize: 12),),
                  ),
                  widget.bodyWidget ?? Container(),
                  widget.showButtons ? Row(
                    children: [
                      TextButton(
                        onPressed: () => widget.onSubmit!(),
                        style: TextButton.styleFrom(
                            fixedSize: const Size(100, 40)),
                        child: Text(widget.submitText!),
                      ),
                      if(!(widget.onlyOneButton??false)) const SizedBox(width: 8),
                      if(!(widget.onlyOneButton??false)) OutlinedButton(
                        onPressed: () => widget.onCancel!(),
                        style: TextButton.styleFrom(
                            fixedSize: const Size(100, 40)),
                        child: Text(widget.cancelText!),
                      )
                    ],
                  ) : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
