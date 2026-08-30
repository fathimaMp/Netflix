import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colours/colors.dart';
import 'package:netflix_app/core/di/injectable.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => getIt<DownloadsBloc>(),
//         ),
        
//       ],
//       child: Container(),
//     );
//   }
// }

 Widget build(BuildContext context) {  
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx)=> getIt<DownloadsBloc>()),
      ],
      child: MaterialApp(      
        title: 'Flutter Demo',      
        debugShowCheckedModeBanner: false,      
        theme: ThemeData(        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),        
          scaffoldBackgroundColor: backgroundColor,        
          fontFamily: GoogleFonts.montserrat().fontFamily,        
          textTheme: TextTheme(          
            bodyLarge : TextStyle(color: Colors.white),          
            bodyMedium: TextStyle(color: Colors.white),        
            )      
            ),      home: ScreenMainPage(),    
            ),
    );  
          }
}