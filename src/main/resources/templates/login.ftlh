<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
</head>
<body>
<form class="box" action="/login" method="post">
    <h2>Вход</h2>
    <input type="email" name="username" placeholder="email">
    <input type="password" name="password" placeholder="password">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход"/>
    <a href="/registration">Зарегистрироваться</a>
</form>

</body>
</html>