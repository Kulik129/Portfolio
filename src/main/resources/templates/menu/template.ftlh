<#macro template user>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="/static/css/style.css">
        <link rel="stylesheet" href="/static/css/styleJS.css">
        <title>Title</title>
    </head>
<body>

<div class="main-menu">
    <div class="list_menu">
        <#if user.email??>
            <h3><i>${user.name}</i></h3>
            <a href="/">Обомне</a>
            <a href="/certificates">Сертификаты</a>
            <a href="/works">Работы</a>
            <a href="/">Связь со мной</a>
            <#if user.isAdmin()>
                <a href="/admin">Админка</a>
                <a href="/message">Сообщения</a>
            </#if>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
<#--                <input type="submit" value="Выйти"/>-->
                <button type="submit">Выйти</button>
            </form>
<#--            <#if user.isAdmin()>-->
<#--                <a href="/admin">Админка</a>-->
<#--                <a href="/message">Сообщения</a>-->
<#--            </#if>-->
        <#else>
<#--            <a href="/login">Войти</a>-->
            <a href="/">Обомне</a>
            <a href="/certificates">Сертификаты</a>
            <a href="/works">Работы</a>
            <a href="/">Связь со мной</a>
        </#if>
    </div>
</div>
<#nested/>
<script src="/static/css/js/script.js"></script>
</body>
</#macro>