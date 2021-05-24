//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_app/model/movies.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




//------------------------- MOVIE CLASS -------------------------//
class MovieView extends StatefulWidget {

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  //---------------------- MOVIE CLASS VAR'S & FUNCTIONS ---------------------//
  final List movies = [
    "Avatar",
    "I Am Legend",
    "300",
    "The Avengers",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Gotham",
    "Power",
    "Narcos",
    "Breaking Bad"
  ];

  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.grey : Colors.blueGrey,
        ),
      );
    },
  );

  Widget aboutPage(Movie movie){
    return Scaffold(
      appBar: AppBar(
        title: Text('${movie.title}'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  spinkit,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                          image: NetworkImage('${movie.images[1]}'),
                      fit: BoxFit.fill)
                    ),
                  ),
                  Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.white,
                  size: 70.0,),
                  Container(
                    margin: EdgeInsets.only(top: 168.0),
                    height: 50.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white38, Colors.white],
                        )
                    ),
                  ),

                ],

              ),
            ],

          ),
          Divider(
              color: Colors.white,
            thickness: 1.0,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  margin: EdgeInsets.only(left: 5.0),
                    width: MediaQuery.of(context).size.width / 4,
                  height: 200.0,
                    // height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(movie.images.last)
                        )
                    ),
                    alignment: Alignment.bottomCenter, // This aligns the child of the container

                ),
              ),
              SizedBox(width: 20.0),
              Container(
                height: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Year : ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),),
                      Text('Genre : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                        ),),
                      Text('Director : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                        ),),
                      Text('Country : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                        ),),
                      Text('Language : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                        ),),
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                  height: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${movie.year}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                        ),),
                      Text('${movie.genre}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                        ),),
                      Text('${movie.director}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                        ),),
                      Text('${movie.country}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                        ),),
                      Text('${movie.language}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                        ),),
                    ],
                  )),
            ],
          ),
          Divider(
            color: Colors.white,
            thickness: 1.0,
          ),
          Text('Plot :',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${movie.plot}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontStyle: FontStyle.italic
            ),),
          )
        ],
      )
    );
  }


//------------------------- MOVIE CLASS ACTION START -------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie APP'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
            return Stack(
              children: [Card(
                margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(Movie.getMovies()[index].images[0])
                                )
                            ),
                              alignment: Alignment.bottomCenter, // This aligns the child of the container
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.01), //some spacing to the child from bottom
                                  child: Container(color: Colors.black54,
                                    margin: EdgeInsets.symmetric(horizontal: 0.1),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50.0,
                                    child: Text('${Movie.getMovies()[index].title}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40.0),
                                    ),
                                  ),
                              )
                          ),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => aboutPage(Movie.getMovies()[index]),));
                      });
                    },
                  ),

                ],
              ),
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       radius: 25.0,
              //       backgroundImage:
              //       NetworkImage("${Movie.getMovies()[index].images[0]}"),
              //       backgroundColor: Colors.transparent,
              //     ),
              //     tileColor: Colors.green,
              //       title: Center(
              //         child: Text('${movies[index]}',style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20.0,
              //           fontStyle: FontStyle.italic,
              //         ),),
              //       ),
              //     selected: index == _selectedIndex,
              //     onTap: () {
              //       setState(() {
              //         _selectedIndex = index;
              //         Navigator.push(context,
              //             MaterialPageRoute(
              //                 builder: (context) => aboutPage(Movie.getMovies()[index]),));
              //       });
              //     },
              // )
              ),
                // Container(
                //   color: Colors.black54,
                //   alignment: Alignment.bottomCenter,
                //   margin: EdgeInsets.symmetric(horizontal: 10.0),
                //   height: 50.0,
                //  child: Text('${Movie.getMovies()[index].title}',
                //    style: TextStyle(
                //      color: Colors.white,
                //      fontSize: 40.0
                //    ),),
                // ),
            ]
            );

          }),
    );
  }
}








//------------------------- PREVIOUS CLASS EXAMPLES -------------------------//
class TipCounter extends StatefulWidget {
  @override
  _TipCounterState createState() => _TipCounterState();
}

class _TipCounterState extends State<TipCounter> {
  double _currentSliderValue = 20;
  int _peopleCount = 1;
  var _tip = 0.0.toStringAsFixed(2);
  double _billAmount;
  var _totalPerPerson = 0.0.toStringAsFixed(2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tip Counter'), centerTitle: true,),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(16.0),
          children: [
            Container(
              width: 80.0,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(13.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total Per Person',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('\$ $_totalPerPerson',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),//Upper Card
            Container(
              margin: EdgeInsets.only(top: 15.0),
              width: 80.0,
              height: 220.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(13.0),),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextField(
                      onSubmitted: (String txt){
                        try {
                          _billAmount = double.parse(txt);
                        } on Exception catch (_) {
                        print("throwing new error");
                        }
                      },
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        prefixText: 'Bill Amount \$',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Split',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0,
                        ),),

                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10.0),
                              alignment: Alignment.center,
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(7.0),),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(_peopleCount != 1){
                                      _peopleCount--;
                                    }
                                  });
                                },
                                  child: Text('-',
                                  style: TextStyle(
                                    fontSize: 30.0
                                  ),),
                                ),
                            ),
                            Container(
                              child: Text('$_peopleCount'),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              alignment: Alignment.center,
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(7.0),),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    _peopleCount++;
                                  });
                                },
                                child: Text('+'),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tip',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17.0,
                          ),),

                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                            child: Text('\$ $_tip',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20.0,
                            ),),)


                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    alignment: Alignment.center,
                    child: Text(
                      '${_currentSliderValue.toInt()} %',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                  Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      activeColor: Colors.deepPurple,
                      inactiveColor: Colors.purple.shade100,
                      onChanged: (double value){
                    setState(() {
                      _currentSliderValue = value;
                      var res = _currentSliderValue / 100 * _billAmount;
                      _tip = res.toStringAsFixed(2);
                      var totalBill = _billAmount + res;
                      totalBill = totalBill / _peopleCount;
                      _totalPerPerson = totalBill.toStringAsFixed(2);
                    });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int trigger = 1;
  List quotes = [
    "Life isn’t about getting and having, it’s about giving and being.",
    "Whatever the mind of man can conceive and believe, it can achieve.",
    "Strive not to be a success, but rather to be of value.",
    "You miss 100% of the shots you don’t take.",
    "I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. "
        "26 times I’ve been trusted to take the game winning shot and missed."
        " I’ve failed over and over and over again in my life. "
        "And that is why I succeed.",
    "The most difficult thing is the decision to act, the rest is merely tenacity.",
    "Every strike brings me closer to the next home run.",
    "Definiteness of purpose is the starting point of all achievement.",
    "We become what we think about.",
    "Life is 10% what happens to me and 90% of how I react to it.",
    "Your time is limited, so don’t waste it living someone else’s life."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(quotes[trigger]),
            TextButton(onPressed: _nextQuote, child: Icon(Icons.next_plan))
          ],
        ),
      )),
    );
  }

  void _nextQuote() {
    setState(() {
      trigger += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Biz Card'),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.6),
                      spreadRadius: 9,
                      blurRadius: 8,
                      offset: Offset(1.0, 3.0), // changes position of shadow
                    ),
                  ],
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  border: Border.all(color: Colors.pinkAccent, width: 2.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kemal Kalandarov',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'kemal\'s Blog',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.six_ft_apart),
                      Text('ASD'),
                      Text('@buildAppWithME'),
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
}

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      appBar: AppBar(
        title: Text('Salam'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              icon: Icon(Icons.email), onPressed: () => print(' Email Tapped'))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.airport_shuttle_sharp), label: 'First'),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_outlined), label: 'Second'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_sharp), label: 'Third'),
        ],
        onTap: (int index) => print('$index'),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            'Salam',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.orange,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.pinkAccent.shade100,
              borderRadius: BorderRadius.circular(8.0)),
          child: Text('Button')),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlueAccent,
      child: Center(
          child: Text(
        'Salam World!',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 35.0,
        ),
      )),
    );
  }
}

