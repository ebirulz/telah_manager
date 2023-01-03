import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../util/colors.dart';
import '../model/PlanModal.dart';

class CustomPricePlan extends StatefulWidget {
  const CustomPricePlan({Key? key}) : super(key: key);

  @override
  _CustomPricePlanState createState() => _CustomPricePlanState();
}

class _CustomPricePlanState extends State<CustomPricePlan> {
  int selectIndex = 0;
  List<PlanModal> planPageViewList = [];
  Color color = white;
  Color testTextColor = Colors.blue;
  Color doubtsTextColor = Colors.red;

  PageController controller = PageController(viewportFraction: 0.7);
  Color containerAdvanced = Color(0xFFEAA954);
  double viewPortFraction = 0.5;
  Color selectedContainerColor = Color(0xFFF0C05B);
  int _index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }
  Future<void> init() async {
    planPageViewList.add(
      PlanModal(
        title: 'Learn',
        subTitle: 'Unlimited access to video \nlectures adaptive practice.',
        price: 'NGN 31,200',
        planPriceSubTitle: '12months/ Upto Apr 19',
        optionList: [
          PlanModal(title: '8 Property units', isAvailable: true, isImportant: false),
          PlanModal(title: '2 Agents', isAvailable: true, isImportant: false),
          PlanModal(title: '2 Agents', isAvailable: true, isImportant: false),
        ],
        containerColor: containerAdvanced.withOpacity(0.9),
        icon: Icons.add_to_photos_sharp,
        planTitleColor: containerAdvanced,
        iconColor: containerAdvanced,
      ),
    );
    planPageViewList.add(
      PlanModal(
        title: 'Tests ',
        subTitle: 'Create Custom challanges invite friends and access test reports',
        price: 'NGN 15,600',
        planPriceSubTitle: '12months/ Upto Apr 19',
        planTitleColor: testTextColor,
        icon: Icons.add_to_photos_sharp,
        iconColor: testTextColor,
        optionList: [
          PlanModal(title: '8 Property units', isAvailable: true, isImportant: false),
          PlanModal(title: '2 Agents', isAvailable: true, isImportant: false),
          PlanModal(title: '2 Agents', isAvailable: true, isImportant: false),
        ],
      ),
    );
    planPageViewList.add(
      PlanModal(
        title: 'Doubts',
        subTitle: 'Get unlimited doubts solved via chat with our subjects experts ',
        price: 'NGN 15,600',
        planPriceSubTitle: '12months/ Upto Apr 19',
        icon: Icons.chat_bubble,
        iconColor: doubtsTextColor,
        planTitleColor: doubtsTextColor,
        optionList: [
          PlanModal(title: '8 Property units', isAvailable: true, isImportant: false),
          PlanModal(title: '2 Agents', isAvailable: true, isImportant: false),
          PlanModal(title: '2 Agents', isAvailable: true, isImportant: false),
        ],
      ),
    );

    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: planPageViewList.length,
      onPageChanged: (i) {
        _index = i;
        setState(() {});
      },
      itemBuilder: (BuildContext context, int index) {
        bool isMyPageIndex = selectIndex == index;
        PlanModal data = planPageViewList[index];

        return AnimatedContainer(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          height: _index == index ? context.height() * 0.55 : context.height() * 0.50,
          padding: EdgeInsets.all(24),
          decoration: boxDecorationDefault(
            color: selectIndex == index ? AppColors.defaultBlue.withOpacity(0.3) : context.cardColor,
            boxShadow: defaultBoxShadow(),
            borderRadius: radius(defaultRadius),
          ),
          duration: 1000.milliseconds,
          curve: Curves.linearToEaseOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            planPageViewList[index].title.validate(),
                            style: boldTextStyle(size: 26, color: isMyPageIndex ? Colors.white : planPageViewList[index].planTitleColor),
                          ).expand(),
                          Icon(
                            planPageViewList[index].icon,
                            color: isMyPageIndex ? white : planPageViewList[index].iconColor,
                          ),
                        ],
                      ),
                      8.height,
                    Text(planPageViewList[index].price.validate(), style: boldTextStyle(size: 23, color: isMyPageIndex ? white : textPrimaryColorGlobal)),
                    ],
                  ).expand(),
                ],
              ),
              32.height,
              ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.optionList!.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Text(
                      data.optionList![index].title.validate(),
                      style: primaryTextStyle(
                          size: 16,
                          weight: data.optionList![index].isImportant! ? FontWeight.bold : FontWeight.normal,
                          decoration: !data.optionList![index].isAvailable! ? TextDecoration.lineThrough : TextDecoration.none,
                          color: !data.optionList![index].isAvailable! ? Colors.grey.shade500 : textPrimaryColorGlobal),
                    ),
                  );
                },
              ).expand(),


              16.height,
              Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  width: context.width(),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextIcon(
                    prefix: isMyPageIndex ? Icon(Icons.check, color: Colors.white, size: 16) : null,
                    text: isMyPageIndex ? 'Selected Plan' : 'Select Plan',
                    textStyle: primaryTextStyle(size: 16, color: isMyPageIndex ? Colors.white : white),
                  ),
                  onTap: () {
                    setState(() {});
                    selectIndex = index;
                  },
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                  color: AppColors.defaultBlue,
                ),
              ),
            ],
          ),
        ).center();
      },
    );
  }
}
