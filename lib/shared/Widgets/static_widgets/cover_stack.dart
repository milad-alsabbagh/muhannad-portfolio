import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import '../animated_widgets/animated_text.dart';

class CoverStack extends StatelessWidget {
  const CoverStack({super.key});
WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(
      builder:(context,state){
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            const Image(
              image: AssetImage('assets/images/cover.jpeg'),
              fit: BoxFit.fitWidth,
              height: 250,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'SoftWare Engineer',
                      style: GoogleFonts.sirinStencil(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          backgroundColor:
                          Color.fromARGB(189, 82, 170, 221).withOpacity(0.4),
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedText(
                          duration: const Duration(seconds: 1),
                          text: 'Hello World!'),
                      AnimatedText(
                          duration: const Duration(seconds: 1),
                          text: 'I am Muhannad but everyone calls me MIMO'),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Download My CV'),
                     IconButton(onPressed: (){

                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViews()));

                    }, icon: Icon(
                        Icons.download
                    ))
                  ],
                )
              ],
            ),

          ],
        );
    },
      listener: (context,state){},
    );
  }
}
