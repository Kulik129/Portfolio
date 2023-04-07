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
    <div class="certificates">
        <#list certificates as certificate>
            <h1>${certificate.title}</h1>
            <h1>${certificate.description}</h1>
            <form action="/certificate/delete/${certificate.id}" method="post">
                <input type="submit" value="Delete">
            </form>
            <#else>
            <h1>Upss=(</h1>
        </#list>
        <h1>Add certificate</h1>
        <form action="/certificate/add" method="post">
            <input type="text" name="title" placeholder="Название"><br>
            <input type="text" name="description" placeholder="Краткое описание"><br>
            <input type="submit" value="Add">
        </form>
    </div>
</body>
</html>