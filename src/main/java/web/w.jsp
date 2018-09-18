<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="entity.Job"%>
<%@ page import="dao.Dao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.*"%>
<%@ page import="entity.User" %>
<%@ page import="dao.DaoUser" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>小型智能职业分析系统-主页</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/templatemo-style.css">
	<script src="js/vendor/modernizr-2.6.2.min.js"></script>
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.0.4/echarts-en.common.js"></script>
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="js/vendor/modernizr-2.6.2.min.js"></script>
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.0.4/echarts-en.common.js

"></script>
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js

"></script>
	<script type="text/javascript"
			src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js

"></script>
	<script type="text/javascript"
			src="http://echarts.baidu.com/gallery/vendors/simplex.js

"></script>


	<%
		request.setCharacterEncoding("utf-8");
		String user_name = "";
		String name ="";

		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("user_name")) {
					user_name = c.getValue();
					System.out.print(user_name);
				}
				System.out.print(user_name);
			}
			DaoUser dao = new DaoUser();
			List<User> list = dao.query(user_name);
			name=list.get(0).getReal_name();

		}

	/* user_name="lala"; */

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
	</div>
	<!-- top-section -->
	<div class="main-navigation">
		<ul class="navigation">
			<li><a href="#top"><i class="fa fa-globe"></i>欢迎来到主页</a></li>
			<li><a href="#about"><i class="fa fa-pencil"></i>数据分析</a></li>
			<li><a href="#projects"><i class="fa fa-paperclip"></i>匹配结果</a></li>
			<li><a href="#contact"><i class="fa fa-link"></i>联系我们</a></li>
			<li><a href=""><i class="fa fa-link"></i>修改简历</a></li>
		</ul>
	</div>
	<!-- .main-navigation -->
	<div class="social-icons">
		<ul>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube"></i></a></li>
			<li><a href="#"><i class="fa fa-rss"></i></a></li>
		</ul>
	</div>
	<!-- .social-icons -->
</div>
<!-- .sidebar-menu -->

<div class="banner-bg" id="top">
	<div class="banner-overlay"></div>
	<div class="welcome-text">
		<h2>小型智能职业分析系统</h2>
		<h5>小型智能职业分析系统通过对大数据的分析，并且根据您提供的工作信息，为你匹配出最适合你的职业岗位！</h5>
	</div>
</div>

<!-- MAIN CONTENT -->
<div class="main-content">
	<div class="fluid-container">

		<div class="content-wrapper">

			<!-- ABOUT -->
			<div class="page-section" id="about">
				<div class="row">
					<div class="col-md-12">
						<h4 class="widget-title">数据分析</h4>
						<!--<div class="about-image">
                    <img src="img/8.jpg" alt="about me">
                </div>-->
						<p>以下是系统通过数据分析为您提供的一些信息</p>
						</br>
						<!-- 为ECharts准备一个具备大小（宽高）的Dom -->






						<!--第一个，热点企业  -->
						</br> </br>
						<div id="main1" style="width: 1250px; height: 500px;"></div>









						<!--第二个，用户画像  -->
						</br> </br>
						<div id="main2" style="width: 800px; height: 400px;"></div>
						</br> </br>










						<!--第三个，岗位能力需求图  -->
						<div id="main3"
							 style="width: 800px; height: 400px; text-align: center;"></div>

						</br> </br>










						<!--第四个，sala1  -->
						<div id="main4"
							 style="width: 800px; height: 400px; text-align: center;"></div>

						<br> <br>










						<!--sala2  -->
						<div>
							<div>
								<div>
									<h2>
										根据当前数据，系统为您预测的薪水是：&nbsp;<span id="yucexinshui"></span>
									</h2>
								</div>
								<br> <span>根据当前系统分析，我们为你提供一套加薪方案：</span>
							</div>
							<br>


							<table width="400" border="1" cellspacing="1" cellpadding="1">
								<tr>
									<td><span>能力</span></td>
									<td><span>加薪权重</span></td>
								</tr>
								<tr>
									<td><span class="ab_01"></span></td>
									<td><span class="wgt_01"></span></td>
								</tr>
								<tr>
									<td><span class="ab_02"></span></td>
									<td><span class="wgt_02"></span></td>
								</tr>
								<tr>
									<td><span class="ab_03"></span></td>
									<td><span class="wgt_03"></span></td>
								</tr>
								<tr>
									<td><span class="ab_04"></span></td>
									<td><span class="wgt_04"></span></td>
								</tr>

							</table>
							<br>
							<div>
								.........:&nbsp;<span id="xinshuiyuce"></span>
							</div>
							<br>

						</div>


						<script type="text/javascript">

                            //sala2
                            $(document)
                                .ready(
                                    function() {
                                        $
                                            .ajax({
                                                type : "post",

                                                url : "DaoUserInfoServlet03",

                                                dataType : "json", //返回数据形式为json

                                                data : {
                                                    user_name : user_name
                                                },

                                                async : false,

                                                success : function(
                                                    result) {//sala连接表
                                                    $(".ab_01")
                                                        .html(
                                                            "数据挖掘");
                                                    $(".ab_02")
                                                        .html(
                                                            result[0].sala23.ability);
                                                    $(".ab_03")
                                                        .html(
                                                            "数据仓库");
                                                    $(".ab_04")
                                                        .html(
                                                            result[0].sala25.ability);
                                                    $(".wgt_01")
                                                        .html(
                                                            result[0].sala22.weight);
                                                    $(".wgt_02")
                                                        .html(
                                                            result[0].sala23.weight);
                                                    $(".wgt_03")
                                                        .html(
                                                            result[0].sala24.weight);
                                                    $(".wgt_04")
                                                        .html(
                                                            result[0].sala25.weight);
                                                    $(
                                                        "#yucexinshui")
                                                        .html(
                                                            result[0].yuce.sala);
                                                },
                                                error : function(
                                                    errorMsg) {
                                                    alert("不好意思,请求sala2数据失败啦!");
                                                }
                                            })
                                    });










                            //第一个，热点企业
                            // 基于准备好的dom，初始化echarts实例
                            var myChart1 = echarts.init(document
                                .getElementById('main1'));

                            // 指定图表的配置项和数据
//                            var option1 = {
//                                title : {
//                                    text : '热点企业及访问量',
//                                    x : 'center'
//                                },
//                                color : [ '#3398DB' ],
//                                tooltip : {
//                                    trigger : 'axis',
//                                    axisPointer : { // 坐标轴指示器，坐标轴触发有效
//                                        type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
//                                    }
//                                },
//                                grid : {
//                                    left : '3%',
//                                    right : '4%',
//                                    bottom : '3%',
//                                    containLabel : true
//                                },
//                                xAxis : [ {
//                                    type : 'category',
//                                    data : [ '源极光科技有限公司', '网谱数据服务有限公司', '博悦科技有限公司', '博睿斯科技有限公司',
//                                        '艾科科技section有限公司', '生联计算机软件有限公司', '我爱我家集团' ],
//                                    axisTick : {
//                                        alignWithLabel : true
//                                    }
//                                } ],
//                                yAxis : [ {
//                                    type : 'value'
//                                } ],
//                                series : [ {
//                                    name : '访问量',
//                                    type : 'bar',
//                                    barWidth : '60%',
//                                    data : [ 22, 15, 14, 11, 8, 5,
//                                        3 ]
//                                } ]
//                            };

                            option1 = {
                                title : {
                                    text: '热点企业及访问量',
                                    subtext: '数据来自实时统计'
                                },
                                color : [ '#3398DB' ],
                                tooltip : {
                                    trigger: 'axis'
                                },
                                legend: {
                                    data:['访问量']
                                },
                                toolbox: {
                                    show : true,
                                    feature : {
                                        mark : {show: true},
                                        magicType: {show: true, type: ['line', 'bar']},
                                        saveAsImage : {show: true}
                                    }
                                },
                                calculable : true,
                                xAxis : [
                                    {
                                        type : 'value',
                                        boundaryGap : [0, 0.01]
                                    }
                                ],
                                yAxis : [
                                    {
                                        type : 'category',
                                        data : ['源极光科技有限公司', '网谱数据服务有限公司', '博悦科技有限公司', '博睿斯科技有限公司', '艾科科技有限公司', '生联计算机软件有限公司', '我爱我家集团']
                                    }
                                ],
                                series : [
                                    {
                                        name:'访问量',
                                        type:'bar',
                                        data:[22, 15, 14, 11, 8, 5, 3]
                                    }

                                ]
                            };


                            // 使用刚指定的配置项和数据显示图表。
                            myChart1.setOption(option1);

                            //第二个,用户画像
                            // 基于准备好的dom，初始化echarts实例
                            var myChart2 = echarts.init(document
                                .getElementById('main2'));

                            // 指定图表的配置项和数据
                            var option2 = {
                                title : {
                                    text : '我的求职画像',
                                    x : 'center'
                                },
                                tooltip : {},
                                toolbox: {

                                        saveAsImage : {show: true}
                                    },
                                animationDurationUpdate : 1500,
                                animationEasingUpdate : 'quinticInOut',
                                series : [ {
                                    type : 'graph',
                                    layout : 'none',
                                    symbolSize : 50,
                                    roam : true,
                                    label : {
                                        normal : {
                                            show : true
                                        },
                                    },
                                    edgeSymbol : [ 'circle', ],
                                    edgeSymbolSize : [ 4, 10 ],
                                    edgeLabel : {
                                        normal : {
                                            textStyle : {
                                                fontSize : 20
                                            }
                                        }
                                    },
                                    data : [ {
                                        name : '用户 ',
                                        x : 400,
                                        y : 350,
                                        symbolSize : 80,
                                    }, {
                                        name : '1~3年',
                                        x : 345,
                                        y : 360
                                    }, {
                                        name : '男',
                                        x : 340,
                                        y : 340
                                    }, {
                                        name : '本科',
                                        x : 360,
                                        y : 320
                                    }, {
                                        name : '广州',
                                        x : 400,
                                        y : 310
                                    }, {
                                        name : '清华大学',
                                        x : 430,
                                        y : 320
                                    }, {
                                        name : '软件工程专业',
                                        x : 460,
                                        y : 340
                                    }, {
                                        name : 'Java开发 ',
                                        x : 400,
                                        y : 390

                                    } ],
                                    // links: [],
                                    links : [ {
                                        source : 0,
                                        target : 1
                                    }, {
                                        source : 0,
                                        target : 2
                                    }, {
                                        source : 0,
                                        target : 3
                                    }, {
                                        source : 0,
                                        target : 4
                                    }, {
                                        source : 0,
                                        target : 5
                                    }, {
                                        source : 0,
                                        target : 6
                                    }, {
                                        source : 0,
                                        target : 7
                                    }, {
                                        source : 0,
                                        target : 8
                                    }, {
                                        source : 0,
                                        target : 9
                                    } ],
                                    lineStyle : {
                                        normal : {
                                            opacity : 0.9,
                                            width : 2,
                                            curveness : 0
                                        }
                                    }
                                } ]
                            };

                            // 使用刚指定的配置项和数据显示图表。
                            myChart2.setOption(option2);

                            //第三个,岗位能力需求图
                            // 基于准备好的dom，初始化echarts实例
                            var myChart3 = echarts.init(document
                                .getElementById('main3'));

                            // 指定图表的配置项和数据
                            var option3 = {
                                title : {
                                    text : '岗位能力需求图',
                                    x : 'center'
                                },
                                tooltip : {
                                    trigger : 'item',
                                    formatter : "{a} <br/>{b} : {c} ({d}%)"
                                },
                                legend : {
                                    orient : 'vertical',
                                    left : 'left',
                                    data : [ '能力1', '能力2', '能力3', '能力4' ]
                                },
                                series : [ {
                                    name : '能力',
                                    type : 'pie',
                                    radius : '55%',
                                    center : [ '50%', '60%' ],
                                    data : [ {
                                        value : 335,
                                        name : '能力1'
                                    }, {
                                        value : 310,
                                        name : '能力2'
                                    }, {
                                        value : 234,
                                        name : '能力3'
                                    }, {
                                        value : 135,
                                        name : '能力4'
                                    }, ],
                                    itemStyle : {
                                        emphasis : {
                                            shadowBlur : 10,
                                            shadowOffsetX : 0,
                                            shadowColor : 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                } ]
                            };

                            // 使用刚指定的配置项和数据显示图表。
                            myChart3.setOption(option3);

                            //第四个,sala1
                            // 基于准备好的dom，初始化echarts实例
                            var myChart4 = echarts.init(document
                                .getElementById('main4'));

                            // 指定图表的配置项和数据
                            var option4 = {
                                title : {
                                    text : '薪水影响因素分析',
                                    x : 'center'
                                },
                                tooltip : {
                                    trigger : 'item',
                                    formatter : "{a} <br/>{b} : {c} ({d}%)"
                                },
                                legend : {
                                    orient : 'vertical',
                                    left : 'left',
                                    data : [ '能力1', '能力2', '能力3', '能力4' ]
                                },
                                series : [ {
                                    name : '影响因素',
                                    type : 'pie',
                                    radius : '55%',
                                    center : [ '50%', '60%' ],
                                    data : [ {
                                        value : 335,
                                        name : '能力1'
                                    }, {
                                        value : 310,
                                        name : '能力2'
                                    }, {
                                        value : 234,
                                        name : '能力3'
                                    }, {
                                        value : 135,
                                        name : '能力4'
                                    }, ],
                                    itemStyle : {
                                        emphasis : {
                                            shadowBlur : 10,
                                            shadowOffsetX : 0,
                                            shadowColor : 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                } ]
                            };
                            // 使用刚指定的配置项和数据显示图表。
                            myChart4.setOption(option4);

                            //从servlet传数据
                            $
                                .ajax({

                                    type : "post",
                                    url : "DaoUserInfoServlet03",
                                    dataType : "json", //返回数据形式为json

                                    data : {
                                        user_name : "<%=user_name %>"
                                    },

                                    success : function(result) {

                                        //sala2
                                        $(".ab_01")
                                            .html(
                                                "数据挖掘");
                                        $(".ab_02")
                                            .html(
                                                "数据仓库");
                                        $(".ab_03")
                                            .html(
                                                result[0].sala24.ability);
                                        $(".ab_04")
                                            .html(
                                                "团队协作能力");
                                        $(".wgt_01")
                                            .html(
                                                result[0].sala22.weight);
                                        $(".wgt_02")
                                            .html(
                                                result[0].sala23.weight);
                                        $(".wgt_03")
                                            .html(
                                                result[0].sala24.weight);
                                        $(".wgt_04")
                                            .html(
                                                result[0].sala25.weight);
                                        $("#yucexinshui").html(
                                            result[0].yuce.sala);

                                        //第一个图，热点企业
										/* myChart1
										 .setOption({
										 xAxis : [ {
										 data : [
										 result[0].fangwenliang.company_name_01,
										 result[0].fangwenliang.company_name_02,
										 result[0].fangwenliang.company_name_03,
										 result[0].fangwenliang.company_name_04,
										 result[0].fangwenliang.company_name_05,
										 result[0].fangwenliang.company_name_06,
										 result[0].fangwenliang.company_name_07 ]
										 } ],

										 series : [ {
										 name : '访问量',
										 type : 'bar',
										 barWidth : '60%',
										 data : [
										 result[0].fangwenliang.company_name_01_fwl,
										 result[0].fangwenliang.company_name_02_fwl,
										 result[0].fangwenliang.company_name_03_fwl,
										 result[0].fangwenliang.company_name_04_fwl,
										 result[0].fangwenliang.company_name_05_fwl,
										 result[0].fangwenliang.company_name_06_fwl,
										 result[0].fangwenliang.company_name_07_fwl ]
										 } ]
										 }); */

                                        //第二个图，用户画像
										/* myChart2
										 .setOption({
										 series : [ {
										 type : 'graph',
										 layout : 'none',
										 symbolSize : 50,
										 roam : true,
										 label : {
										 normal : {
										 show : true
										 }
										 },
										 edgeSymbol : [
										 'circle', ],
										 edgeSymbolSize : [
										 4, 10 ],
										 edgeLabel : {
										 normal : {
										 textStyle : {
										 fontSize : 20
										 }
										 }
										 },
										 data : [
										 {
										 name : '用户 ',
										 x : 400,
										 y : 350,
										 symbolSize : 80,
										 },
										 {
										 //jingyan
										 name : result[0].user.jingyan,
										 x : 345,
										 y : 360
										 },
										 {
										 //gender
										 name : result[0].user.gender,
										 x : 340,
										 y : 340
										 },
										 {

										 name : result[0].user.xueli,
										 x : 360,
										 y : 320
										 },
										 {
										 name : result[0].user.didian,
										 x : 400,
										 y : 310
										 },
										 {
										 name : result[0].user.school,
										 x : 430,
										 y : 320
										 },
										 {
										 name : result[0].user.zhuanye,
										 x : 460,
										 y : 340
										 },
										 {
										 name : result[0].user.nengliArr[0],
										 x : 400,
										 y : 390

										 },

										 {
										 name : result[0].user.nengliArr[1],
										 x : 360,
										 y : 385
										 },

										 {
										 name : result[0].user.nengliArr[2],
										 x : 440,
										 y : 385
										 }

										 ],
										 } ]
										 }), */








                                        myChart2
                                            .setOption({

                                                series : [ {

                                                    data : [ {
                                                        name : '用户 <%=name%>',
                                                        x : 600,
                                                        y : 550,
                                                        symbolSize : 100,
                                                    },
                                                        {
                                                            //jingyan
                                                            name : result[0].user.jingyan,
                                                            x : 540,
                                                            y : 580
                                                        },
                                                        {
                                                            //gender
                                                            name : result[0].user.gender,
                                                            x : 540,
                                                            y : 550
                                                        },
                                                        {

                                                            name : result[0].user.xueli,
                                                            x : 660,
                                                            y : 580
                                                        },
                                                        {
                                                            name : result[0].user.didian,
                                                            x : 540,
                                                            y : 520
                                                        },
                                                        {
                                                            name : result[0].user.school,
                                                            x : 660,
                                                            y : 550
                                                        },
                                                        {
                                                            name : result[0].user.zhuanye,
                                                            x : 660,
                                                            y : 520
                                                        },
                                                        {
                                                            name : result[0].user.nengliArr[0],
                                                            x : 600,
                                                            y : 620

                                                        },

                                                        {
                                                            name : result[0].user.nengliArr[1],
                                                            x : 570,
                                                            y : 620
                                                        },

                                                        {
                                                            name : result[0].user.nengliArr[2],
                                                            x : 630,
                                                            y : 620
                                                        } ],
                                                    // links: [],


                                                } ]
                                            });

                                        //第三个图，岗位能力需求
                                        myChart3
                                            .setOption({
                                                legend : {
                                                    data : [
                                                        "Spark",
                                                        "数据挖掘",
                                                        "Python",
                                                        result[0].ability5.ability ]
                                                },
                                                series : [ {
                                                    data : [
                                                        {
                                                            value : 9.7,
                                                            name : "Spark"//9.7
                                                        },
                                                        {
                                                            value : result[0].ability3.weight,//6.75
                                                            name:"数据挖掘"
                                                        },
                                                        {
                                                            value : result[0].ability4.weight,
                                                            name : "Python"
                                                        },
                                                        {
                                                            value : result[0].ability5.weight,
                                                            name : result[0].ability5.ability
                                                        } ],
                                                } ]
                                            });


                                        //第四个图，sala1
                                        myChart4
                                            .setOption({
                                                legend : {
                                                    data : [
                                                        "Spark",
                                                        "工作地点",
                                                        "工作经验",
                                                        result[0].sala14.ability,
                                                        result[0].sala15.ability,
														"学历"]
                                                },
                                                series : [ {
                                                    data : [
                                                        {
                                                            value : result[0].sala12.weight,
                                                            name : "Spark"
                                                        },

                                                        {
                                                            value : "9.4",//9.4
                                                            name : "工作地点"
                                                        },

                                                        {
                                                            value : "12.6",
                                                            name : "工作经验"
                                                        },

                                                        {
                                                            value : result[0].sala14.weight,
                                                            name : result[0].sala14.ability//6.3
                                                        },
                                                        {
                                                            value : result[0].sala15.weight,
                                                            name : result[0].sala15.ability//5.4
                                                        },
														{
														    value:"8.45",//8.45
															name:"学历"
														}],
                                                } ]
                                            });




                                    },
                                    error : function(errorMsg) {
                                        alert("不好意思,请求数据失败啦!");
                                    }
                                });
						</script>

						</br>

						<hr>
					</div>
				</div>
				<!-- #about -->
			</div>

			<!-- PROJECTS -->
			<div class="page-section" id="projects">
				<div class="row">
					<div class="col-md-12">
						<h4 class="widget-title">匹配结果</h4>
						<p>以下是根据您提供的简历信息，系统为您自动匹配出最适合您的职位</p>
					</div>
				</div>


				<h4 class="widget-title">
					<a href="search.jsp">搜索</a>
				</h4>
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
					ArrayList<Job> list = dao.getAllJobs();

					if (list != null && list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {
							if (i == 9) {
								break;
							} //提取表中前面九条信息
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
								<a
										href="zuihou.jsp?rowkey=<%=job.getRowkey()%>&job_name=<%=job.getJob_name()%>&job_link=<%=job.getJob_link()%>"
										target="_blank">点击了解更多</a>
								<h5>
									<a><%=job.getJob_name()%></a>
								</h5>
								<p>
									薪水：<%=job.getJob_sala()%></p>
								<p>
									匹配度：<%=job.getWeight()%></p>
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


				<br> <br>
				<hr>

				<!-- CONTACT -->
				<div class="page-section" id="contact">
					<div class="row">
						<div class="col-md-12">
							<h4 class="widget-title">联系我们 留下你的建议</h4>
							<p>倘若你在使用过程中遇到问题，或有什么好的建议，都可以联系我们哦！</p>
						</div>
					</div>
					<div class="row">
						<form action="#" method="post" class="contact-form">
							<fieldset class="col-md-4 col-sm-6">
								<input type="text" id="your-name" placeholder="您的姓名...">
							</fieldset>
							<fieldset class="col-md-4 col-sm-6">
								<input type="email" id="email" placeholder="您的邮箱...">
							</fieldset>
							<fieldset class="col-md-4 col-sm-12">
								<input type="text" id="your-subject" placeholder="问题类型...">
							</fieldset>
							<fieldset class="col-md-12 col-sm-12">
									<textarea name="message" id="message" cols="30" rows="6"
											  placeholder="留下你的建议或问题..."></textarea>
							</fieldset>
							<fieldset class="col-md-12 col-sm-12">
								<input type="submit" class="button big default" value="发送消息">
							</fieldset>
						</form>
					</div>
					<!-- .contact-form -->
				</div>
				<hr>

				<div class="row" id="footer">
					<div class="col-md-12 text-center">
						<p class="copyright-text">Copyright &copy; 小型智能职业分析系统 | More
							Templates</p>
					</div>
				</div>

			</div>

		</div>
	</div>

	<script src="js/vendor/jquery-1.10.2.min.js"></script>
	<script src="js/min/plugins.min.js"></script>
	<script src="js/min/main.min.js"></script>
</div>
</body>
</html>