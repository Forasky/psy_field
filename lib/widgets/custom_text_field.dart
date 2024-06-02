import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelTitle;
  final String? hintText;
  final bool? isPassword;
  final Widget? error;
  final bool? isPincode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onSuffixIconTap;
  final double? maxWidth;
  final List<TextInputFormatter> inputFormatters;

  // final bool? isDark;
  final bool enabled;
  final Function()? onTap;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool enableSelection;

  final int maxLines;
  final bool? showSuffix;
  final Widget? customSuffixIcon;
  final Widget? customPrefixIcon;
  final Color? fillColor;
  final bool withOutlineBorder;
  final TextAlign? textAlign;
  final double? fontSize;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? titleStyle;
  final InputBorder? border;
  final double? contentPadding;
  final double? height;
  final BoxDecoration? decoration;
  final bool disableBorder;
  final Color? hintColor;

  const CustomTextField({
    this.controller,
    super.key,
    this.error,
    this.inputFormatters = const [],
    this.labelTitle,
    this.onChanged,
    this.onSubmitted,
    this.onTapOutside,
    this.isPassword,
    this.isPincode,
    // this.isDark,
    this.hintText,
    this.enabled = true,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.validator,
    this.onSuffixIconTap,
    this.maxWidth,
    this.enableSelection = false,
    this.autovalidateMode,
    this.maxLines = 1,
    this.showSuffix,
    this.customSuffixIcon,
    this.fillColor,
    this.customPrefixIcon,
    this.textAlign,
    this.fontSize,
    this.titleStyle,
    this.withOutlineBorder = false,
    this.border,
    this.contentPadding,
    this.height,
    this.decoration,
    this.disableBorder = false,
    this.hintColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.isPassword ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.maxWidth ?? double.infinity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.labelTitle != null) ...[
            Text(
              widget.labelTitle.toString(),
              style: widget.titleStyle ?? Theme.of(context).textTheme.labelSmall,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          ] else
            const SizedBox(),
          Container(
            height: widget.height,
            padding: widget.withOutlineBorder ? const EdgeInsets.symmetric(horizontal: 10) : null,
            decoration: widget.withOutlineBorder
                ? widget.decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, border: Border.all(color: Colors.grey))
                : null,
            child: TextFormField(
              autovalidateMode: widget.autovalidateMode,
              textAlign: widget.textAlign ?? TextAlign.start,
              inputFormatters: widget.inputFormatters,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey, fontSize: widget.fontSize),
              readOnly: widget.isPincode ?? false,
              validator: widget.validator,
              focusNode: widget.focusNode,
              onTap: widget.onTap,
              enabled: widget.enabled,
              enableInteractiveSelection: widget.enableSelection,
              onChanged: widget.onChanged,
              maxLines: widget.maxLines,
              onFieldSubmitted: widget.onSubmitted,
              onTapOutside: widget.onTapOutside,
              controller: widget.controller,
              obscureText: obscureText,
              keyboardType: widget.isPincode ?? false ? TextInputType.number : widget.keyboardType,
              enableSuggestions: false,
              autocorrect: false,
              cursorColor: Colors.blue.shade700,
              decoration: InputDecoration(
                error: widget.error,
                labelStyle: const TextStyle(color: Colors.grey),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: widget.hintColor ?? Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: widget.disableBorder ? BorderSide.none : const BorderSide(color: Colors.blue),
                ),
                enabledBorder: widget.border ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: widget.disableBorder ? BorderSide.none : const BorderSide(color: Colors.blue),
                    ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                contentPadding: EdgeInsets.symmetric(
                  // vertical: CoreConstants.iSpacePadding20,
                  horizontal: widget.contentPadding ?? 16,
                ),
                filled: true,
                fillColor: widget.fillColor ?? Colors.white,
                prefixIcon: widget.customPrefixIcon,
                suffixIcon: widget.customSuffixIcon != null
                    ? widget.customSuffixIcon!
                    : widget.showSuffix ?? true
                        ? GestureDetector(
                            onTap: widget.onSuffixIconTap ??
                                () {
                                  if (widget.isPassword == true) {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  } else {
                                    widget.controller?.clear();
                                  }
                                },
                            child: (widget.isPassword == true)
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Icon(Icons.remove_red_eye),
                                  )
                                : (widget.controller != null && widget.controller!.text.isNotEmpty)
                                    ? const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        child: Icon(Icons.clear),
                                      )
                                    : const SizedBox(),
                          )
                        : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
