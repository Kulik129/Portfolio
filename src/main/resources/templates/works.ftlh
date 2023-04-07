<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Works</title>
</head>
<body>
<div class="myWorks">
    <#list works as work>
        <div>
            <h1>${work.title}</h1>
            <h1${work.description}</h1>
            <form action="/work/delete/${work.id}" method="post">
                <input type="submit" value="delete">
            </form>
        </div>
    <#else>
        <h1>Upss..</h1>
    </#list>
    <h1>Add work</h1>
    <form action="/work/add" method="post">
        <input type="text" name="title" placeholder="Название работы">
        <input type="text" name="description" placeholder="Краткое описание">
        <input type="submit" value="Add">
    </form>
</div>
</body>
</html>