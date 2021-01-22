import telebot
import lxml.html
import requests
import json

TOKEN = '1567872420:AAFFNuT4x8uf1pPZ6xuWPhyqs6y9QcDhWyU'

bot = telebot.TeleBot(TOKEN)

keys = dict(крона='SEK', евро='EUR', доллар='USD', фунт='GBP',)

@bot.message_handler(commands=['start', 'help'])
def help(message: telebot.types.Message):
    text = 'Чтобы начать, введите команду так: \nимя валюты' \
           '\nв какую валюту перевести' \
        '\nколичество' \
    '\n   '\
    '\nпример:' \
    '\nтенге' \
    '\nевро' \
    '\n200' \
 \
    '\n   ' \
    '\nсписок доступных валют: /values'

    bot.reply_to(message, text)

@bot.message_handler(commands=['values'])
def values(message: telebot.types.Message):
    text = 'Доступные валюты:'
    for key in keys.keys():
        text = '\n'.join((text, key, ))
    bot.reply_to(message, text)

@bot.message_handler(content_types=['text',])
def convert(message: telebot.types.Message):
    quote, base, amount = message.text.split(' ')
    r = request.get(f'https://api.exchangeratesapi.io/latest')
    total_base = json.loads(r.content)[keys[base]]
    text = json.loads(r.content)[keys[base]]
    bot.send_message(message.chat.id, text)

html = requests.get('').content

tree = etree.parse('FER API htm',
                       lxml.html.HTMLParser())

ul = tree.findall(
        'https://api.exchangeratesapi.io/latest=')

    for li in ul:
    rate = li.find('a') 
    amount= li.find('time')

bot.polling(none_stop=True)
