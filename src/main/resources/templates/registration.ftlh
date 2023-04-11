<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registration</title>
</head>
<body>
<form class="box" action="/registration" method="post">
    <h2>Регистрация</h2>
    <input type="text" name="name" placeholder="Имя">
    <input type="email" name="email"placeholder="Email">
    <input type="text" name="phoneNumber" placeholder="Номер телефона">
    <input type="password" name="password" placeholder="Пароль">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Регистрация"/>
    <a href="/login">Зарегистрированы? Войти</a>
</form>
<#if error??>
    <h2 style="color: red">${error}</h2>
</#if>
</body>
</html>