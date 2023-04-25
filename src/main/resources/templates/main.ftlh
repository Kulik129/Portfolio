<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>


<div class="about">
    <h3>@SpringBootApplication</h3>
    <h4>public class Dmitrii {<br>
        public static void main(String[] args) { <br>
        SpringApplication.run(Dmitrii.class, args); <br>
        private String aboutMe = “
    </h4><br>
    <h1>HI ! I”m Dmitrii Back- end developer</h1> <h4>“;</h4> <br>
    <h4>private String language = “</h4>
    <h1>Java</h1><h4>";</h4>
    <h4>}</h4>
    <h4>}</h4>
</div>


<div class="text_zone">
    <h4>public class Works {<br>
        private String = "
    </h4>
    <h3>Небольшая галерея последних проектов, выполненых мной</h3>
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
                        <button type="submit">Удалить</button>
                    </form>
                </#if>
            </a>
        </div>
    <#else>
        <h1>Upss..</h1>
    </#list>
</div>
<div class="text_zone">
    <h4>public class Certificates {<br>
        private String = "
    </h4>
    <h3>Небольшая галерея моих сертификатов</h3>
    <h4>}</h4>
</div>

<div class="certificates">
    <#list certificates as certificate>
        <div>
            <a href="/certificates/${certificate.id?c}">
                <h1>${certificate.title}</h1>
                <img src="/images/${certificate.previewImgId?c}" height="120px">
                <#if user.isAdmin()>
                    <form action="/certificate/delete/${certificate.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit">Удалить</button>
                    </form>
                </#if>
            </a>
        </div>
    <#else>
        <h1>Upss=( </h1>
    </#list>
</div>
<div class="contact-me">
    <div class="form">
        <h1>Связаться со мной</h1><br>
        <div class="data_block">
            <form action="/message/send" method="post">
                <input type="text" class="name" name="sender" placeholder="Введите ваш email">
                <input type="text" class="messageSubject" name="messageSubject" placeholder="Тема письма">
                <div class="text_area">
                    <p class="message">Message</p>
                    <textarea name="message" rows="5" placeholder="Введите текст сообщения..."></textarea>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit">Отправить</button>
            </form>
        </div>
    </div>

</div>
</body>
</html>