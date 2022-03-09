import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vrna_app_mobile/src/values/colors.dart' as colors;
import 'package:vrna_app_mobile/src/values/dimens.dart' as dimens;

class EditText extends StatefulWidget {
  final bool autofocus;
  final bool border;
  final Stream<dynamic> value;
  final Function(dynamic) onChange;
  final Function() onSubmit;
  final String placeholder;
  final TextInputType keyboardType;
  final bool password;
  final bool dark;
  final bool multiline;
  final String labelText;
  final String mask;
  final prefixIcon;

  const EditText(
      {Key key,
      this.autofocus,
      this.border,
      this.value,
      this.onChange,
      this.onSubmit,
      this.placeholder,
      this.keyboardType,
      this.password,
      this.dark,
      this.multiline,
      this.labelText,
      this.mask,
      this.prefixIcon})
      : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  TextEditingController _controller;

  @override
  void didChangeDependencies() {
    _controller = new TextEditingController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: widget.value,
        initialData: "",
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            _controller.text = snapshot.data;
            //_controller.selection = TextSelection.collapsed(offset: snapshot.data.length);
          }

          return TextField(
              // controller: _controller,
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: _controller.text,
                  selection: TextSelection.collapsed(
                    offset: _controller.text.length,
                  ),
                ),
              ),
              obscureText: widget.password == true ? true : false,
              onChanged: (text) {
                if (widget.onChange != null) widget.onChange(text);
              },
              onSubmitted: (value) {
                if (widget.onSubmit != null) widget.onSubmit();
              },
              maxLines: widget.multiline == true ? null : 1,
              keyboardType: widget.multiline == true
                  ? TextInputType.multiline
                  : widget.keyboardType,
              style: TextStyle(
                  color: widget.dark == true
                      ? colors.backgroundColor
                      : colors.primaryColor //cor do texto ao digitar,
                  ),
              autofocus: widget.autofocus == null ? false : true,
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon != null
                      ? Icon(widget.prefixIcon, color: Colors.white)
                      : null,
                  hintText: snapshot.data == null ? "Holder" : snapshot.data,
                  labelText: widget.labelText == null
                      ? widget.placeholder
                      : widget.labelText,
                  errorText: snapshot.error,
                  enabledBorder: widget.border == true
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.dark == true
                                  ? Colors.white
                                  : colors.primaryColorDark, //cor da borda
                              width: 0.0),
                        )
                      : UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                  hintStyle: TextStyle(
                      color: colors.textColor, //cor do placeholder com foco
                      fontSize: dimens.fontEditText),
                  enabled: true,
                  labelStyle: TextStyle(
                      fontSize: dimens.fontEditText,
                      color: widget.dark == true
                          ? colors.textColor
                          : colors.textColor //cor da label
                      ),
                  border: widget.border == true
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: colors
                                  .accentLightColor, //cor da label quando esta com focus
                              width: 0))
                      : UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: colors.accentLightColor),
                        ),
                  focusedBorder: widget.border == true
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.dark == true
                                  ? colors.backgroundColor
                                  : colors
                                      .primaryColorDark, //cor da label quando esta com focus
                              width: 1))
                      : null));
        });
  }
}
