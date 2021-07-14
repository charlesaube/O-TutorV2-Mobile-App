import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/Category.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/Impl/category_service.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/quiz/blocs/category_bloc.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/quiz/widget/error_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BrowseCategoryPage extends StatefulWidget {
  @override
  _BrowseCategoryState createState() {
    return _BrowseCategoryState();
  }
}

class _BrowseCategoryState extends State<BrowseCategoryPage> {
  CategoryBloc? _bloc;
  final ServiceProvider _serviceProvider = new ServiceProvider();
  late final CategoryService _categoryService;

  _BrowseCategoryState() {
    this._categoryService = _serviceProvider.getCategoryService();
  }

  @override
  void initState() {
    super.initState();
    _bloc = CategoryBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -600,
            right: -350,
            child: CustomPaint(
              size: Size(370, (360 * 1.6666666666666667).toDouble()),
              painter: RPSCustomPainter180(),
            ),
          ),
          RefreshIndicator(
            onRefresh: () => _bloc!.getCategories(),
            child: StreamBuilder<ApiResponse<List<Category>>>(
                stream: _bloc!.categoryListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data!.status) {
                      case Status.LOADING:
                        return SpinKitDoubleBounce(
                            color: Colors.lightBlue.shade100);
                        break;
                      case Status.COMPLETED:
                        // return SingleChildScrollView(
                        //   child: Column(
                        //     children: <Widget>[
                        //       Container(
                        //         child: Column(
                        //           children: <Widget>[
                        //             HeaderCategory("Category"),
                        //             ListView.builder(
                        //               scrollDirection: Axis.vertical,
                        //               shrinkWrap: true,
                        //               physics: BouncingScrollPhysics(),
                        //               itemCount: _categoryService
                        //                   .getAllCategory()
                        //                   .length,
                        //               itemBuilder: (
                        //                 BuildContext context,
                        //                 int index,
                        //               ) {
                        //                 return GestureDetector(
                        //                   onTap: () {
                        //                     print(_categoryService
                        //                         .getAllCategory()[index]
                        //                         .name);
                        //                     Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                         builder: (context) =>
                        //                             BrowseQuizPage(
                        //                                 category: _categoryService
                        //                                         .getAllCategory()[
                        //                                     index]),
                        //                       ),
                        //                     );
                        //                   },
                        //                   child: CategoryListContainer(
                        //                       _categoryService
                        //                           .getAllCategory()[index]
                        //                           .name,
                        //                       _categoryService
                        //                           .getAllCategory()[index]
                        //                           .icon),
                        //                 );
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
                        break;
                      case Status.ERROR:
                        return ErrorPopUp(snapshot);
                        break;
                    }
                  }
                  return Container();
                }),
          ),
        ],
      )),
    );
  }
}
