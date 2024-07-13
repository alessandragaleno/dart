import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 // const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  //const MyHomePage({super.key, required this.title});
  //final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
  //State<MyHomePage> createState() => _MyHomePageState();
}

class _LoginScreenState extends State<LoginScreen> {
  //int _counter = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    //setState(() {
      //_counter++;
      if (_formKey.currentState!.validate()){
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Fazendo Login...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value){
                if (value == null || value.isEmpty){
                  return 'Por favor, insira seu email';
                }
                return null;
              },
              //'You have pushed the button this many times:',
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              validator: (value){
                if (value == null || value.isEmpty){
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
              //'$_counter',
              //style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Login com o Google');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10.0),
                backgroundColor: Colors.grey,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Image.asset(
                    'assets/imagem.png',
                    height: 24.0,
                    width: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text('Login com Google'),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
    }
}