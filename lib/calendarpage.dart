import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'models/user_provider.dart'; // Importe seu UserProvider

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // Configurações do calendário
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  // Eventos do calendário (exemplo com tarefas simples)
  Map<DateTime, List<String>> _events = {
    DateTime.now(): ['Reunião às 10h', 'Entrega de projeto'],
    DateTime.now().add(Duration(days: 1)): [
      'Comprar mantimentos',
      'Enviar relatório'
    ],
  };

  // Método para obter os eventos de um dia
  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Bem-vinda, ${'Mariana Torres'}! RA: ${'11532162'}', // Exibe a mensagem personalizada
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),

              // Widget TableCalendar para exibir o calendário
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                eventLoader: _getEventsForDay, // Exibe os eventos no calendário
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              // Lista dos eventos do dia selecionado
              Expanded(
                child: ListView(
                  children: _getEventsForDay(_selectedDay)
                      .map((event) => ListTile(
                            leading: Icon(Icons.event),
                            title: Text(event),
                          ))
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
