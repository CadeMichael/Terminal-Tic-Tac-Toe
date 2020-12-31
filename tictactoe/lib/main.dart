import 'package:flutter/material.dart';

void main() => runApp(Game());

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameState();
  }
}

class _GameState extends State<Game> {
  // variables
  var board = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  ];
  int turn = 0;
  String message = "o's turn";
  bool over = false;

  // methods
  void messenger() {
    if (this.turn % 2 == 0) {
      this.message = ("o's turn");
    } else {
      this.message = ("x's turn");
    }
  }

  void winner() {
    String player;
    if (this.turn % 2 == 0) {
      player = "o";
    } else {
      player = "x";
    }
    int x = 0;
    while (x < 3) {
      if (board[x] == player &&
          board[x + 3] == player &&
          board[x + 6] == player) {
        this.message = "victory for " + player;
        this.over = true;
      }
      x += 1;
    }

    int y = 0;
    while (y < 7) {
      if (board[y] == player &&
          board[y + 1] == player &&
          board[y + 2] == player) {
        this.message = "victory for " + player;
        this.over = true;
      }
      y += 3;
    }

    int z = 0;
    if (board[z] == player &&
        board[z + 4] == player &&
        board[z + 8] == player) {
      this.message = "victory for " + player;
      this.over = true;
    }

    z = 6;
    if (board[z] == player &&
        board[z - 2] == player &&
        board[z - 4] == player) {
      this.message = "victory for " + player;
      this.over = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    void choose(int pos) {
      setState(() {
        if (over == false) {
          if (this.turn % 2 == 0 && board[pos] == " ") {
            board[pos] = "o";
          } else if (board[pos] == " ") {
            board[pos] = "x";
          }
        }
        winner();
        if (over == false) {
          this.turn += 1;
          print(turn);
          messenger();
        }
      });
    }

    void reset() {
      setState(() {
        this.turn = 0;
        this.over = false;
        this.board = [
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
        ];
        this.message = "o's turn";
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Tic-Tac-Toe',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[0],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(0),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[1],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(1),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[2],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(2),
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[3],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(3),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[4],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(4),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[5],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(5),
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[6],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(6),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[7],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(7),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(16.0),
                      shape: CircleBorder(),
                      splashColor: Colors.red,
                      child: Text(
                        board[8],
                        textScaleFactor: 2.5,
                      ),
                      onPressed: () => {
                        choose(8),
                      },
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(32),
                child: Text(
                  message,
                  textScaleFactor: 2,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  shape: CircleBorder(),
                  splashColor: Colors.red,
                  padding: const EdgeInsets.all(24),
                  color: Colors.blue,
                  child: Icon(
                    Icons.replay,
                  ),
                  onPressed: reset,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}