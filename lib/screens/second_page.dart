import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lat3/bloc/color_bloc.dart';
import 'package:flutter_bloc_lat3/bloc/counter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context, listen: false);
    CounterBloc counterBloc =
        BlocProvider.of<CounterBloc>(context, listen: false);

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
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, int>(
                  builder: (context, number) {
                    return GestureDetector(
                      onTap: () {
                        counterBloc.add(number +1);
                      },
                      child: Text(
                        number.toString(),
                        style: GoogleFonts.lato(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        colorBloc.add(ColorEvent.to_teal);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                      ),
                    ),
                    SizedBox(width: 30),
                    InkWell(
                      onTap: () {
                        colorBloc.add(ColorEvent.to_orange);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 30),
                    InkWell(
                      onTap: () {
                        colorBloc.add(ColorEvent.to_purple);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
