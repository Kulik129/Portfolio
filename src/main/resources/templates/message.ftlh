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
    <div class="message">
        <#list messages as message>
            <h3>Отправитель: ${message.sender}</h3>
            <h3>Тема: ${message.messageSubject}</h3>
            <h3>Сообщение: ${message.message}</h3>
            <h3>Отправленно: ${message.localDateTime}</h3>
            <form action="/message/delete/${message.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Удалить">
            </form>
        </#list>
    </div>
</body>
</html>