import 'package:first_app/model/question.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("The usadcvksd", true),
    Question.name("The usadcvksdakjncj asdc", false),
    Question.name("The usadcvksdkasc adc", true),
    Question.name("The usadcvksdauhc  dc", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
//        backgroundColor: Colors.blueGrey,
      ),
//      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                        color: Colors.blueGrey.shade200,
                        style: BorderStyle.solid)),
                height: 120.0,
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                            questionBank[_currentQuestionIndex].questionText))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    child: Icon(Icons.arrow_back),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    child: Text("True"),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    child: Text("False"),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    child: Icon(Icons.arrow_forward),
                  )
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint("Yes Correct");
      final snackBar = SnackBar(
        content: Text("Correct"),
        backgroundColor: Colors.greenAccent.shade700,
        duration: Duration(milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _nextQuestion();
    } else {
      debugPrint("Incorrect");
      final snackBar = SnackBar(
        content: Text("Incorrect"),
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex=(_currentQuestionIndex+1)%questionBank.length;
    });
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex=(_currentQuestionIndex-1)%questionBank.length;
    });
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPrecentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent.shade100,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person"),
                    Text(
                        "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPrecentage)}")
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        hintText: 'Bill Amount',
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split"),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.purpleAccent.shade100),
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text("$_personCounter"),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.purpleAccent.shade100),
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Tip"),
                        Text(
                            "\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPrecentage).toStringAsFixed(2)}")
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text("$_tipPrecentage %"),
                      Slider(
                        min: 0,
                        max: 100,
                        divisions: 10,
                        activeColor: Colors.purpleAccent.shade100,
                        value: _tipPrecentage.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            _tipPrecentage = newValue.round();
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;

  List quote = [
    "dcn",
    "dvnskd",
    "dncsj ",
    "wbcsdnidn",
    "sajcbsa",
    "sdmvsk",
    "sdjnksd",
    "mdcod"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text(quote[_index % quote.length])),
            Divider(
              thickness: 3,
            ),
            FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.greenAccent,
                icon: Icon(Icons.wb_sunny),
                label: Text("Inspire me!")),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index++;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Shubham"),
          Text("donothavewebsite.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("T:@shubham100ev")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200/300"))),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello Again"),
          backgroundColor: Colors.pinkAccent,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () => debugPrint("Email"),
          ),
          IconButton(
            icon: Icon(Icons.alarm_add),
            onPressed: () => debugPrint("Tapped"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.call_missed),
        onPressed: null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Frist")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("Second")),
        ],
        onTap: (int index) => debugPrint("Tapped item : $index"),
      ),
      body: Center(
        child: CustomButton(),
//        child: InkWell(
//            child: Text("Hello here"),
//        ),
      ),
    );

//    return Material(
//      color: Colors.blueGrey,
//      child: Center(
//          child: Text("Hello Flutter",
//            textDirection: TextDirection.ltr,)
//      ),
//    );

//    return Center(
//      child: Text("Hello Flutter",
//          textDirection: TextDirection.ltr,),
//    );
  }
}
