import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:tmg/modules/home/presenter/home_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => HomeProvider(),
      child: _HomeProviderBody(),
    );
  }
}

class _HomeProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeProviderBodyState();
  }
}

class _HomeProviderBodyState extends State<_HomeProviderBody> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (_, HomeProvider myProvider, child) {
      return  Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// goodDeal logo
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50,),
              child: Image.asset(
                'assets/images/launcher_icon.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// banner img
                     Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        height: 200,
                        child: Swiper(
                          scrollDirection: Axis.horizontal,
                          autoplay: true,
                          containerWidth: MediaQuery.of(context).size.width,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 20),
                                    child: Image.asset(
                                     myProvider.images[index],
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height /
                                          5,
                                    ),
                                  );
                          },
                          itemCount: myProvider.images.length,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      );
    });
  }
}
