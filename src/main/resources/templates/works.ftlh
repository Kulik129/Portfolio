<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Works</title>
</head>
<body>
<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>
<div class="text_zone">
    <h4>public class Works {<br>
        private String = "
    </h4>
    <div class="wrapper">
        <div class="typing-demo">
            Небольшая галерея моих проектов
        </div>
    </div>
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
</body>
</html>