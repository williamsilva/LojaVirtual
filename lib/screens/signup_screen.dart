import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffodkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffodkey,
        appBar: AppBar(
          title: Text("Criar Conta"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Nome Completo"
                    ),
                    validator: (text) {
                      if(text.isEmpty ) return "Nome inválido!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "E-mail"
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if(text.isEmpty || !text.contains("@")) return "E-mail inválido!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                        hintText: "Senha"
                    ),
                    obscureText: true,
                    validator: (text) {
                      if(text.isEmpty || text.length < 6)return "Senha inválida!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                        hintText: "Endereço"
                    ),
                    validator: (text) {
                      if(text.isEmpty)return "Endereço inválida!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text("Criar Conta",
                          style: TextStyle(
                            fontSize: 18.0,
                          )
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){

                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text,
                        };

                        if(_formKey.currentState.validate()){
                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          },
        )
    );
  }

  void _onSuccess(){
    _scaffodkey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuário criado com sucesso!"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 3),
      )
    );
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffodkey.currentState.showSnackBar(
        SnackBar(
          content: Text("Flaha ao Cadastra Usuario!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        )
    );
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(context).pop();
    });
  }

}
