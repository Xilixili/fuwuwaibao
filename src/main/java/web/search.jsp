<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="entity.Job"%>
<%@ page import="dao.Dao"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

    <title>Insert title here</title>

    <style type="text/css">
        #wrap {
            width: 900px;
            margin-top: 60px;
            margin-left: 100px;
        }

        #search_result {
            width: 900px;

            margin-left: 100px;
            margin-right: 100px;
            margin-bottom: 100px;
        }

        body, input, button {
            /* font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; */

        }

        .container {
            margin: 300px auto 40px auto;
            width: 800px;
            text-align: center;
        }

        a {
            color: #4183c4;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        h3 {
            color: #666;
        }

        ul {
            list-style: none;
            padding: 25px 0;
        }

        li {
            display: inline;
            margin: 10px 50px 10px 0px;
        }

        input[type=text], input[type=password] {
            font-size: 13px;
            min-height: 32px;
            margin: 0;
            padding: 7px 8px;
            outline: none;
            color: #333;
            background-color: #fff;
            background-repeat: no-repeat;
            background-position: right center;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.075);
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            transition: all 0.15s ease-in;
            -webkit-transition: all 0.15s ease-in 0;
            vertical-align: middle;
        }

        .button {
            position: relative;
            display: inline-block;
            margin: 0;
            padding: 8px 15px;
            font-size: 13px;
            font-weight: bold;
            color: #333;
            text-shadow: 0 1px 0 rgba(255, 255, 255, 0.9);
            white-space: nowrap;
            background-color: #eaeaea;
            background-image: -moz-linear-gradient(#fafafa, #eaeaea);
            background-image: -webkit-linear-gradient(#fafafa, #eaeaea);
            background-image: linear-gradient(#fafafa, #eaeaea);
            background-repeat: repeat-x;
            border-radius: 3px;
            border: 1px solid #ddd;
            border-bottom-color: #c5c5c5;
            box-shadow: 0 1px 3px rgba(0, 0, 0, .05);
            vertical-align: middle;
            cursor: pointer;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-appearance: none;
        }

        .button:hover, .button:active {
            background-position: 0 -15px;
            border-color: #ccc #ccc #b5b5b5;
        }

        .button:active {
            background-color: #dadada;
            border-color: #b5b5b5;
            background-image: none;
            box-shadow: inset 0 3px 5px rgba(0, 0, 0, .15);
        }

        .button:focus, input[type=text]:focus, input[type=password]:focus {
            outline: none;
            border-color: #51a7e8;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, .075), 0 0 5px
            rgba(81, 167, 232, .5);
        }

        label[for=search] {
            display: block;
            text-align: left;
        }

        #search label {
            font-weight: 200;
            padding: 5px 0;
        }

        #search input[type=text] {
            font-size: 18px;
            width: 705px;
        }

        #search .button {
            padding: 10px;
            width: 90px;
        }
    </style>


    <%
        request.setCharacterEncoding("utf-8");
        String user_name = "";

        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user_name")) {
                    user_name = c.getValue();//获得user_name
                }

            }
        }

        //String job_name = request.getParameter("job_name");
    %>

</head>
<body>


<!-- SIDEBAR -->
<div class="sidebar-menu hidden-xs hidden-sm">
    <div class="top-section">
        <div class="profile-image">
            <img src="img/profile.jpg" alt="Volton">
        </div>
        <h3 class="profile-title"><%=user_name%></h3>
        <p class="profile-description">VIP用户</p>
    </div>
    <!-- top-section -->
    <div class="main-navigation">
        <ul class="navigation">
            <li><a href="#top"><i class="fa fa-globe"></i>欢迎来到搜索页</a></li>
            <!-- <li><a href="#about"><i class="fa fa-pencil"></i>数据分析</a></li>
            <li><a href="#projects"><i class="fa fa-paperclip"></i>匹配结果</a></li>
            <li><a href="#contact"><i class="fa fa-link"></i>联系我们</a></li> -->
        </ul>
    </div>
    <!-- .main-navigation -->
    <!-- <div class="social-icons">
        <ul>
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
            <li><a href="#"><i class="fa fa-youtube"></i></a></li>
            <li><a href="#"><i class="fa fa-rss"></i></a></li>
        </ul>
    </div> -->
    <!-- .social-icons -->
</div>


<!-- 搜索栏 -->
<div class="main-content">

    <div id="wrap">

        <div>
            <span>您可以输入岗位以搜索(没有内容则搜索前18个 )</span>
        </div>
        <br>
        <div>
            <form action="#">
                <div id="search">

                    <input type="text" name="job_name"> <input class="button"
                                                               type="submit" value="Search">
                </div>
            </form>
        </div>
    </div>



    <!-- 搜索结果 -->
    <div id="search_result">

        <!-- PROJECTS -->
        <div class="page-section" id="projects">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="widget-title">搜索结果</h4>

                </div>
            </div>
            <!-- <div class="row projects-holder">
                     <script type="text/javascript">
                        $(document)
                                .ready(
                                        function() {
                                            $
                                                    .ajax({
                                                        type : "post",

                                                        url : "DaoJobInfoServlet02",

                                                        dataType : "json", //返回数据形式为json

                                                        success : function(
                                                                result) {
                                                            alert("连接servlet成功");
                                                            $(".job_name")
                                                                    .html(
                                                                            result[0].job.job_name);
                                                            $(".salary")
                                                                    .html(
                                                                            result[0].job.salary);
                                                            $(".renshu")
                                                                    .html(
                                                                            result[0].job.renshu);
                                                            $(".xueli")
                                                                    .html(
                                                                            result[0].job.xueli);
                                                            $(".jingyan")
                                                                    .html(
                                                                            result[0].job.jingyan);
                                                            $(".nianling")
                                                                    .html(
                                                                            result[0].job.nianling);
                                                            $(".didian")
                                                                    .html(
                                                                            result[0].job.didian);
                                                            $(".dianhua")
                                                                    .html(
                                                                            result[0].job.dianhua);
                                                            $(".lianxiren")
                                                                    .html(
                                                                            result[0].job.lianxiren);
                                                        }
                                                    })
                                        });
                    </script> -->




            <%

                Job job = new Job();
                Dao dao = new Dao();
                ArrayList<Job> list = dao.SearchJobs(request.getParameter("job_name"));

                if (list != null && list.size() > 0) {
                    for (int i = 0; i < list.size(); i++) {
                        if (i == 18) {
                            break;
                        }
                        job.setRowkey(list.get(i).getRowkey());
                        job.setJob_name(list.get(i).getJob_name());
                        job.setWeight(list.get(i).getWeight());
                        job.setJob_link(list.get(i).getJob_link());
                        job.setJob_num(list.get(i).getJob_num());
                        job.setJob_fkl(list.get(i).getJob_fkl());
                        job.setCom_desc(list.get(i).getCom_desc());
                        job.setCom_wel(list.get(i).getCom_wel());
                        job.setCom_name(list.get(i).getCom_name());
                        job.setCom_link(list.get(i).getCom_link());
                        job.setJob_sala(list.get(i).getJob_sala());
                        job.setCom_adr(list.get(i).getCom_adr());
                        job.setCreate_time(list.get(i).getCreate_time());
                        job.setCom_gm(list.get(i).getCom_gm());
                        job.setSelf_jy(list.get(i).getSelf_jy());
                        job.setSelf_xl(list.get(i).getSelf_xl());
                        job.setJob_desc(list.get(i).getJob_desc());
            %>


            <div class="col-md-4 col-sm-6">
                <div class="project-item">
                    <img src="img/1.jpg" alt="">
                    <div class="project-hover">
                        <div class="inside">
                            <a href="zuihou.jsp?job_name=<%=job.getJob_name()%>&rowkey=<%=job.getRowkey()%>"
                               target="_blank">点击了解更多</a>
                            <h5>
                                <a><%=job.getJob_name()%></a>
                            </h5>
                            <p>薪水：<%=job.getJob_sala()%></p>
                            <p>匹配度：<%=job.getWeight()%></p>
                        </div>
                    </div>
                </div>
            </div>

            <%
                    }
                } else {
                    System.out.println("dao没有返回值！");
                }
            %>
        </div>
    </div>

</div>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="row" id="footer">
    <div class="col-md-12 text-center">
        <p class="copyright-text">Copyright &copy; 小型智能职业分析系统 | More
            Templates</p>
    </div>
</div>
</body>
</html>