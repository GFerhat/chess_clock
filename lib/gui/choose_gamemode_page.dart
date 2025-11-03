import 'package:flutter/material.dart';

class ChooseGamemodePage extends StatefulWidget {
  @override
  _ChooseGamemodePageState createState() => _ChooseGamemodePageState();
}

class _ChooseGamemodePageState extends State<ChooseGamemodePage>
    with TickerProviderStateMixin {
  int? openedBarIndex;

  void toggleBar(int index) {
    setState(() {
      if (openedBarIndex == index) {
        openedBarIndex = null; // schließen
      } else {
        openedBarIndex = index; // öffnen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> gamemode = ['BULLET', 'BLITZ', 'RAPID', 'CLASSICAL'];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('G A M E   M O D E'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              final isOpen = openedBarIndex == index;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => toggleBar(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeInOut,
                      color: isOpen ? Colors.blue[400] : Colors.black,
                      height: 120,
                      child: Center(
                        child: Text(
                          '${gamemode[index]}',
                          textScaler: TextScaler.linear(2),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeInOut,
                    child: isOpen
                        ? GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  '1',
                                  textScaler: TextScaler.linear(2),
                                ),
                              ),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  '2',
                                  textScaler: TextScaler.linear(2),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  '3',
                                  textScaler: TextScaler.linear(2),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
