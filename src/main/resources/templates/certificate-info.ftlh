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
<div class="certificates">
    <#list images as img>
        <img src="/images/${img.id?c}" height="120px"><br>
    </#list>
    <h1><b>${certificates.title}</b></h1><br>
    <b>${certificates.description}</b><br>
</div>
</body>
</html>