import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/doctor_live_chats/controller/doctor_live_controller.dart';


class CommentTile extends StatelessWidget {
  final CommentModel comment;

  const CommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(comment.avatarUrl)),
      title: Text(
        comment.name,
        style: AppTextStyles.buttonText.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Wrap the comment text with Flexible to allow line wrapping
          Flexible(
            child: Text(
              '${comment.comment} ${comment.emoji}',
              style: AppTextStyles.buttonText.copyWith(fontWeight: FontWeight.w100,fontSize: 13),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
