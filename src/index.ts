import * as process from 'process';
const { exec } = require('child_process');

const { Telegraf } = require('telegraf');
require('dotenv/config')

const bot = new Telegraf(process.env.BOT_API);

bot.start((ctx:any) => {
    const chatId = ctx.chat.id;
    console.log(chatId)
    ctx.reply('Ваш контейнер успешно подключен к сети!');
});


bot.command('containers',async (ctx:any) => {
    const chatId = ctx.chat.id;
    console.log(chatId)
    exec('docker ps', (error:any, stdout:any, stderr:any) => {
        if (error) {
            return ctx.reply(`Ошибка выполнения команды: ${error}`);
        }
         return ctx.reply(`Запущенные контейнеры: \n ${stdout}`);
    });

});

// Отправка уведомления при запуске
bot.telegram.sendMessage(process.env.ADMIN_CHAT_ID, 'Сервер запущен');

// Запуск бота
bot.launch();
