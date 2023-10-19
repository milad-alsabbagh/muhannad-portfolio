import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';

class CoverStack extends StatelessWidget {
  const CoverStack({super.key});
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      builder: (context, state) {
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
                              const Color.fromARGB(189, 82, 170, 221)
                                  .withOpacity(0.4),
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
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
                    const Text('Download My CV'),
                    IconButton(
                        onPressed: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViews()));
                        },
                        icon: const Icon(Icons.download))
                  ],
                )
              ],
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
