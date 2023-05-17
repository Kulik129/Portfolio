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
<div class="work_part">
    <h2></h2>
    <h3>Works</h3>
    <h1></h1>
    <div class="myWorks">
        <#list works as work>
            <div class="work_box">
                <img src="/images/${work.previewImageId?c}" alt="" class="work_img">
                <#if user.isAdmin()>
                    <form action="/work/delete/${work.id?c}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit">Удалить</button>
                    </form>
                </#if>
                </a>
            </div>
        <#else>
            <h2>Upss..</h2>
        </#list>
    </div>
</div>
</body>
</html>