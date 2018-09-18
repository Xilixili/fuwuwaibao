<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="entity.Job"%>
<%@ page import="dao.Dao"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>小型智能职业分析系统 — 精选事务</title>
	<link href="css/select2.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/style.css" />




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





	<!-- <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script> -->

	<!-- <script type="text/javascript" src="js/search/area.js"></script>
    <script type="text/javascript" src="js/search/location.js"></script>
    <script type="text/javascript" src="js/search/select2.js"></script>
    <script type="text/javascript" src="js/search/select2_locale_zh-CN.js"></script>
    <script type="text/javascript" src="js/jquery.touchSlider.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/ks-switch.pack.js"></script>

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.0.4/echarts-en.common.js"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.0.4/echarts-en.common.js

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

    "></script> -->



	<!-- 引入 echarts.js -->
	<!-- <script
        src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.0.4/echarts-en.common.js"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script> -->

	<%
		request.setCharacterEncoding("utf-8");//设置数据可以显示中文
		String user_name = "";

		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("user_name")) {
					user_name = c.getValue();
				}

			}
		}

		String rowkey = request.getParameter("rowkey");
		String job_name = request.getParameter("job_name");
		String job_link = request.getParameter("job_link");
	%>

</head>

<body class="bft_bg">

<script type="text/javascript">

    $(document).ready(function() {



        //公司画像
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));

        // 指定图表的配置项和数据
        var option = {
            title : {
                text : '公司画像'
            },
            tooltip : {},
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
                    }
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
                    name : '企业 ',
                    x : 380,
                    y : 350,
                    symbolSize : 80,
                }, {
                    name : '公司性质',
                    x : 355,
                    y : 360
                }, {
                    name : '规模',
                    x : 350,
                    y : 350
                }, {
                    name : '地点',
                    x : 355,
                    y : 340
                }, {
                    name : '五险一金',
                    x : 405,
                    y : 360
                }, {
                    name : '带薪假',
                    x : 410,
                    y : 350
                },
                {
                    name : 'sdgs',
                    x : 405,
                    y : 340
                } ],
                // links: [],
                links : [
                    {
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
                    }

                ],
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
        myChart.setOption(option);






        $.ajax({
            type : "post",

            url : "DaoJobInfoServlet02",

            dataType : "json", 				//返回数据形式为json

			/*容易出错  */
            data : {
                rowkey : "<%=rowkey%>"
            },

            success : function(result) {


                $(".com_name").html(result[0].job.com_name);
                $(".com_wel").html(result[0].job.com_wel);
                $(".com_prop").html(result[0].job.com_prop);
                $(".com_gm").html(result[0].job.com_gm);
                $(".creat_time").html(result[0].job.creat_time);
                $(".didian").html(result[0].job.com_adr);
                $(".job_name").html(result[0].job.job_name);
                $(".renshu").html(result[0].job.job_num);
                $(".xueli").html(result[0].job.self_xl);
                $(".jingyan").html(result[0].job.self_jy);
                $(".salary").html(result[0].job.job_sala);
                $(".job_desc").html(result[0].job.job_desc);
                $(".com_desc").html(result[0].job.com_desc);

                myChart.setOption({

                    series : [ {

                        data : [ {
                            name : result[0].job.com_name,
                            x : 380,
                            y : 350,
                            symbolSize : 120,
                        }, {
                            //jingyan
                            name : result[0].job.com_prop,
                            x : 355,
                            y : 360
                        }, {
                            //gender
                            name : result[0].job.com_gm,
                            x : 350,
                            y : 350
                        }, {

                            name : result[0].job.com_adr,
                            x : 355,
                            y : 340
                        }, {
                            name : result[0].job.welArr[0],
                            x : 405,
                            y : 360
                        }, {
                            name : result[0].job.welArr[1],
                            x : 410,
                            y : 350
                        }, {
                            name : result[0].job.welArr[2],
                            x : 405,
                            y : 340
                        } ],

                    } ]
                });

            },

            error : function(errorMsg) {
                alert("不好意思,请求数据失败啦!");
            }
        })

    });
</script>


<!-- top内容开始 -->
<div class="top">
	<div class="top_a">
		<div class="top_a3">
			您好，欢迎来到小型智能职业分析系统！ <span
				style="font-size: 14px; font-weight: bold; color: #424242">常州&nbsp;</span>[<input
				id="btn_nation" type="button" value="切换市区▼"
				onclick="nationSelect()" />]
		</div>
		<div class="top_a1">
			<div class="top_a2">
				<img src="images/help.jpg" />
			</div>
			<div class="top_a2">
				<img src="images/home.jpg" />
			</div>
			<div class="top_a2">
				<img src="images/join.jpg" />
			</div>
		</div>
	</div>

	<!-- top内容结束 -->

	<div class="center_blank"></div>
	<!-- 内容开始 -->
	<div class="nr">
		<div class="zzy_nr">
			<div class="zzy">
				<h3><%=job_name%></h3>
			</div>
			<div class="zzy_1">
				<ul>
					<li><span>☆</span>&nbsp;今天更新</li>
					<li><span>¤</span>&nbsp;0人浏览</li>
				</ul>
			</div>
			<div class="zzy_2">
				<table width="1200" border="1" cellspacing="1" cellpadding="1">
					<tr>
						<td>公司名称:<span class="com_name"></span></td>
						<td>公司福利:<span class="com_wel"></span></td>
					</tr>
					<tr>
						<td>公司性质：<span class="com_prop"></span></td>
						<td>公司规模：<span class="com_gm"></span></td>
					</tr>
					<tr>

						<td>成立时间：<span class="creat_time"></span></td>
						<td>工作地点：<span class="didian"></span></td>

					</tr>
					<tr>
						<td>职位名称：<span class="job_name"></span></td>
						<td>招聘人数：<span class="renshu"></span></td>
					</tr>

					<tr>
						<td>最低学历：<span class="xueli"></span></td>
						<td>经验要求：<span class="jingyan"></span></td>
						<td>月薪：<span class="salary"></span></td>
					</tr>


				</table>




				<!--公司画像  -->
				<div id="main2" style="width: 800px; height: 400px;"></div>





				<script type="text/javascript">

				</script>
				</br> </br>
			</div>
			<div class="zzy_4">
				<ul>
					<a href=<%=job_link%>><li>申请职位</li></a>
				</ul>
			</div>
			<div class="zzy_5">
				 <span class="">职位描述</span>
				<p class="job_desc"></p>
			</div>
			<div class="zzy_5">
				<p>
					<br> <span class="">公司介绍</span>
				<p class="com_desc"></p>
				</p>

			</div>
		</div>
		<div class="zzy_nra">
			<div class="zzy_8">
				<a href="#"><img src="images/logo.png" /></a>
			</div>
			<div class="zzy_6">职位推荐</div>
			<div class="zzy_7">
				<ul>
					<!-- <li><a href="zuihou.html">
                            <p>
                                <span>市场部专员</span>
                            </p>
                            <p>
                                <span>薪水：3000-5000元</span>
                            </p>
                    </a></li> -->






					<!--动态  -->
					<%
						Job job = new Job();
						Dao dao = new Dao();
						ArrayList<Job> list = dao.getAllJobs();

						if (list != null && list.size() > 0) {
							for (int i = 0; i < list.size(); i++) {
								if (i == 17) {
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
					<li><a
							href="zuihou.jsp?job_name=<%=job.getJob_name()%>&rowkey=<%=job.getRowkey()%>&job_link=<%=job.getJob_link()%>">
						<p>
							<span><%=job.getJob_name()%></span>
						</p>
						<p>
							<span>薪水：<%=job.getJob_sala()%></span>
						</p>
					</a></li>
					<%
							}
						} else {
							System.out.println("dao没有返回值！");
						}
					%>

				</ul>
			</div>
		</div>
		<!-- 内容结束 -->
		<!-- 友情链接开始 -->
		<div class="blank"></div>
		<div class="link">
			<div class="link_a">&nbsp;&nbsp;&nbsp;友情链接</div>
			<div class="link_b">
				<ul>
					<li><a href=""><img src="images/link_pic.jpg" /></a></li>
					<li><a href=""><img src="images/link_pic2.jpg" /></a></li>
					<li><a href=""><img src="images/link_pic3.jpg" /></a></li>
					<li><a href=""><img src="images/link_pic4.jpg" /></a></li>
					<li><a href=""><img src="images/link_pic.jpg" /></a></li>
					<li><a href=""><img src="images/link_pic2.jpg" /></a></li>
					<li><a href=""><img src="images/link_pic3.jpg" /></a></li>
				</ul>
			</div>
		</div>
		<!-- 友情链接结束 -->

		<!-- 底部内容开始 -->
		<div class="blank"></div>
		<div class="blank"></div>
		<div class="button">
			<a href="">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">商务合作</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="">网站声明</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a href="">联系方式</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="">服务中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">加入我们</a><br />
			版权所有@小型智能职业分析系统
		</div>
		<!-- 底部内容结束 -->
	</div>
	<div class="submenu"></div>
	<!-- 搜索内容结束 -->

</div>
<!-- 帮众结束 -->


<!-- alpha div -->
<div id="maskLayer" style="display: none;">
	<iframe id="maskLayer_iframe" frameBorder=0 scrolling=no
			style="filter: alpha(opacity = 50)"></iframe>
	<div id="alphadiv"
		 style="filter: alpha(opacity = 50); -moz-opacity: 0.5; opacity: 0.5"></div>
	<div id="drag">
		<h3 id="drag_h"></h3>
		<div id="drag_con"></div>
		<!-- drag_con end -->
	</div>
</div>
<!-- maskLayer end -->
</div>
<!-- alpha div end -->

</body>
</html>
