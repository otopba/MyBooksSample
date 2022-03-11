import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybooks/ui/kit/mb_colors.dart';
import 'package:mybooks/ui/kit/mb_text_style.dart';
import 'package:mybooks/ui/mb_page_mixin.dart';

class MBField extends StatefulWidget {
  const MBField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.textInputAction,
    this.onDone,
    this.errorText,
    this.enabled = true,
  }) : super(key: key);

  final String labelText;
  final ValueChanged<String> onChanged;
  final TextInputAction? textInputAction;
  final VoidCallback? onDone;
  final String? errorText;
  final bool enabled;

  @override
  _MBFieldState createState() => _MBFieldState();
}

class _MBFieldState extends State<MBField> with MBPageStateMixin {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: MBTextStyle.instance.style17.copyWith(
        color: colors.primaryTextColor,
      ),
      cursorColor: MBColors.mainColor,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MBColors.mainColorOp80Color),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: MBColors.mainColor),
        ),
        border: const UnderlineInputBorder(),
        labelText: widget.labelText,
        labelStyle: MBTextStyle.instance.style17Semibold.copyWith(
          color: colors.secondaryTextColor,
        ),
        counterText: "",
        errorText: widget.errorText,
        errorMaxLines: 1,
        errorStyle: MBTextStyle.instance.style12.copyWith(
          color: MBColors.redColor,
        ),
      ),
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (_) => widget.onDone?.call(),
      maxLines: 1,
      maxLength: 200,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      enabled: widget.enabled,
    );
  }
}
