import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tok_toi_game/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> gridList = [
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
  ];
  int playerX = 0;
  int playerO = 0;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Tic Tok Toe"),
        actions: [
          Row(
            children: [
              (themeProvider.isDarkTheme)
                  ? Text(
                      "Dark  ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  : Text(
                      "Light  ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
              CupertinoSwitch(
                  value: themeProvider.isDarkTheme,
                  onChanged: (changed) {
                    themeProvider.themeProvider();
                  }),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          //  Winner Table Start
          Container(
            color: Theme.of(context).highlightColor,
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Winner Table",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                TableCell(
                    child: Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    "Player X",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )),
                TableCell(
                    child: Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    "Player O",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ))
              ]),
              TableRow(children: [
                TableCell(
                    child: Text(
                  "$playerX",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
                TableCell(
                    child: Text(
                  "$playerO",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ))
              ])
            ],
          ),

          //  Winner Table End

          //   Grid View is starting here
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () => playXorO(index),
                    child: Container(
                      color: Theme.of(context).colorScheme.onBackground,
                      alignment: Alignment.center,
                      child: Text(
                        gridList[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                }),
          ),
          //   Grid View is starting end
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).highlightColor),
              onPressed: () => onPlayAgain(),
              icon: Icon(
                Icons.refresh,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: Text(
                "Play Again",
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Theme.of(context).highlightColor),
                onPressed: () => resetFun(),
                icon: Icon(
                  CupertinoIcons.refresh_circled,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  "Reset",
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    getWinnersData();
    super.initState();
  }

  void onPlayAgain() {
    setState(() {
      gridList = [
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
      ];
    });
  }

  String currentPlayer = "X";
  void playXorO(int i) {
    if (gridList[i] == "-") {
      setState(() {
        gridList[i] = currentPlayer;
        currentPlayer = currentPlayer == "X" ? "O" : "X";
      });
      findWinner(gridList[i]);
    }
  }

  bool checkMove(i1, i2, i3, sign) {
    if (gridList[i1] == sign && gridList[i2] == sign && gridList[i3] == sign) {
      return true;
    } else {
      return false;
    }
  }

  void findWinner(currentSign) {
    if (checkMove(0, 1, 2, currentSign) ||
            checkMove(3, 4, 5, currentSign) ||
            checkMove(6, 7, 8, currentSign) || //check for row
            checkMove(0, 3, 6, currentSign) ||
            checkMove(1, 4, 7, currentSign) ||
            checkMove(2, 5, 8, currentSign) || // check for column
            checkMove(0, 4, 8, currentSign) ||
            checkMove(2, 4, 6, currentSign) //check for digonal
        ) {
      log("sign of $currentSign won");
      if (currentSign == "X") {
        setState(() {
          playerX = playerX + 1;
        });
      }
      if (currentSign == "O") {
        setState(() {
          playerO = playerO + 1;
        });
      }

      onPlayAgain();
    }
    setWinnerData(playerX, playerO);
  }

  getWinnersData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    int? player1 = preferences.getInt("playerX");
    int? player2 = preferences.getInt("playerO");
    if (player1 != null && player2 != null) {
      setState(() {
        playerX = player1;
        playerO = player2;
      });
    }
  }

  setWinnerData(int player1, int player2) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("playerX", player1);
    preferences.setInt("playerO", player2);
  }

  void resetFun() {
    setWinnerData(0, 0);
    onPlayAgain();
    setState(() {
      playerO = 0;
      playerX = 0;
    });
  }
}
