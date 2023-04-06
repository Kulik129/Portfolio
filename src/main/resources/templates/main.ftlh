<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <#list certificates as certificate>
        <div>
            <h1>${certificate.title}</h1>
            <h1>${certificate.description}</h1>
            <form action="/certificate/delete/${certificate.id}" method="post">
            <input type="submit" value="delete">
            </form>
        </div>

        <#else>
        <h1>Upss=(</h1>
    </#list>
<h1>Add</h1>
<form action="/certificate/add" method="post">
    <input type="text" name="title" placeholder="Название"><br>
    <input type="text" name="description" placeholder="Краткое описание"><br>
    <input type="submit" value="Add">
</form>
</body>
</html>