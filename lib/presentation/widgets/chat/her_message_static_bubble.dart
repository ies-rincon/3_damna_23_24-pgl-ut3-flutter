import 'package:flutter/material.dart';

class HerMessageStaticBubble extends StatelessWidget {
  const HerMessageStaticBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              // 'Her Love Message 💟',
              'Aliquip ipsum sint culpa sint ea anim laboris quis fugiat eiusmod laborum. 💟 💟 💟 💟',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const _ImageBubble(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/yes/13-c3082a998e7758be8e582276f35d1336.gif",
        fit: BoxFit.cover,
        height: 150,
        width: size.width * 0.7,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('My Love is writing 💞 ...'),
          );
        },
      ),
    );
  }
}
