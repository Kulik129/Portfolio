<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Message</title>
</head>
<body>
<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>

<h1>Полученные сообщения: </h1>
<#list messages as message>
    <div class="message_container">
        <div class="form_message">
            <div class="data_block_message">
                <h3>Отправитель: </h3><h2>${message.sender}</h2>
                <h3>Тема: </h3><h2>${message.messageSubject}</h2>
                <div class="text_area_message">
                    <h3>Message</h3>
                    <h2>${message.message}</h2>
                </div>
                <h3>Отправленно: ${message.localDateTime}</h3>
                <form action="/message/delete/${message.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit">Удалить</button>
                </form>
            </div>
        </div>
    </div>
</#list>

</body>
</html>