import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lat3/bloc/color_bloc.dart';
import 'package:flutter_bloc_lat3/bloc/counter_bloc.dart';
import 'package:flutter_bloc_lat3/screens/second_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Multiprovider Bloc",
              style: GoogleFonts.lato(),
            ),
            backgroundColor: color,
            // backgroundColor: Colors.teal,
          ),
          body: Container(
            width: double.infinity,
            color: color,
            // color: Colors.blue,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, int>(
                  builder: (context, number) {
                    return Text(
                      number.toString(),
                      style: GoogleFonts.lato(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) {
                        return SecondPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: color,
                    // primary: Colors.teal,
                    minimumSize: Size(150, 50),
                  ),
                  child: Text(
                    "Press Me",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
