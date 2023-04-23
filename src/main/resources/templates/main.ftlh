<#--<!DOCTYPE html>-->
<#--<html lang="en">-->
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <meta name="viewport"-->
<#--          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
<#--    <meta http-equiv="X-UA-Compatible" content="ie=edge">-->
<#--    <link rel="stylesheet" href="/static/css/style.css">-->
<#--    <title>Title</title>-->
<#--</head>-->
<#--<body>-->

<#--<div class="main-menu">-->
<#--    <div class="list_menu">-->
<#--        <#if user.email??>-->
<#--            <h3><i>${user.name}</i></h3>-->
<#--            <a href="/">Обомне</a>-->
<#--            <a href="/certificates">Сертификаты</a>-->
<#--            <a href="/works">Работы</a>-->
<#--            <a href="/">Связь со мной</a>-->
<#--            <form action="/logout" method="post">-->
<#--                <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                <input type="submit" value="Выйти"/>-->
<#--            </form>-->
<#--            <#if user.isAdmin()>-->
<#--                <a href="/admin">Админка</a>-->
<#--                <a href="/message">Сообщения</a>-->
<#--            </#if>-->
<#--        <#else>-->
<#--            <a href="/login">Войти</a>-->
<#--            <a href="/">Обомне</a>-->
<#--            <a href="/certificates">Сертификаты</a>-->
<#--            <a href="/works">Работы</a>-->
<#--            <a href="/">Связь со мной</a>-->
<#--        </#if>-->
<#--    </div>-->
<#--</div>-->
<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>



<div class="about">
    <h3>@SpringBootApplication</h3>
    <h4>public class Dmitrii {<br>
        public static void main(String[] args) { <br>
        SpringApplication.run(Dmitrii.class, args); <br>
        private String aboutMe = “
    </h4><br>
    <h1>HI ! I”m Dmitrii Back- end developer</h1> <h4>“;</h4> <br>
    <h4>private String language = “</h4>
    <h1>Java</h1><h4>";</h4>
    <h4>}</h4>
    <h4>}</h4>
</div>

<div class="text_zone">
    <h4>public class Works {<br>
        private String = "
    </h4>
    <h3>Небольшая галерея последних проектов, выполненых мной</h3>
    <h4>}</h4>
</div>
<div class="myWorks">
    <#list works as work>
        <div>
            <a href="work/${work.id?c}">
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
</div>
<div class="text_zone">
    <h4>public class Certificates {<br>
        private String = "
    </h4>
    <h3>Небольшая галерея моих сертификатов</h3>
    <h4>}</h4>
</div>

<div class="certificates">
    <#list certificates as certificate>
        <div>
            <a href="/certificates/${certificate.id?c}">
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
</div>
<div class="contact-me">
    <h1>Связаться со мной</h1><br>
    <form action="/message/send" method="post">
        <input type="text" name="sender" placeholder="Введите ваш email">
        <input type="text" name="messageSubject" placeholder="Тема письма">
        <input type="text" name="message" placeholder="Введите текст сообщения...">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Отправить</button>
<#--        <input type="submit" value="Отправить">-->
    </form>
</div>
</body>
</html>