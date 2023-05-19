<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>

<div class="about">
    <div class="text_zone_about">
        <h1></h1>
        <h2></h2>
        <h3></h3>
        <h4></h4>
    </div>
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

</div>

<div class="work_part">
    <h2></h2>
    <h3>Projects</h3>
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


<div class="part">
    <h2></h2>
    <h3>Skills</h3>
    <h1></h1>
    <section class="section">
        <div class="bloc_articles">
            <article class="post" style="border-top-color:#48ff00">
                <div class="content">
                    <h4 style="color:#48ff00">Java Core</h4>
                    <div class="post_title">
                        <h5>Java programs</h5>
                    </div>
                    <div class="post_content">
                        For the last 20 years, Google has been the main search...
                    </div>
                </div>
            </article>

            <article class="post" style="border-top-color:#48ff00">
                <div class="content">
                    <h4 style="color:#48ff00">MySQL</h4>
                    <div class="post_title">
                        <h5>MySQL</h5>
                    </div>
                    <div class="post_content">
                        For the last 20 years, Google has been the main search...
                    </div>
                </div>
            </article>

            <article class="post" style="border-top-color:#f7ff00">
                <div class="content">
                    <h4 style="color:#f7ff00">Linux</h4>
                    <div class="post_title">
                        <h5>Linux scripts</h5>
                    </div>
                    <div class="post_content">
                        For the last 20 years, Google has been the main search...
                    </div>
                </div>
            </article>

            <article class="post" style="border-top-color:#ff00d9">
                <div class="content">
                    <h4 style="color:#ff00d9">GIT</h4>
                    <div class="post_title">
                        <h5>GIT</h5>
                    </div>
                    <div class="post_content">
                        For the last 20 years, Google has been the main search...
                    </div>
                </div>
            </article>

            <article class="post" style="border-top-color:#ff00d9">
                <div class="content">
                    <h4 style="color:#ff00d9">GIT</h4>
                    <div class="post_title">
                        <h5>GIT</h5>
                    </div>
                    <div class="post_content">
                        For the last 20 years, Google has been the main search...
                    </div>
                </div>
            </article>

            <article class="post" style="border-top-color:#00bbff">
                <div class="content">
                    <h4 style="color:#00bbff">GIT</h4>
                    <div class="post_title">
                        <h5>GIT</h5>
                    </div>
                    <div class="post_content">
                        For the last 20 years, Google has been the main search...
                    </div>
                </div>
            </article>
        </div>
    </section>
</div>

<div class="certificates_part">
    <h2></h2>
    <h3>Certificates</h3>
    <h1></h1>
    <div class="certificates">
        <#list certificates as certificate>
            <div class="certificates_box">
                <a href="/certificates/${certificate.id?c}">
                    <img src="/images/${certificate.previewImgId?c}" alt="" class="certificate_img">
                    <#if user.isAdmin()>
                        <form action="/certificate/delete/${certificate.id?c}" method="post">
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
</div>


<div class="contact-me">
    <div class="text_zone_contact">
        <h4></h4>
        <h1>Contact me</h1>
        <div class="data_block">
            <form action="/message/send" method="post">
                <input type="text" class="name" name="sender" placeholder="Your email">
                <input type="text" class="messageSubject" name="messageSubject" placeholder="Subject">
                <div class="text_area">
                    <p class="message">Message</p>
                    <textarea name="message" rows="5" placeholder="Enter the text of the message..."></textarea>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit">Send</button>
            </form>
        </div>
    </div>
</div>


</div>
</body>
</html>