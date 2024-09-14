import 'package:flutter/material.dart';
import 'package:moody/helper/apptheme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:moody/variables/util_variables.dart';

class StatsWindow extends StatelessWidget {
   StatsWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.all(16.o),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.o),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset:  const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Статистика',
            style: theme.primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.o,
              color:  const Color(0xff4C4C69),
            ),
          ),
           SizedBox(height: 20.o),
          _buildStatCard(
            title: 'Стресс за месяц',
            value: 'Средний уровень стресса: 4.2',
            icon: Icons.trending_up,
          ),
           SizedBox(height: 16.o),
          _buildStatCard(
            title: 'Среднее настроение',
            value: 'Среднее настроение: Спокойствие',
            icon: Icons.sentiment_satisfied,
          ),
           SizedBox(height: 16.o),
          _buildStatCard(
            title: 'Самооценка',
            value: 'Средняя самооценка: 3.8',
            icon: Icons.thumb_up,
          ),
           SizedBox(height: 20.o),
      Container(
        width: double.infinity,
        padding:  EdgeInsets.all(16.o),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.o),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset:  const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Диаграмма',
              style: theme.primaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.o,
                color:  const Color(0xff4C4C69),
              ),
            ),
             SizedBox(height: 20.o),
            _buildGraphCard(
              title: 'Стресс за месяц',
              data: [3, 5, 2, 6, 4, 7, 3], // Example data
            ),
             SizedBox(height: 16.o),
            _buildGraphCard(
              title: 'Самооценка',
              data: [4, 6, 5, 7, 6, 8, 5], // Example data
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }




  Widget _buildStatCard({required String title, required String value, required IconData icon}) {
    return Container(
      padding:  EdgeInsets.all(12.o),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.o),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset:  const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blueAccent,
            size: 32.o,
          ),
           SizedBox(width: 12.o),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.primaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.o,
                  ),
                ),
                 SizedBox(height: 4.o),
                Text(
                  value,
                  style: theme.primaryTextStyle.copyWith(
                    fontSize: 16.o,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildGraphCard({required String title, required List<double> data}) {
    return Container(
      padding:  EdgeInsets.all(12.o),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.o),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset:  const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: theme.primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.o,
            ),
          ),
           SizedBox(height: 8.o),
          SizedBox(
            height: 200.o,
            child: LineChart(
              LineChartData(
                gridData:  const FlGridData(show: false),
                titlesData:  const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: data.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                    isCurved: true,
                    color: Colors.blueAccent,
                    dotData:  const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );}}
