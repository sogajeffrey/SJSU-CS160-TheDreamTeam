<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Document   : discuss
    Created on : Dec 4, 2014, 1:36:00 PM
    Author     : Srikanth
--%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Discuss</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.dropotron.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-wide.css" />
        </noscript>
    </head><body>

        <%@ include file="nav.jsp" %> 

        <section class="wrapper style1">
            <div class="container">
                <div id="content"> 
                    <section id="main" class="container small">
                        <header>
                            <h2>Join the conversation with other tennis enthusiasts!</h2>
                        </header>
                    </section>
                    <div id="disqus_thread"></div>
                    <script type="text/javascript">
                        var disqus_shortname = 'rqdt';
                        var disqus_identifier = 'general';
                        (function () {
                            var dsq = document.createElement('script');
                            dsq.type = 'text/javascript';
                            dsq.async = true;
                            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                        })();
                    </script>
                    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                </div>
            </div>
        </section>
    </body>
</html>
