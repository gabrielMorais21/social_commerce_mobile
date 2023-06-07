import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_commerce_mobile/data/models/user.dart';
import 'package:social_commerce_mobile/presentation/cubits/registration_cubit.dart';
import 'package:social_commerce_mobile/presentation/states/registration_state.dart';
import '../../../../injection_container.dart' as di;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  User user = User();
  final registrationCubit = di.sl.get<RegistrationCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: BlocConsumer<RegistrationCubit, RegistrationState>(
          bloc: registrationCubit,
          listener: (context, state) {
            if (state is RegistrationSuccessState) {
              // Navigate to the next screen on successful login
              Navigator.pushReplacementNamed(context, '/login');
            } else if (state is RegistrationFailureState) {
              // Show an error message
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('registration failed.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.name = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Sobrenome',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.lastName = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.email = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'RG',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.rg = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Celular',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.cellPhone = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Telefone Fixo',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.landlinePhone = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'CPF',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.cpf = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          user.password = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Rua',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.street = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Cidade',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.city = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'UF',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.uf = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'CEP',
                      ),
                      onChanged: (value) {
                        setState(() {
                          user.zipCode = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      child: Text('Cadastrar'),
                      onPressed: () async {
                        await registrationCubit.registerUser(user);
                        // Implementar a lógica de cadastro aqui
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
