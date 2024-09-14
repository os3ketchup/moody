import 'package:flutter/material.dart';
import 'package:moody/helper/apptheme.dart';
import 'package:moody/screens/widgets/evaluate_slider.dart';
import 'package:moody/screens/widgets/mood_item.dart';
import 'package:moody/variables/icons.dart';
import 'package:moody/variables/util_variables.dart';

class DiaryMoodWindow extends StatefulWidget {
  const DiaryMoodWindow({super.key});

  @override
  State<DiaryMoodWindow> createState() => _DiaryMoodWindowState();
}

class _DiaryMoodWindowState extends State<DiaryMoodWindow> {
  final controller = TextEditingController();
  final moodMap = {
    "Радость": {
      Images.happiness: [
        "Возбуждение",
        "Восторг",
        "Игривость",
        "Наслаждение",
        "Очарование",
        "Осознанность",
        "Смелость",
        "Удовольствие",
        "Чувственность",
        "Энергичность",
        "Экстравагантность"
      ]
    },
    "Страх": {
      Images.fear: [
        "Беспокойство",
        "Тревога",
        "Паника",
        "Неуверенность",
        "Ужас",
        "Опасение",
        "Волнение",
        "Нервозность",
        "Оцепенение",
        "Подозрительность"
      ]
    },
    "Бешенство": {
      Images.rabid: [
        "Ярость",
        "Злоба",
        "Ненависть",
        "Раздражение",
        "Агония",
        "Озлобленность",
        "Презрение",
        "Гнев",
        "Враждебность",
        "Возмущение"
      ]
    },
    "Грусть": {
      Images.sadness: [
        "Одиночество",
        "Печаль",
        "Уныние",
        "Меланхолия",
        "Тоска",
        "Разочарование",
        "Потеря",
        "Сожаление",
        "Тревожность",
        "Ностальгия"
      ]
    },
    "Спокойствие": {
      Images.silence: [
        "Уравновешенность",
        "Расслабленность",
        "Согласие",
        "Мир",
        "Удовлетворение",
        "Непоколебимость",
        "Гармония",
        "Сосредоточенность",
        "Уверенность",
        "Примирение"
      ]
    },
    "Сила": {
      Images.strength: [
        "Уверенность",
        "Решительность",
        "Отвага",
        "Целеустремленность",
        "Напор",
        "Выносливость",
        "Непобедимость",
        "Воля",
        "Достоинство",
        "Непоколебимость"
      ]
    }
  };

  String? selectedMood;
  String? selectedEmotion;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        sizeVer(20.o),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.o, vertical: 12.o),
          child: Text(
            textAlign: TextAlign.start,
            'Что чувствуешь?',
            style: theme.primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xff4C4C69),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 14.o),
          width: double.infinity,
          height: 160.o,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: moodMap.entries.map((entry) {
              // Extract the image path and emotions
              final imagePath = entry.value.keys.first; // The image path key
              final emotions = entry.value[imagePath]!; // The emotion list
              return MoodItem(
                name: entry.key,
                image: imagePath,
                // Pass the image path directly
                isSelected: selectedMood == entry.key,
                onTap: () {
                  setState(() {
                    selectedMood = entry.key; // Update the selected mood
                    selectedEmotion = null; // Clear selected emotion
                  });
                },
                emotions: emotions, // Pass the list of emotions
              );
            }).toList(),
          ),
        ),
        sizeVer(20.o),

        // Display the emotions as chips if a mood is selected
        if (selectedMood != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.o),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: moodMap[selectedMood]!.values.first.map((emotion) {
                final isSelected = selectedEmotion == emotion;
                return RawChip(
                  side: BorderSide.none,
                  shadowColor: Colors.grey,
                  elevation: 1.o,
                  backgroundColor: isSelected ? Colors.orange : Colors.white,
                  label: Text(
                    emotion,
                    style: theme.primaryTextStyle.copyWith(
                      color: isSelected
                          ? Colors.white
                          : theme.primaryTextStyle.color,
                    ),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedEmotion = emotion;
                      } else {
                        selectedEmotion = null;
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
        sizeVer(20.o),
        // Replace these sliders with new widgets

        // Evaluate sliders
        EvaluateSlider(
          selectedMood: selectedMood,
          title: 'Уровень стресса',
          startLabel: 'Низкий',
          endLabel: 'Высокий',
        ),
        sizeVer(20.o),
        EvaluateSlider(
          selectedMood: selectedMood,
          title: 'Самооценка',
          startLabel: 'Неуверенность',
          endLabel: 'Уверенность',
        ),
        sizeVer(20.o),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.o, vertical: 6.o),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.o),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0.1,
                offset: const Offset(4, 1),
                blurRadius: 10,
              ),
            ],
          ),
          padding: EdgeInsets.all(18.o),
          child: TextField(
            controller: controller,
            cursorColor: const Color(0xff4C4C69),
            minLines: 5,
            maxLines: 5,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Введите заметку',
              hintStyle: theme.primaryTextStyle.copyWith(
                color: const Color(0xffBCBCBF),
              ),
            ),
            style: theme.primaryTextStyle,
          ),
        ),
        sizeVer(20.o),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.o),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: theme.orange),
            onPressed: selectedMood != null
                ? () {
                    // Create the SnackBar
                    const snackBar = SnackBar(
                      content: Text('Сохронена'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                      selectedMood = null;
                    });
                    controller.clear();
                  }
                : null,
            child: Container(
              padding: EdgeInsets.all(8.o),
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.center,
                'Сохранить',
                style: theme.primaryTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
