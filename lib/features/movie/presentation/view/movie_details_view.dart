import 'package:cached_network_image/cached_network_image.dart';
import 'package:contactcars_task/core/constants/colors.dart';
import 'package:contactcars_task/core/theme/manager/text_styles.dart';
import 'package:contactcars_task/core/widgets/custom_back_action.dart';
import 'package:contactcars_task/features/movie/data/model/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({
    super.key,
    required this.model,
  });
  final Results model;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      child: Hero(
                        tag: model.posterPath.toString(),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original${model.posterPath}',
                            fit: BoxFit.cover,
                            placeholder: (BuildContext context, String url) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(top: 40, left: 35, child: CustomBackAction()),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title ?? '',
                    style: TextStyles.titleLarge(context),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColors.primary,
                          ),
                          const Gap(10),
                          Text(
                            model.popularity.toString(),
                            style: TextStyles.bodyMedium(context),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.primary,
                          ),
                          const Gap(10),
                          Text(
                            model.voteCount.toString(),
                            style: TextStyles.bodyMedium(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text(
                    model.overview ?? '',
                    style: TextStyles.bodyMedium(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
