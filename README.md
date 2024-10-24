# Zapret

> [!NOTE]  
> Данный репозиторий - **моя личная** сборка [оригинального репозитория](https://github.com/bol-van/zapret). Здесь используются оригинальные бинарники, сравнить которые вы можете с помощью хэша.
> Так как zapret open-source, вы всегда можете сами собрать эти бинарники и не бояться вирусов.
>
>**Буду рад [⭐ поставленной звезде](https://github.com/endlessempathy/zapret-by-endless_empathy/stargazers) (в правом верхнем углу) у репозитория 🙂**

##

> [!CAUTION]  
> **Многие антивирусники** в данный момент жалуются на ***HackTool/RiskTool*** и ***WinDivert*** - это нормальное поведение, так как программа изменяет сетевые пакеты. Что с этим делать? Собрать бинарники самому из исходников, довериться уже собранным, либо не использовать вовсе.

## Как пользоваться
> [!IMPORTANT]  
> Если всё еще не скачан, то скачайте [последний релиз](https://github.com/endlessempathy/zapret-by-endless_empathy/releases/latest) и разархивируйте в отдельную папку.

Запустите **от имени администратора** то, что вам нужно:
- `preset-all_in_one.bat` - запустить обход для Youtube, Discord и сайтов из реестра РКН.
- `preset-discord.bat` - запустить обход только для Discord.
- `preset-youtube.bat` - запустить обход только для Youtube.
> [!NOTE]  
> Разовый запуск программы без автозапуска.
###
- `service_install.bat` - установить на автозапуск (в качестве сервиса) любую стратегию из этого репозитория.
> [!NOTE]  
> Программа будет запускаться и работать автоматически.  
> Используя службы, не нужно запускать консольную программу через `.bat` файлы.
###
- `service_remove.bat` - остановить и удалить сервисы выше

### Добавление дополнительных адресов заблокированных сайтов 
- Дополнительные адреса для обхода можно внести в `list-custom.txt`.
> [!NOTE]  
> Поддерживается только для стратегии `all_in_one`.
###
> [!IMPORTANT]  
> После добавления сервис нужно перезапустить.

## Решение проблем

- Проверьте, запускаете ли вы файлы от **ИМЕНИ АДМИНИСТРАТОРА**
- Не запускаются bat файлы? Попробуйте запустить `service_remove.bat` от **ИМЕНИ АДМИНИСТРАТОРА**
  * Также отключите программы, которые могут мешать созданию сервиса *(Антивирусы, клинеры с доп. защитой)*.
- Не работает вместе с **VPN**? Отключите функцию **TUN** (Tunneling) в настройках VPN.
- Попробуйте обновить бинарники с оригинального репозитория.

## Поддержать

Вы можете поддержать проект, поставив :star: (сверху справа репозитория)!  
Также, вы можете поддержать разработчика [оригинального репозитория zapret](https://github.com/bol-van/zapret/issues/590) тут - https://github.com/bol-van/zapret/issues/590

## Благодарности и Соавторы

Большое спасибо [bol-van](https://github.com/bol-van/), создателю оригинального репозитория [zapret](https://github.com/bol-van/zapret/).  
Дополнительная благодарность [Flowseal](https://github.com/Flowseal/), за удобные скрипты в его репозитории [zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube/).
