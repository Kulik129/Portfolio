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
    <div class="js">
        <script type="x-shader/x-vertex" id="vertexshader">

  attribute float size;
  attribute vec3 customColor;
  varying vec3 vColor;

  void main() {

    vColor = customColor;
    vec4 mvPosition = modelViewMatrix * vec4( position, 1.0 );
    gl_PointSize = size * ( 300.0 / -mvPosition.z );
    gl_Position = projectionMatrix * mvPosition;

  }


        </script>
        <script type="x-shader/x-fragment" id="fragmentshader">

 uniform vec3 color;
 uniform sampler2D pointTexture;

 varying vec3 vColor;

 void main() {

   gl_FragColor = vec4( color * vColor, 1.0 );
   gl_FragColor = gl_FragColor * texture2D( pointTexture, gl_PointCoord );

 }


        </script>
        <div id="magic"></div>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/three.js/r125/three.min.js'></script>
        <script src="/static/js/script.js"></script>
    </div>
    <h4>";</h4>
    <h4>}</h4>
    <h4>}</h4>
</div>


<div class="text_zone">
    <h4>public class Works {<br>
        private String = "
    </h4>
    <h3>Небольшая галерея моих проектов</h3><h4>";</h4>
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
    <h3>Небольшая галерея моих сертификатов</h3><h4>";</h4>
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

    <div class="text_zone">
        <h4>public class ContactMe {<br>
            private String = "
        </h4>
        <h1>Связаться со мной</h1><h4>";</h4>
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
        <h4>}</h4>
    </div>

</div>
</body>
</html>