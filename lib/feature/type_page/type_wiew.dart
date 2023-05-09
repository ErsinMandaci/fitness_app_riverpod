// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../product/constants/string_constants.dart';
import '../home_provider.dart';

final _fitnessProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class TypeView extends ConsumerStatefulWidget {
  String selectedMuscle;
  TypeView({
    super.key,
    required this.selectedMuscle,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TypeViewState();
}

class _TypeViewState extends ConsumerState<TypeView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => ref
        .read(_fitnessProvider.notifier)
        .getNameImage(widget.selectedMuscle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedMuscle.toUpperCase()),
      ),
      body: _MyNameListView(),
    );
  }
}

class _MyNameListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNameImage = ref.watch(_fitnessProvider).nameImage;
    return ListView.builder(
      itemCount: getNameImage?.length,
      itemBuilder: (context, index) {
        //  final exercise = filterExercises[index];
        //  print('${exercise.muscle} hata burada');
        return Card(
          color: ColorConstans.cardColor,
          elevation: 10,
          child: ListTile(
            contentPadding: context.paddingNormal,
            onTap: () {
              debugPrint(
                  '${getNameImage?[index].name}   name buradadad boş 13123213213213');
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                getNameImage?[index].imageUrl ?? StringConstants.tempImage,
                fit: BoxFit.cover,
              ),
            ),
            trailing: Text(
              '${getNameImage?[index].name}',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstans.cardTextColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
