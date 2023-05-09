import 'package:fitness_app/feature/home_provider.dart';
import 'package:fitness_app/feature/type_page/type_wiew.dart';
import 'package:fitness_app/product/constants/color_constants.dart';
import 'package:fitness_app/product/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../product/models/exercises.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(_homeProvider.notifier).fetchisLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.supervised_user_circle_rounded,
          size: 30,
        ),
        title: Column(
          children: const [
            Text(
              'Hoşgeldiniz',
              //  style: context.textTheme.titleMedium,
            ),
            Text(
              'FITNES APP',
              //   style: context.textTheme.labelMedium,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _MyListView(),
      ),
    );
  }
}

class _MyListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final getFilterMuscle = ref.watch(_homeProvider.notifier).getMuscles();
    final getImage = ref.watch(_homeProvider).muscleImage;
    //  final List<Exercises>? exercisesList = ref.watch(_homeProvider).exercises;

    return ref.watch(_homeProvider).isLoading ?? true
        ? const Center(
            child: SpinKitFadingFour(
              color: Colors.white, // customize the color
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: getImage?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: context.paddingNormal,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: context.dynamicWidth(.1),
                        height: context.dynamicHeight(0.2),
                        child: Card(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: AnimatedOpacity(
                                  opacity: 0.8,
                                  duration: context.durationLow,
                                  child: Image.network(
                                    getImage?[index].imageUrl ??
                                        StringConstants.tempImage,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      return loadingProgress != null
                                          ? const Center(
                                              child: SpinKitFadingCircle(
                                              color: ColorConstans.midnightBlue,
                                            ))
                                          : child;
                                    },
                                    width: context.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  //   String? selectedString = getImage?[index].muscle;

                                  debugPrint(
                                      '${getImage?[index].muscle} exercsie asdhashdhashdasdsad');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TypeView(
                                          selectedMuscle:
                                              getImage?[index].muscle ?? '',
                                        ),
                                      ));
                                },
                                title: Center(
                                  child: Text(
                                    '${getImage?[index].muscle?.toUpperCase()}',
                                    style: context
                                        .textTheme.displaySmall
                                        ?.copyWith(
                                            color: ColorConstans.textColor2,
                                            fontFamily: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400)
                                                .fontFamily,
                                            fontSize: context.textTheme
                                                .headlineLarge?.fontSize,
                                            letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
