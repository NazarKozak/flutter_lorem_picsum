import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem_picsum/core/config/app_constants.dart';
import 'package:flutter_lorem_picsum/core/service/service.dart';

import 'package:flutter_lorem_picsum/modules/modules.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => PictureListCubit(repository: PictureListRepository(ApiService())),
        child: const PicturesListScreen(),
      )
    );
  }
}