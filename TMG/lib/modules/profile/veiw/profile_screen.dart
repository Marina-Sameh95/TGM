
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/modules/profile/presenter/profile_provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<ProfileProvider>(
        create: (_) => ProfileProvider(),
        child: _ProfileProviderBody(),
      ),
    );
  }
}

class _ProfileProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileProviderBodyState();
  }
}

class _ProfileProviderBodyState extends State<_ProfileProviderBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (_, ProfileProvider myProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        /// user image
                        Center(
                          child: Container(
                            width: 125,
                            height: 100,
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset('assets/images/userImg.png',
                                    height: 70, width: 70, fit: BoxFit.fitHeight),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        ///fullName
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color:MyColors.textFieldBackground,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                    border: Border.all(
                                        width: 2,
                                        color: MyColors.textFieldBackground)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                       "الاسم بالكامل",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color:  MyColors.primaryColor,
                                        fontSize:16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                       'Marina Sameh',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: MyColors.petroleumColor,
                                        fontSize:15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ///email
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: MyColors.textFieldBackground,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                    border: Border.all(
                                        width: 2,
                                        color: MyColors.textFieldBackground)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "بريد إلكتروني",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color:  MyColors.primaryColor,
                                        fontSize:16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'marina@gmail.com',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: MyColors.petroleumColor,
                                        fontSize:15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ///Mobile Number
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: MyColors.textFieldBackground,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                    border: Border.all(
                                        width: 2,
                                        color: MyColors.textFieldBackground)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "رقم الهاتف المحمول",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color:  MyColors.primaryColor,
                                        fontSize:16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '01016292515',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: MyColors.petroleumColor,
                                        fontSize:15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ///address
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: MyColors.textFieldBackground,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                    border: Border.all(
                                        width: 2,
                                        color: MyColors.textFieldBackground)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "العنوان",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: MyColors.primaryColor,
                                        fontSize:16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '8street miami,Alex',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: MyColors.petroleumColor,
                                        fontSize:15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
