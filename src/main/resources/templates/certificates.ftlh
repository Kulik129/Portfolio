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
<div class="certificates_part">
    <h2></h2>
    <h3>Certificates</h3>
    <h1></h1>
    <div class="certificates">
        <#list certificates as certificate>
            <div class="certificates_box">
                <a href="/certificates/${certificate.id?c}">
                <img src="/images/${certificate.previewImgId?c}" alt="" class="certificate_img">
                </a>
                <#if user.isAdmin()>
                    <form action="/certificate/delete/${certificate.id?c}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit">Удалить</button>
                    </form>
                </#if>

            </div>
        <#else>
            <h1>Upss=( </h1>
        </#list>
    </div>
</div>
</body>
</html>