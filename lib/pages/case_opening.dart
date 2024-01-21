import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:zombi/components/navbar.dart';

class CaseOpening extends StatefulWidget {
  const CaseOpening({super.key});

  @override
  State<CaseOpening> createState() => _CaseOpeningState();
}

class _CaseOpeningState extends State<CaseOpening> {
  String _chestImage = "assets/close_chest.png";
  String _zombiImage = ""; // Image de zombi initiale
  String _rarityText = "";
  String _imageNameText = "";
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Map<String, List<String>> _imagesByFolder = {
    'cramptex': [
      'assets/zombi/cramptex/zombi_bebe.png',
      'assets/zombi/cramptex/zombi_defonce.png',
    ],
    'futulu': [
      'assets/zombi/futulu/zombi_captain.png',
      'assets/zombi/futulu/zombi_cowboy.png',
      'assets/zombi/futulu/zombi_soldier.png',
    ],
    'LEGENDARY': [
      'assets/zombi/LEGENDARY/zombi_baka_inu.png',
      'assets/zombi/LEGENDARY/zombi_bodybuilder.png',
      'assets/zombi/LEGENDARY/zombi_mincevraft.png',
    ],
    'ok': [
      'assets/zombi/ok/zombi_aquaman.png',
      'assets/zombi/ok/zombi_jetpack.png',
      'assets/zombi/ok/zombi_pharaon.png',
      'assets/zombi/ok/zombi_thieve.png',
    ],
    'poop': [
      'assets/zombi/poop/zombi_grandpa.png',
      'assets/zombi/poop/zombi_granny.png',
      'assets/zombi/poop/zombi_guignolo.png',
      'assets/zombi/poop/zombi_knight.png',
      'assets/zombi/poop/zombi_worker.png',
    ],
  };
  String _selectRandomImageInFolder(String folder) {
    var images = _imagesByFolder[folder];
    if (images != null && images.isNotEmpty) {
      return images[Random().nextInt(images.length)];
    }
    return 'assets/default_image.png'; // Image par défaut si le dossier est vide ou non trouvé
  }

  String _selectRandomFolder() {
    final int randomValue = Random().nextInt(100); // Valeur entre 0 et 99
    if (randomValue < 40) {
      return 'poop';
    } else if (randomValue < 65) {
      return 'cramptex';
    } else if (randomValue < 80) {
      return 'ok';
    } else if (randomValue < 90) {
      return 'futulu';
    } else {
      return 'LEGENDARY';
    }
  }

  void _playSoundAndChangeImage() async {
    // Jouez le son du coffre s'ouvrant
    await _audioPlayer.play(AssetSource("chest_sound.mp3"));

    // Après 8 secondes, choisissez une image de zombi aléatoire et mettez à jour l'état
    Timer(Duration(seconds: 8), () {
      String folder = _selectRandomFolder();
      List<String> images = _imagesByFolder[folder] ?? [];
      if (images.isNotEmpty) {
        String randomImage = images[Random().nextInt(images.length)];
        setState(() {
          // Mettez à jour l'image de zombi avec la nouvelle image sélectionnée
          _zombiImage = randomImage;
          // Mettez à jour le texte de rareté et le nom de l'image
          _rarityText = "Rarity: $folder Tier";
          _imageNameText =
              "Name: ${randomImage.split('/').last.replaceAll('_', ' ').replaceAll('.png', '')}";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 550,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  top: 50,
                  child: GestureDetector(
                    onTap: _playSoundAndChangeImage,
                    child: Image.asset(_chestImage, height: 550),
                  ),
                ),
                if (_zombiImage) Image.asset(_zombiImage, height: 300),
              ],
            ),
          ),
          if (_rarityText.isNotEmpty)
            Text(_rarityText, style: TextStyle(fontSize: 30)),
          if (_imageNameText.isNotEmpty)
            Text(_imageNameText, style: TextStyle(fontSize: 30)),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
