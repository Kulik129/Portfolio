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
<div class="message_container">
    <h1>Полученные сообщения: </h1>
    <div class="form_message">
        <div class="data_block_message">
            <#list messages as message>
            <h3 class="sender">Отправитель: ${message.sender}</h3>
            <h3 class="subject">Тема: ${message.messageSubject}</h3>
        </div>
        <div class="text_area_message">
            <p>Message</p>
            <h3>Сообщение: ${message.message}</h3>
        </div>
        <h3>Отправленно: ${message.localDateTime}</h3>
        <form action="/message/delete/${message.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Удалить</button>
        </form>
    </div>
    </#list>
</div>
</body>
</html>