import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../domain/usecases/get_user_by_id_usecase.dart';
import '../bloc/userdetail_bloc.dart';
import '../bloc/userdetail_event.dart';
import '../bloc/userdetail_state.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          UserDetailBloc(getIt<GetUserByIdUseCase>())
            ..add(FetchUserDetail(userId)),
      child: Scaffold(
        appBar: AppBar(title: const Text("User Detail")),
        body: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
            if (state is UserDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserDetailError) {
              return Center(child: Text(state.message));
            }

            if (state is UserDetailLoaded) {
              final user = state.user;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text('@${user.username}'),
                    const SizedBox(height: 16),

                    /// CONTACT
                    _sectionTitle(context, "Contact"),
                    _infoTile(Icons.email, user.email),
                    _infoTile(Icons.phone, user.phone),
                    _infoTile(Icons.language, user.website),

                    const SizedBox(height: 16),

                    /// ADDRESS
                    _sectionTitle(context, "Address"),
                    _infoText('${user.address.street}, ${user.address.suite}'),
                    _infoText(user.address.city),
                    _infoText('ZIP: ${user.address.zipcode}'),

                    const SizedBox(height: 16),

                    /// GEO
                    _sectionTitle(context, "Location"),
                    _infoText('Lat: ${user.address.geo.lat}'),
                    _infoText('Lng: ${user.address.geo.lng}'),

                    const SizedBox(height: 16),

                    /// COMPANY
                    _sectionTitle(context, "Company"),
                    _infoText(user.company.name),
                    _infoText(user.company.catchPhrase),
                    _infoText(user.company.bs),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

Widget _sectionTitle(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}

Widget _infoText(String text) {
  return Padding(padding: const EdgeInsets.only(bottom: 4), child: Text(text));
}

Widget _infoTile(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
