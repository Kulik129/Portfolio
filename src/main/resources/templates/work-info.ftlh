<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Certificates</title>
</head>
<body>
<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>
<div class="work">
    <#list images as img>
        <img src="/images/${img.id?c}"/><br><br>
    </#list>
    <b><h1>${works.title}</h1></b><br>
    <h1>${works.description}</h1>
</div>
</body>
</html>