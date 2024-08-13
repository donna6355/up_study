import 'package:flutter/material.dart';

class TextBubble extends StatelessWidget {
  final bool isCari;
  final String message;
  const TextBubble({
    required this.isCari,
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isCari ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isCari)
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Image.asset(
                    'assets/cari_chat.png',
                    width: 80,
                  ),
                ),
              Container(
                constraints: const BoxConstraints(maxWidth: 260),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
