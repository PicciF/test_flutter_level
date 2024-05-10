// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test_flutter_level/constants.dart';

class SpecieTextField extends StatefulWidget {
  const SpecieTextField({
    required this.controller,
    this.labelText = '',
    this.isRequired = false,
    this.hint = '',
    this.isVisiblePass = false,
    this.obscureText = false,
    this.onPressed,
    this.icon,
    super.key,
  });

  final String labelText;
  final TextEditingController controller;
  final String hint;

  final Widget? icon;
  final Function(String)? onPressed;
  final bool obscureText;
  final bool isVisiblePass;
  final bool isRequired;

  @override
  State<SpecieTextField> createState() => _SpecieTextFieldState();
}

class _SpecieTextFieldState extends State<SpecieTextField> {
  bool isSelected = false;
  bool isPassword = false;
  bool isVisibileIcon = false;
  bool validate = false;
  @override
  void initState() {
    isPassword = widget.obscureText;
    isVisibileIcon = widget.isVisiblePass;
    super.initState();
  }

  togglePasswordVisibility() {
    setState(() {
      isVisibileIcon = !isVisibileIcon;
      isPassword = !isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText.isEmpty
            ? Container()
            : Text(
                widget.isRequired ? "${widget.labelText}*" : widget.labelText,
                style: TextStyle(color: isSelected ? COLOR_BLUE : COLOR_GREY),
              ),
        Focus(
            onFocusChange: (value) {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: TextField(
                obscureText: isPassword,
                textAlignVertical: TextAlignVertical.center,
                controller: widget.controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: widget.hint,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 16),
                      child: widget.icon,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: widget.isVisiblePass,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: IconButton(
                                onPressed: togglePasswordVisibility,
                                icon: isVisibileIcon ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              widget.controller.text = "";
                              doOnPressed(widget.controller.text);
                            },
                            icon: const Icon(Icons.clear),
                          ),
                        ],
                      ),
                    )),
                onChanged: doOnPressed)),
      ],
    );
  }

  doOnPressed(value) {
    widget.onPressed?.call(value);
  }
}
