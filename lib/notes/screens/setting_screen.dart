import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SwitchListTile(
                value: false,
                onChanged: null,
                title: Text("¿Cambiar a modo oscuro?",
                    style: TextStyle(color: Colors.black)),
              ),
              Expanded(child: Container()),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(22.0)),
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Cerrar Sesion",
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
