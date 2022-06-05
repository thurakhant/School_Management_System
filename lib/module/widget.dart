import 'package:flutter/material.dart';
import 'extension.dart';

enum ButtonType { Save, New, Delete, Cancel }

class Label extends StatelessWidget {
  final String title;
  final double? fontsize;
  final Color? color;
  final bool bold;
  const Label(this.title,
      {this.fontsize, this.color, this.bold = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final Icon? icon;
  final ButtonType? type;
  final Color? color;
  final EdgeInsets? padding;

  const Button(
      {this.type,
      this.title,
      required this.onTap,
      this.color,
      this.icon,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color ??
              (type == ButtonType.Save
                  ? Colors.blue
                  : type == ButtonType.Cancel
                      ? Colors.deepOrangeAccent
                      : type == ButtonType.Delete
                          ? Colors.redAccent
                          : type == ButtonType.New
                              ? Colors.blue
                              : null),
        ),
        padding: MaterialStateProperty.all(padding ?? EdgeInsets.all(22)),
      ),
      onPressed: onTap,
      child: type != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  type == ButtonType.Save
                      ? Icons.save
                      : type == ButtonType.Cancel
                          ? Icons.cancel
                          : type == ButtonType.Delete
                              ? Icons.delete
                              : type == ButtonType.New
                                  ? Icons.add_box
                                  : Icons.help_center,
                  size: 15,
                ),
                const SizedBox(height: 5),
                type == ButtonType.Save
                    ? 'Save'.toLabel()
                    : type == ButtonType.Cancel
                        ? 'Cancel'.toLabel()
                        : type == ButtonType.Delete
                            ? 'Delete'.toLabel()
                            : type == ButtonType.New
                                ? 'New'.toLabel()
                                : (title)!.toLabel(),
              ],
            )
          : icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon!,
                    const SizedBox(width: 5),
                    (title)!.toLabel(),
                  ],
                )
              : (title)!.toLabel(),
    );
  }
}

class Edit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autofocus;
  final bool password;
  final bool notempty;
  final TextEditingController? controller;
  const Edit(
      {required this.hint,
      this.onChange,
      this.controller,
      this.notempty = false,
      this.autofocus = false,
      this.password = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            gapPadding: 20,
          ),
          labelText: hint,
          labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
      obscureText: password,
      controller: controller,
      onChanged: onChange,
      validator: (val) {
        if ((val ?? '').isEmpty && notempty) {
          return "Cannot Be Empty";
        }
      },
    );
  }
}
