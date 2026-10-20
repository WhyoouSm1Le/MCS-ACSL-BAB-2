import 'package:belajar_dart/data/cat_data.dart';
import 'package:belajar_dart/model/cat_model.dart';
import 'package:belajar_dart/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final warnatema = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: warnatema.surface, 
      
      appBar: AppBar(
        title: Text(
          "MCS BAB 2",
          style: GoogleFonts.oswald(
            color: warnatema.onPrimary,
            fontWeight: FontWeight.w600
          )
        ),
        centerTitle: true,
        backgroundColor: warnatema.primary, 
      ),

      body: ListView(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Text(
              "MACAM-MACAM OYEN",
              style: GoogleFonts.oswald(
                color: warnatema.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          
          ListView.builder(
            itemCount: cats.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              CatModel cat = cats[index];

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: warnatema.surfaceContainerHighest, 
                  borderRadius: BorderRadius.circular(20),
                ),
                
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),

                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) {
                          return DetailPage(catModel: cat);
                        })
                      );
                    },
                    
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 4,
                            width: MediaQuery.of(context).size.width / 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(cat.urlImage, fit: BoxFit.cover),
                            ),
                          ),
                          
                          const SizedBox(width: 15),
                          
                          Expanded( 
                            child: Text(
                              cat.name,
                              style: GoogleFonts.oswald(
                                color: warnatema.onSurface,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )
                            ),
                          ),

                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: warnatema.primary, 
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
  }
}