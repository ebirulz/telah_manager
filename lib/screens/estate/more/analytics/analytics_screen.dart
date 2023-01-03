import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../widgets/app_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen>with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Analytics Report',),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.defaultBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: AppColors.defaultBlue,
                ),
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: AppColors.borderLine.withOpacity(0.8),
                tabs: [
                  Tab(
                    text: 'Revenue',
                  ),
                  Tab(
                    text: 'Expenses',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //Tab one content
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildDefaultLineChart()
                          ],
                        ),
                      ),
                    ),

                    // Tab two content
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      /*title: ChartTitle(
          text: 'Inflow Analytics\n',
          textStyle: TextStyle(fontSize: 16),
          alignment: ChartAlignment.center),*/
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines:
          const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(2005, 21, 28),
      _ChartData(2006, 24, 44),
      _ChartData(2007, 36, 48),
      _ChartData(2008, 38, 50),
      _ChartData(2009, 54, 66),
      _ChartData(2010, 57, 78),
      _ChartData(2011, 70, 84)
    ];
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Inflow',
          markerSettings: const MarkerSettings(isVisible: true)),
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);

  final double x;
  final double y;
  final double y2;
}
