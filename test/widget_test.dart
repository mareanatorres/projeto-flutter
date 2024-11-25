import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projetoacqa/calendarpage.dart'; // Importe sua tela corretamente
import 'package:projetoacqa/models/user_provider.dart'; // Importe o seu UserProvider corretamente

void main() {
  testWidgets('Testa a tela do Calendário e a mensagem de boas-vindas',
      (WidgetTester tester) async {
    // Envolvendo o widget com ChangeNotifierProvider para fornecer o estado do usuário
    await tester.pumpWidget(
      ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider()
          ..updateUser('Mariana', '11532162'), // Inicializando o UserProvider
        child: MaterialApp(
          home:
              CalendarScreen(), // Certifique-se de que CalendarScreen é o nome correto
        ),
      ),
    );

    // Verifica se a mensagem de boas-vindas está sendo exibida corretamente
    expect(find.text('Bem-vinda, Mariana! RA: 11532162'), findsOneWidget);

    // Verifica se o widget TableCalendar está presente na tela
    expect(find.byType(TableCalendar), findsOneWidget);
  });
}
