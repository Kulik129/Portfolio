<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/static/css/style.css">
    <title>Title</title>
</head>
<body>

<div class="main-menu">
    <div class="list_menu">
        <#if user.email??>
            <h3>Имя пользователя: <i>${user.name}</i></h3>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Выйти"/>
            </form>
            <#if user.isAdmin()>
                    <a href="/admin">Админка</a>
                    <a href="/message">Сообщения</a>
                    <a href="/">Обомне</a>
                    <a href="/certificates">Сертификаты</a>
                    <a href="/works">Работы</a>
                    <a href="/">Связь со мной</a>
            </#if>
        <#else>
            <a href="/login">Войти</a>
            <a href="/">Обомне</a>
            <a href="/certificates">Сертификаты</a>
            <a href="/works">Работы</a>
            <a href="/">Связь со мной</a>
        </#if>
    </div>
</div>

<div class="about">
    <h4 class="annotation">@SpringBootApplication</h4><br>
    <h4 class="cod-text">public class Dmitrii { </h4><br>
    <h4 class="cod-text">public static void main(String[] args) { </h4><br>
    <h4 class="cod-text">SpringApplication.run(Dmitrii.class, args);</h4> <br>
    <h4 class="cod-text">private String aboutMe = “</H4><br>
    <h1 class="about-text">HI ! I”m Dmitrii Back- end developer </h1><br>
</div>


<div class="myWorks">
    <#list works as work>
        <div>
            <a href="work/${work.id}">
                <h1>${work.title}</h1>
                <img src="/images/${work.previewImageId?c}" height="120px">
                <#if user.isAdmin()>
                    <form action="/work/delete/${work.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="delete">
                    </form>
                </#if>
            </a>
        </div>
    <#else>
        <h1>Upss..</h1>
    </#list>
    <#if user.isAdmin()>
        <h1>Добавить работу</h1>
        <form action="/work/add" method="post" enctype="multipart/form-data">
            <input type="text" name="title" placeholder="Название работы"><br>
            <input type="text" name="description" placeholder="Краткое описание"><br>
            Первая фотография: <input type="file" name="file1"/><br><br>
            Вторая фотография: <input type="file" name="file2"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Добавить">
        </form>
    </#if>
</div>

<div class="certificates">
    <#list certificates as certificate>
        <div>
            <a href="/certificates/${certificate.id}">
                <h1>${certificate.title}</h1>
                <img src="/images/${certificate.previewImgId?c}" height="120px">
                <#if user.isAdmin()>
                    <form action="/certificate/delete/${certificate.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Удалить">
                    </form>
                </#if>
            </a>
        </div>
    <#else>
        <h1>Upss=( </h1>
    </#list>
    <#if user.isAdmin()>
        <h1>Add certificate</h1>
        <form action="/certificate/add" method="post" enctype="multipart/form-data">
            <input type="text" name="title" placeholder="Название"><br>
            <input type="text" name="description" placeholder="Краткое описание"><br>
            Первая фотография: <input type="file" name="file1"/><br><br>
            Вторая фотография: <input type="file" name="file2"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Добавить">
        </form>
    </#if>
</div>
<div class="contact-me">
    <h1>Связаться со мной</h1><br>
    <form action="/message/send" method="post">
        <input type="text" name="sender" placeholder="Введите ваш email">
        <input type="text" name="messageSubject" placeholder="Тема письма">
        <input type="text" name="message" placeholder="Введите текст сообщения...">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Отправить">
    </form>
</div>
</body>
</html>