import csv
from datetime import datetime, timedelta
import pytz
import os

timezone = pytz.timezone('America/Sao_Paulo')

schedule = [
    ("1-Acordar", "06:00", "06:30"),
    ("2-Café", "06:30", "07:00"),
    ("3-Leitura / Estudos / Duo Lingo", "07:00", "08:00"),
    ("4-Estudar", "08:00", "09:00"),
    ("5-Trampar", "09:00", "11:20"),
    ("6-Inglês", "11:20", "12:15"),
    ("7-Almoçar", "12:15", "13:15"),
    ("8-Trampar", "13:15", "17:00"),
    ("9-Verificar Redes (Insta, TikTok, LinkedIn, Brains Vaga, Brains Notícias, Grupo Azure)", "17:00", "18:00"),
    ("10-Exercicios / Correr / Academia", "18:00", "19:00"),
    ("11-Banho / Jantar", "19:00", "19:30"),
    ("12-Livre", "19:30", "22:30"),
]

# Define o início da semana como a próxima segunda-feira
start_date = datetime.now(timezone)
start_date += timedelta(days=(7 - start_date.weekday()) % 7)

# Obtendo o caminho da área de trabalho
try:
    desktop_path = os.path.join(os.path.join(os.path.expanduser("~"), 'Desktop'))
except AttributeError:  # Para sistemas que não possuem a variável USERPROFILE
    desktop_path = os.path.expanduser("~/Desktop") # tenta usar a pasta Desktop do usuário

file_path = os.path.join(desktop_path, "agenda.csv")

try:
    with open(file_path, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)

        # Escreva a linha de cabeçalho
        writer.writerow(['Subject', 'Start Date', 'Start Time', 'End Date', 'End Time', 'Description', 'Location', 'All Day Event', 'Recurrence'])

        for day_offset in range(5):  # Segunda a Sexta
            day = start_date + timedelta(days=day_offset)
            for activity, start_time, end_time in schedule:
                start_datetime = timezone.localize(datetime.combine(day, datetime.strptime(start_time, "%H:%M").time()))
                end_datetime = timezone.localize(datetime.combine(day, datetime.strptime(end_time, "%H:%M").time()))

                writer.writerow([
                    activity,
                    start_datetime.strftime('%Y-%m-%d'),
                    start_datetime.strftime('%H:%M:%S'),
                    end_datetime.strftime('%Y-%m-%d'),
                    end_datetime.strftime('%H:%M:%S'),
                    '',  # Descrição (deixe em branco ou adicione uma descrição)
                    '',  # Local (deixe em branco ou adicione um local)
                    'FALSE',  # Dia inteiro (deixe em branco ou coloque TRUE para eventos de dia inteiro)
                    'FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR'  # Recorrência
                ])

    print(f"Arquivo CSV salvo em: {file_path}")
except Exception as e:
    print(f"Erro ao salvar o arquivo: {e}")