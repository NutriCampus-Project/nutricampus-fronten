class RegistroController {
  final List<String> rolesValidos = [
    'Estudiante',
    'Docente',
    'Administrativo',
    'Encargado'
  ];

  Map<String, dynamic> registrarUsuario({
    required String nombres,
    required String apellidos,
    required String correo,
    required String rol,
    required String password,
  }) {
    // Validaciones de entrada
    if (nombres.trim().isEmpty || apellidos.trim().isEmpty) {
      return {'estado': 'ERROR', 'mensaje': 'Nombres y apellidos son obligatorios.'};
    }
    if (!correo.endsWith('@unap.edu.pe')) {
      return {'estado': 'ERROR', 'mensaje': 'Debe ingresar un correo institucional @unap.edu.pe.'};
    }
    if (!rolesValidos.contains(rol)) {
      return {'estado': 'ERROR', 'mensaje': 'Rol no válido en el sistema.'};
    }
    if (password.length < 8) {
      return {'estado': 'ERROR', 'mensaje': 'La contraseña debe tener mínimo 8 caracteres.'};
    }

    // Procesamiento exitoso
    return {
      'estado': 'OK',
      'mensaje': 'Usuario registrado correctamente en NutriCampus.',
      'usuario': {
        'nombre_completo': '${nombres.trim()} ${apellidos.trim()}',
        'correo': correo.trim().toLowerCase(),
        'rol': rol,
        'fecha_registro': DateTime.now().toIso8601String()
      }
    };
  }
}

void main() {
  final registro = RegistroController();

  print('=== CASO VÁLIDO ===');
  final casoValido = registro.registrarUsuario(
    nombres: 'David',
    apellidos: 'Huamantuma Aviles',
    correo: 'dhuamantuma@unap.edu.pe',
    rol: 'Estudiante',
    password: 'ClaveSegura2026',
  );
  print(casoValido);

  print('\n=== CASO INVÁLIDO ===');
  final casoInvalido = registro.registrarUsuario(
    nombres: 'David',
    apellidos: 'Huamantuma Aviles',
    correo: 'dhuamantuma@gmail.com',
    rol: 'Estudiante',
    password: '123',
  );
  print(casoInvalido);
}
