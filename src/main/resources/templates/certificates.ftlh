<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Certificates</title>
</head>
<body>
<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>
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
</body>
</html>