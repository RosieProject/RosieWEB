<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RosieWEB.Pages.Home" %>

<!DOCTYPE html>
<!--
 * A Design by GraphBerry
 * Author: GraphBerry
 * Author URL: http://graphberry.com
 * License: http://graphberry.com/pages/license
-->
<html lang="en">

<head>
    <meta charset=utf-8>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rosie</title>
    <!-- Load Roboto font -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <!-- Load css styles -->

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/pluton.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.cslider.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="css/animate.css" />
    -->
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/apple-touch-icon-72.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57.png">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
</head>

<body>
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a href="#" class="brand">
                    <img src="images/logo.png" alt="Logo" />
                    <!-- This is website logo -->
                </a>
                <!-- Navigation button, visible on small resolution -->
                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <i class="icon-menu"></i>
                </button>
                <!-- Main navigation -->
                <div class="nav-collapse collapse pull-right">
                    <ul class="nav" id="top-navigation">
                        <li class="active"><a href="#home">Home</a></li>
                        <li><a href="#service">Proposta</a></li>
                        <li><a href="#portfolio">FAQ</a></li>
                        <li><a href="#about">Equipe</a></li>
                        <li><a href="">Suporte</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                        <li><a href="Cadastro.aspx">Registre-se</a></li>

                        
                    </ul>
                </div>
                <!-- End main navigation -->
            </div>
        </div>
    </div>
    <!-- Start home section -->
    <div id="home">
        <!-- Start cSlider -->
        <div id="da-slider" class="da-slider">
            <div class="triangle"></div>
            <!-- mask elemet use for masking background image -->
            <div class="mask"></div>
            <!-- All slides centred in container element -->
            <div class="container">
                <!-- Start first slide -->
                <div class="da-slide">
                    <h2 class="fittext2">O que é Rosie ?</h2>
                    <h4>Monitoramento de hardware</h4>
                    <p>É um software para monitoramento do hardware do seu computador. Todas informações sobre seu hardware são guardadas e você pode acessá-las quando quiser</p>
                    <a href="#" class="da-link button">Read more</a>
                    <div class="da-img">
                        <img src="images/Slider01.png" alt="image01" width="320">
                    </div>
                </div>
                <!-- End first slide -->
                <!-- Start second slide -->
                <div class="da-slide">
                    <h2>Mobilidade</h2>
                    <h4>Acesso a qualquer momento</h4>
                    <p>Você tem acesso as informações de qualquer aparelho que possua. Precisando apenas de acesso a internet</p>
                    <a href="#" class="da-link button">Read more</a>
                    <div class="da-img">
                        <img src="images/Slider02.png" width="320" alt="image02">
                    </div>
                </div>
                <!-- End second slide -->
                <!-- Start third slide -->
                <div class="da-slide">
                    <h2>Registre-se</h2>
                    <h4>E deixe de se preocupar</h4>
                    <p>Nós monitoramos tudo para você poder relaxar. basta se cadastrar</p>
                    <!-- Colocar link para o registrar-se -->
                    <a href="#" class="da-link button">Click Aqui</a>
                    <div class="da-img">
                        <img src="images/Slider03.png" width="320" alt="image03">
                    </div>
                </div>
                <!-- Start third slide -->
                <!-- Start cSlide navigation arrows -->
                <div class="da-arrows">
                    <span class="da-arrows-prev"></span>
                    <span class="da-arrows-next"></span>
                </div>
                <!-- End cSlide navigation arrows -->
            </div>
        </div>
    </div>
    <!-- End home section -->
    <!-- Service section start -->
    <div class="section primary-section" id="service">
        <div class="container">
            <!-- Start title section -->
            <div class="title">
                <h1>Nos propomos a</h1>
                <!-- Section's title goes here -->
                <p></p>
                <!--Simple description for section goes here. -->
            </div>
            <div class="row-fluid">
                <div class="span4">
                    <div class="centered service">
                        <div class="circle-border zoom-in">
                            <img class="img-circle" src="images/Service1.png" alt="service 1">
                        </div>
                        <h3>Monitoramento</h3>
                        <p>Monitorarmos os computadores da sua empresa.</p>
                    </div>
                </div>
                <div class="span4">
                    <div class="centered service">
                        <div class="circle-border zoom-in">
                            <img class="img-circle" src="images/Service2.png" alt="service 2" />
                        </div>
                        <h3>Velocidade</h3>
                        <p>Fazendo com que ela tenha mais velocidade na resolução de problemas.</p>
                    </div>
                </div>
                <div class="span4">
                    <div class="centered service">
                        <div class="circle-border zoom-in">
                            <img class="img-circle" src="images/Service3.png" alt="service 3">
                        </div>
                        <h3>Lucro</h3>
                        <p>Evitando desperdício de tempo e dinheiro.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service section end -->
    <!-- Portfolio section start -->
    <div class="section secondary-section " id="portfolio">
        <div class="triangle"></div>
        <div class="container">
            <div class=" title">
                <h1>FAQ</h1>
                <p>Perguntas que recebemos com frequência.</p>
            </div>

            <!-- Start details for portfolio project 1 -->
            <div id="single-project">
                <div id="slidingDiv" class="toggleDiv row-fluid single-project">
                    <div class="span6">
                        <!-- img da resposta -->
                        <img src="images/Portfolio01-2.png" alt="project 1" />
                    </div>
                    <div class="span6">
                        <div class="project-description">
                            <div class="project-title clearfix">
                                <!-- texto FAQ 1 Titulo Resposta -->
                                <h3>Claro que sim</h3>
                                <span class="show_hide close">
                                    <i class="icon-cancel"></i>
                                </span>
                            </div>
                            <!-- Texto FAQ 1 Corpo da resposta -->
                            <p>Trabalhamos duro para que as informações de nossos clientes sejam preservadas.</p>
                        </div>
                    </div>
                </div>
                <!-- End details for portfolio project 1 -->

                <ul id="portfolio-grid" class="thumbnails row">
                    <li class="span4 mix web">
                        <div class="thumbnail">
                            <img src="images/Portfolio01-1.png" alt="project 1">
                            <a href="#single-project" class="more show_hide" rel="#slidingDiv">
                                <i class="icon-plus"></i>
                            </a>
                            <h3>Segurança</h3>
                            <p>Meus dados estão seguros ?</p>
                            <div class="mask"></div>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <!-- Portfolio section end -->
    <!-- About us section start -->
    <div class="section primary-section" id="about">
        <div class="triangle"></div>
        <div class="container">
            <div class="title">
                <h1>Quem somos nós</h1>
                <p>Time rosie.</p>
            </div>
            <div class="row-fluid team">
                <div class="span4" id="first-person">
                    <div class="thumbnail">
                        <img src="images/Team1.jpg" alt="team 1">
                        <h3>Lucas Antunes Campos</h3>
                        <ul class="social">
                            <li>
                                <a href="">
                                    <span class="icon-facebook-circled"></span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="icon-twitter-circled"></span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="icon-linkedin-circled"></span>
                                </a>
                            </li>
                        </ul>
                        <div class="mask">
                            <h2>Programador</h2>
                            <p>Aventureiro em HTML, CSS, JavaScript e Curioso em C#.</p>
                        </div>
                    </div>
                </div>
                <div class="span4" id="second-person">
                    <div class="thumbnail">
                        <img src="images/team2.jpg" alt="team 1">
                        <h3>Luiz Carlos</h3>
                        <ul class="social">
                            <li>
                                <a href="">
                                    <span class="icon-facebook-circled"></span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="icon-twitter-circled"></span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="icon-linkedin-circled"></span>
                                </a>
                            </li>
                        </ul>
                        <div class="mask">
                            <h2>Desenvolvedor</h2>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="span4" id="third-person">
                    <div class="thumbnail">
                        <img src="images/team3.jpg" alt="team 1"/>
                        <h3>Andressa Souza</h3>
                        <ul class="social">
                            <li>
                                <a href="">
                                    <span class="icon-facebook-circled"></span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="icon-twitter-circled"></span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="icon-linkedin-circled"></span>
                                </a>
                            </li>
                        </ul>
                        <div class="mask">
                            <h2>Desenvolvedor</h2>
                            <p></p>
                        </div>
                    </div>
                </div>
                <!-- sei que center esta defazado mais é uma gambiara não sei arrumar de outro jeito -->
                <center>
                    <div class="span4" id="first-person">
                        <div class="thumbnail">
                            <img src="images/team4.jpg" alt="team 1">
                            <h3>Caio Massayuki</h3>
                            <ul class="social">
                                <li>
                                    <a href="">
                                        <span class="icon-facebook-circled"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="icon-twitter-circled"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="icon-linkedin-circled"></span>
                                    </a>
                                </li>
                            </ul>
                            <div class="mask">
                                <h2>Desenvolvedor</h2>
                                <p></p>
                            </div>
                        </div>
                    </div>
                </center>
            </div>
            <div class="row-fluid team">

                <div class="about-text centered">
                    <h3>Sobre nós</h3>
                    <p>Todos somos alunos da faculdade Bandtec no curso de analise e desenvolvimento de sistemas.</p>
                </div>
            </div>
        </div>
        <!-- About us section end -->
        <!-- Footer section start -->
        <div class="footer">
            <p>&copy; 2013 Theme by <a href="http://www.graphberry.com">GraphBerry</a>, <a href="http://goo.gl/NM84K2">Documentation</a></p>
        </div>
        <!-- Footer section end -->
        <!-- ScrollUp button start -->
        <div class="scrollup">
            <a href="#">
                <i class="icon-up-open"></i>
            </a>
        </div>
        <!-- ScrollUp button end -->
        <!-- Include javascript -->
        <script src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.mixitup.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/modernizr.custom.js"></script>
        <script type="text/javascript" src="js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="js/jquery.cslider.js"></script>
        <script type="text/javascript" src="js/jquery.placeholder.js"></script>
        <script type="text/javascript" src="js/jquery.inview.js"></script>
        <!-- Load google maps api and call initializeMap function defined in app.js -->
        <script async="" defer="" type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=initializeMap"></script>
        <!-- css3-mediaqueries.js for IE8 or older -->
        <!--[if lt IE 9]>
            <script src="js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="js/app.js"></script>
</body>
</html>