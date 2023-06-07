import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_commerce_mobile/data/models/product.dart';
import 'package:social_commerce_mobile/presentation/cubits/home_cubit.dart';
import 'package:social_commerce_mobile/presentation/states/home_state.dart';
import '../../../../injection_container.dart' as di;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeCubit = di.sl.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
          bloc: homeCubit,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeSuccessState) {
              return ListView.builder(
                itemCount: homeCubit.products.length,
                itemBuilder: (context, index) {
                  Product product = homeCubit.products[index];

                  return ListTile(
                    leading: Image.network(
                      product.imageUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
