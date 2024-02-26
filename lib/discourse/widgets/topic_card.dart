import 'package:cached_network_image/cached_network_image.dart';
import 'package:discourse_repository/discourse_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rtu_mirea_app/presentation/theme.dart';
import 'package:rtu_mirea_app/presentation/typography.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key, required this.topic, this.author}) : super(key: key);

  final Topic topic;
  final User? author;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          launchUrlString('https://mirea.ninja/t/${topic.id}');
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 128,
                    child: topic.imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: topic.imageUrl!,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFFB8E0),
                                  Color(0xFFBE9EFF),
                                  Color(0xFF88C0FC),
                                  Color(0xFF86FF99),
                                ],
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/image_placeholder.svg',
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      'https://mirea.ninja/${author?.avatarTemplate.replaceAll('{size}', '64')}',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          topic.title,
                          style: AppTextStyle.titleM,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                topic.excerpt,
                                style: AppTextStyle.body,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: AppTheme.colorsOf(context).deactive,
                                    ),
                                    Text(
                                      topic.views.toString(),
                                      style: AppTextStyle.captionS.copyWith(color: AppTheme.colorsOf(context).deactive),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 4),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                      color: AppTheme.colorsOf(context).deactive,
                                    ),
                                    Text(
                                      topic.likeCount.toString(),
                                      style: AppTextStyle.captionS.copyWith(color: AppTheme.colorsOf(context).deactive),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
