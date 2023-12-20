import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(primary: Colors.black, secondary: Colors.purple),
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vocabulary App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bem-vindo ao Vocabulary App!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Ajuste de afastamento
              ),
              child: Text('Registrar', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // Navegar para a tela de login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Ajuste de afastamento
              ),
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validar nome, email e senha, e navegar para a próxima tela
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                  // Navegar para a próxima tela (pode ser uma tela home, por exemplo)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(name)),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Ajuste de afastamento
              ),
              child: Text('Registrar', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validar email e senha, e navegar para a próxima tela
                String email = emailController.text;
                String password = passwordController.text;
                if (email.isNotEmpty && password.isNotEmpty) {
                  // Navegar para a próxima tela (pode ser uma tela home, por exemplo)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(email)),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Ajuste de afastamento
              ),
              child: Text('Entrar', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String userName;

  HomeScreen(this.userName);

  @override
  Widget build(BuildContext context) {
    // Adicione essas variáveis para representar o progresso fictício e as estatísticas
    double progress = 0.7; // Porcentagem fictícia
    int acertos = 35; // Estatísticas fictícias
    int totalPalavras = 50; // Estatísticas fictícias

    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo, $userName!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navegar para a tela de seleção de dificuldade
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectDifficultyScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                child: Text('Novo Quiz', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20.0),
            QuizComprehensionFrame(),
            SizedBox(height: 20.0),
            Container(
              // Adicione um container para a barra de progresso e estatísticas
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Progresso e Estatísticas',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Desempenho: $acertos/$totalPalavras acertos',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizComprehensionFrame extends StatelessWidget {
  final List<Map<String, String>> vocabularyList = [
    {'English': 'Hello', 'Portuguese': 'Olá'},
    {'English': 'Goodbye', 'Portuguese': 'Adeus'},
    {'English': 'Thank you', 'Portuguese': 'Obrigado(a)'},
    // Adicione mais palavras conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0), // Margem do topo
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Teste de Compreensão',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          for (var wordPair in vocabularyList)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    wordPair['English'] ?? '',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    wordPair['Portuguese'] ?? '',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SelectDifficultyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a Dificuldade', style: TextStyle(color: Colors.purple)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Iniciar um novo quiz com dificuldade Fácil
                // (Adicione a lógica para iniciar o quiz conforme necessário)
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Fácil', style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Iniciar um novo quiz com dificuldade Média
                // (Adicione a lógica para iniciar o quiz conforme necessário)
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Média', style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Iniciar um novo quiz com dificuldade Difícil
                // (Adicione a lógica para iniciar o quiz conforme necessário)
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Difícil', style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}