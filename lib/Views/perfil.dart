import 'package:flutter/material.dart';

class perfildeusuario extends StatelessWidget {
  const perfildeusuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50), // Espaciado superior
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.lightBlue,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Antony Joseph',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'antonyjoseph.uni@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildListTile(
                    icon: Icons.person,
                    text: 'Editar Perfil',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildListTile(
                    icon: Icons.settings,
                    text: 'Configuración',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildListTile(
                    icon: Icons.logout,
                    text: 'Cerrar Sesión',
                    onTap: () {},
                    iconColor: Colors.red,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey,
    );
  }
}
