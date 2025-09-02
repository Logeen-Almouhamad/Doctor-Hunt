import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';

class CommentModel {
  final String name;
  final String comment;
  final String avatarUrl;
  final String emoji;

  CommentModel({
    required this.name,
    required this.comment,
    required this.avatarUrl,
    required this.emoji,
  });
}

class CommentController extends GetxController {
  var comments = <CommentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadComments();
  }

  void loadComments() {
    comments.value = [
      CommentModel(
        name: "Everhart Tween",
        comment: "Thanks for shareing doctor",
        avatarUrl: AppImages.u1,
        emoji: "❤️",
      ),
      CommentModel(
        name: "Bonebrake Mash",
        comment: "They treat immune system disorders",
        avatarUrl:  AppImages.u2,
        emoji: "",
      ),
      CommentModel(
        name: "Handler Wack",
        comment: "This is the largest directory",
        avatarUrl:  AppImages.u3,
        emoji:'👍',
      ),
      CommentModel(
        name: "Comfort Love",
        comment: "Depending on their education",
        avatarUrl:  AppImages.u4,
        emoji: '😀',
      ),
    ];
  }

  void addComment(String name, String comment) {
    comments.add(CommentModel(
      name: name,
      comment: comment,
      avatarUrl: AppImages.u1,
      emoji: "💬",
    ));
  }
}