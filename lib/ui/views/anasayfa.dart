import 'package:bloc_pattern_kullanimi/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfSayi1 = TextEditingController();
  var tfSayi2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Kullanımı"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Cubit Dinleme Yapısı Kuruldu
              BlocBuilder<AnasayfaCubit, int>(
                builder: (context, sonuc) {
                  return Text(
                    sonuc.toString(),
                    style: const TextStyle(fontSize: 40),
                  );
                },
              ),
              // Cubit Dinleme Yapısı Kuruldu
              TextField(
                controller: tfSayi1,
                decoration: const InputDecoration(hintText: "Sayı 1"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: tfSayi2,
                decoration: const InputDecoration(hintText: "Sayı 2"),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<AnasayfaCubit>()
                            .toplamaYap(tfSayi1.text, tfSayi2.text);
                      },
                      child: Text("TOPLAMA")),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<AnasayfaCubit>()
                            .carpmaYap(tfSayi1.text, tfSayi2.text);
                      },
                      child: Text("ÇARPMA")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
