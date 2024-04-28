import 'package:cached_network_image/cached_network_image.dart';
import 'package:contactcars_task/core/constants/colors.dart';
import 'package:contactcars_task/core/theme/manager/text_styles.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String date;

  const MovieItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
          color: AppColors.shadeColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          )),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/original$imageUrl',
                fit: BoxFit.cover,
                placeholder: (BuildContext context, String url) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.titleSmall(context),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        date,
                        style: TextStyles.bodySmall(context,
                            color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
