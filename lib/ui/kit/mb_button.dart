import 'package:flutter/material.dart';
import 'package:mybooks/ui/kit/mb_colors.dart';
import 'package:mybooks/ui/kit/mb_text_style.dart';
import 'package:mybooks/utils/throttler.dart';

class MBButton extends StatefulWidget {
  const MBButton.primary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  })  : backgroundColor = MBColors.mainColor,
        textColor = MBColors.blackColor,
        super(key: key);

  const MBButton.secondary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  })  : backgroundColor = MBColors.orangeColor,
        textColor = MBColors.blackColor,
        super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool loading;

  @override
  _MBButtonState createState() => _MBButtonState();
}

class _MBButtonState extends State<MBButton> {
  late final _clickThrottler = Throttler(_onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _clickThrottler.throttle,
      child: widget.loading ? _loading() : _text(),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(widget.backgroundColor),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return Text(
      widget.text,
      textAlign: TextAlign.center,
      style: MBTextStyle.instance.style17Semibold.copyWith(
        color: widget.textColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _loading() {
    return CircularProgressIndicator(color: MBColors.blackColor);
  }

  void _onPressed() {
    widget.onPressed();
  }
}
