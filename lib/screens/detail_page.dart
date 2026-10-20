import 'package:belajar_dart/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final CatModel catModel;
  const DetailPage({super.key, required this.catModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final warnatema = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: warnatema.surface, 
      
      appBar: AppBar(
        title: Text(
          widget.catModel.name,
          style: GoogleFonts.oswald(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          )
        ),
        centerTitle: true,
        backgroundColor: warnatema.primary, 
        foregroundColor: warnatema.onPrimary, 
      ),

      body: ListView(
        children: [
          Image.network(
            widget.catModel.urlImage,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 24),

          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            child: Text(
              widget.catModel.desc,
              style: GoogleFonts.oswald(
                color: warnatema.onSurface,
                fontSize: 16,
                height: 1.5
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}