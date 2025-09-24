import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final IconData? prefixIcon;

  const CustomTextField({super.key, required this.controller, required this.label, this.obscureText = false, this.prefixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscure,
      style: TextStyle(color: const Color.fromARGB(255, 5, 3, 3), fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 5, 3, 3), fontWeight: FontWeight.bold),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: const Color.fromARGB(255, 32, 31, 31))
            : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: Colors.amber),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color.fromARGB(255, 8, 6, 6), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color.fromARGB(255, 5, 5, 7), width: 2),
        ),
        fillColor: Colors.green[700]?.withOpacity(0.2),
        filled: true,
      ),
    );
  }
}
