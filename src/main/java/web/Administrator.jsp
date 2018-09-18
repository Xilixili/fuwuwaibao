<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Job"%>
<%@ page import="dao.Dao"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>小型智能职业分析系统-Administrator主页</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css1/normalize.css">
<link rel="stylesheet" href="css1/font-awesome.css">
<link rel="stylesheet" href="css1/bootstrap.min.css">
<link rel="stylesheet" href="css1/templatemo-style.css">
<link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<!-- Buttons 库的核心文件 -->
	<link rel="stylesheet" href="css/buttons.css">
<script src="js1/vendor/modernizr-2.6.2.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.0.4/echarts-en.common.js"></script>
<script type="text/javascript" src="js1/jquery-1.4.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css1/style.css" />
<script src="js1/react.min.js"></script>
<script src="js1/react-dom.min.js"></script>
<script src="js1/TweenMax.min.js"></script>


</head>
<body>


	<div class="responsive-header visible-xs visible-sm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="top-section">
						<div class="profile-image">
							<img src="images/profile.jpg" alt="Volton">
						</div>
						<div class="profile-content">
							<h3 class="profile-title">Administrator</h3>
							<p class="profile-description">管理员</p>
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>
			<div class="main-navigation responsive-menu">
				<ul class="navigation">
					<li><a href="#top"><i class="fa fa-home"></i>欢迎来到管理员主页</a></li>
					<li><a href="#about"><i class="fa fa-user"></i>管理调控</a></li>
					<!-- <li><a href="#projects"><i class="fa fa-newspaper-o"></i>匹配结果</a></li> -->
					<li><a href="#contact"><i class="fa fa-envelope"></i>联系我们</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- SIDEBAR -->
	<div class="sidebar-menu hidden-xs hidden-sm">
		<div class="top-section">
			<div class="profile-image">
				<img src="images/profile.jpg" alt="Volton">
			</div>
			<h3 class="profile-title">Administrator</h3>
			<p class="profile-description">管理员</p>
		</div>
		<!-- top-section -->
		<div class="main-navigation">
			<ul class="navigation">
				<li><a href="#top"><i class="fa fa-globe"></i>欢迎来到管理员主页</a></li>
				<li><a href="#about"><i class="fa fa-pencil"></i>管理调控</a></li>
				<!-- <li><a href="#projects"><i class="fa fa-paperclip"></i>匹配结果</a></li> -->
				<li><a href="#contact"><i class="fa fa-link"></i>联系我们</a></li>
			</ul>
		</div>
		<!-- .main-navigation -->
		<div class="social-icons">
			<ul>
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
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
							<h4 class="widget-title">管理调控</h4>
							<!--<div class="about-image">
						<img src="img/8.jpg" alt="about me">
					</div>-->
							<p>数据爬取网站选择</p>
							<div id="app"
								style="position: relative; left: 120px; top: 0px; width: 180px; height: 10px">
							</div>

							<script type="text/javascript">
								"use strict";

								function _classCallCheck(instance, Constructor) {
									if (!(instance instanceof Constructor)) {
										throw new TypeError(
												"Cannot call a class as a function");
									}
								}

								function _possibleConstructorReturn(self, call) {
									if (!self) {
										throw new ReferenceError(
												"this hasn't been initialised - super() hasn't been called");
									}
									return call
											&& (typeof call === "object" || typeof call === "function") ? call
											: self;
								}

								function _inherits(subClass, superClass) {
									if (typeof superClass !== "function"
											&& superClass !== null) {
										throw new TypeError(
												"Super expression must either be null or a function, not "
														+ typeof superClass);
									}
									subClass.prototype = Object.create(
											superClass && superClass.prototype,
											{
												constructor : {
													value : subClass,
													enumerable : false,
													writable : true,
													configurable : true
												}
											});
									if (superClass)
										Object.setPrototypeOf ? Object
												.setPrototypeOf(subClass,
														superClass)
												: subClass.__proto__ = superClass;
								}

								var CleanToggle = function(_React$Component) {
									_inherits(CleanToggle, _React$Component);

									function CleanToggle(props) {
										_classCallCheck(this, CleanToggle);

										var _this = _possibleConstructorReturn(
												this, _React$Component.call(
														this, props));

										_this.toggle = function(e) {
											_this.setState({
												on : !_this.state.on
											});
										};

										_this.componentDidUpdate = function(e) {
											var tl = new TimelineMax();

											tl
													.to(
															[
																	_this.dotLBg,
																	_this.dotGroup ],
															1,
															{
																x : _this.state.on ? 84
																		: 0,
																transformOrigin : "50% 50%",
																ease : Power3.easeInOut
															})
													.to(
															_this.toggleBg,
															1,
															{
																fill : _this.state.on ? "#43B86C"
																		: "#BC4B51",
																ease : Sine.easeInOut
															}, "-=1")
													.to(
															_this.patternColor,
															1,
															{
																fill : _this.state.on ? "#43B86C"
																		: "#BC4B51",
																ease : Power3.easeInOut
															}, "-=1")
													.to(
															_this.starPattern,
															1,
															{
																attr : {
																	x : _this.state.on ? 210
																			: 0
																},
																transformOrigin : "50% 50%",
																ease : Power3.easeInOut
															}, "-=1")
													.to(
															".baubleGradStopColor",
															1,
															{
																stopColor : _this.state.on ? "#184A13"
																		: "#491615"
															}, "-=1");
										};

										_this.state = {
											on : true
										};

										return _this;
									}

									CleanToggle.prototype.componentDidMount = function componentDidMount() {
										this.toggle();
									};

									CleanToggle.prototype.render = function render() {
										var _this2 = this;

										return React
												.createElement(
														"svg",
														{
															viewBox : "0 0 800 600",
															xmlns : "http://www.w3.org/2000/svg",
															xmlnsXlink : "http://www.w3.org/1999/xlink",
															preserveAspectRatio : "xMidYMid slice"
														},
														React
																.createElement(
																		"defs",
																		null,
																		React
																				.createElement(
																						"radialGradient",
																						{
																							id : "baubleShineGrad",
																							cx : "352.79",
																							cy : "293.87",
																							r : "26",
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.01",
																											stopColor : "#fff",
																											stopOpacity : "0.5"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.69",
																											stopColor : "#fff",
																											stopOpacity : "0"
																										})),
																		React
																				.createElement(
																						"radialGradient",
																						{
																							id : "baubleGrad",
																							cx : 358,
																							cy : 298,
																							r : 26,
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.5",
																											stopColor : "#FABE2B",
																											stopOpacity : 0
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.8",
																											className : "baubleGradStopColor",
																											stopColor : "#491615",
																											stopOpacity : "0.15"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : 1,
																											className : "baubleGradStopColor",
																											stopColor : "#491615",
																											stopOpacity : "0.65"
																										})),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "baubleShadow",
																							width : "350%",
																							height : "350%",
																							colorInterpolationFilters : "sRGB"
																						},
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "4",
																											result : "coloredBlur"
																										}),
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "23",
																											result : "offsetblur"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											id : "dropShadowAlpha",
																											floodColor : "#000",
																											floodOpacity : "0.21"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											in2 : "offsetblur",
																											operator : "in"
																										}),
																						React
																								.createElement(
																										"feMerge",
																										null,
																										React
																												.createElement(
																														"feMergeNode",
																														null))),
																		React
																				.createElement(
																						"linearGradient",
																						{
																							id : "baubleCapGrad",
																							x1 : "351.26",
																							y1 : "272.94",
																							x2 : "364.74",
																							y2 : "272.94",
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.09",
																											stopColor : "#f5bb3b"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.31",
																											stopColor : "#fff"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.51",
																											stopColor : "#f5bb3b"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.86",
																											stopColor : "#bd902d"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "1",
																											stopColor : "#f5bb3b"
																										})),
																		React
																				.createElement(
																						"pattern",
																						{
																							id : "starPattern",
																							ref : function ref(
																									starPattern) {
																								_this2.starPattern = starPattern;
																							},
																							width : 92,
																							height : 92,
																							patternTransform : "translate(-10.02 -3.42) scale(0.33)",
																							patternUnits : "userSpaceOnUse",
																							viewBox : "0 0 92 92",
																							x : 0,
																							y : 0
																						},
																						React
																								.createElement(
																										"rect",
																										{
																											width : 184,
																											height : 184,
																											fill : "none"
																										}),
																						React
																								.createElement(
																										"g",
																										{
																											ref : function ref(
																													patternColor) {
																												_this2.patternColor = patternColor;
																											},
																											fill : "#BC4B51"
																										},
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "84.19 73.59 95.3 83.17 109.49 79.45 103.83 92.99 111.76 105.34 97.14 104.12 87.87 115.48 84.5 101.19 70.83 95.86 83.36 88.25 84.19 73.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "45.58 87.84 48.09 90 51.3 89.16 50.02 92.22 51.81 95.02 48.51 94.74 46.41 97.31 45.65 94.08 42.55 92.87 45.39 91.15 45.58 87.84"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-7.82 73.59 3.3 83.17 17.49 79.45 11.82 92.99 19.76 105.34 5.14 104.12 -4.13 115.48 -7.5 101.19 -21.18 95.86 -8.64 88.25 -7.82 73.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "39.53 27.59 50.65 37.17 64.83 33.45 59.17 46.99 67.11 59.34 52.49 58.12 43.21 69.48 39.84 55.19 26.17 49.86 38.7 42.25 39.53 27.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "84.19 -18.41 95.3 -8.82 109.49 -12.55 103.83 0.99 111.76 13.34 97.14 12.12 87.87 23.48 84.5 9.19 70.83 3.86 83.36 -3.75 84.19 -18.41"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "90.23 41.84 92.75 44 95.95 43.16 94.67 46.22 96.47 49.02 93.16 48.74 91.06 51.31 90.3 48.08 87.21 46.87 90.05 45.15 90.23 41.84"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "45.58 -4.16 48.09 -2 51.3 -2.84 50.02 0.22 51.81 3.02 48.51 2.74 46.41 5.31 45.65 2.08 42.55 0.87 45.39 -0.85 45.58 -4.16"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-7.82 -18.41 3.3 -8.82 17.49 -12.55 11.82 0.99 19.76 13.34 5.14 12.12 -4.13 23.48 -7.5 9.19 -21.18 3.86 -8.64 -3.75 -7.82 -18.41"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-1.77 41.84 0.75 44 3.96 43.16 2.67 46.22 4.47 49.02 1.16 48.74 -0.94 51.31 -1.7 48.08 -4.79 46.87 -1.96 45.15 -1.77 41.84"
																														}))),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "insetShadow"
																						},
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "14"
																										}),
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "5",
																											result : "offset-blur"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "out",
																											"in" : "SourceGraphic",
																											in2 : "offset-blur",
																											result : "inverse"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											floodColor : "black",
																											floodOpacity : "0.5",
																											result : "color"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "in",
																											"in" : "color",
																											in2 : "inverse",
																											result : "shadow"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "over",
																											"in" : "shadow",
																											in2 : "SourceGraphic"
																										})),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "dropShadow",
																							width : "350%",
																							height : "350%",
																							colorInterpolationFilters : "sRGB"
																						},
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "4",
																											result : "coloredBlur"
																										}),
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "3",
																											result : "offsetblur"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											id : "dropShadowAlpha",
																											floodColor : "#000",
																											floodOpacity : "0.4"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											in2 : "offsetblur",
																											operator : "in"
																										}),
																						React
																								.createElement(
																										"feMerge",
																										null,
																										React
																												.createElement(
																														"feMergeNode",
																														null),
																										React
																												.createElement(
																														"feMergeNode",
																														{
																															"in" : "SourceGraphic"
																														})))),
														React
																.createElement(
																		"rect",
																		{
																			filter : "url(#insetShadow)",
																			ref : function ref(
																					toggleBg) {
																				_this2.toggleBg = toggleBg;
																			},
																			x : "321",
																			y : "263",
																			width : "158",
																			height : "74",
																			rx : "37",
																			ry : "37",
																			fill : "#B74452"
																		}),
														React
																.createElement(
																		"rect",
																		{
																			filter : "url(#baubleShadow)",
																			ref : function ref(
																					dotGroup) {
																				_this2.dotGroup = dotGroup;
																			},
																			width : "52",
																			height : "52",
																			x : "332",
																			y : "274",
																			rx : "26",
																			ry : "26",
																			fill : "#000",
																			opacity : "1"
																		}),
														React
																.createElement(
																		"g",
																		null,
																		React
																				.createElement(
																						"g",
																						{
																							ref : function ref(
																									dotLBg) {
																								_this2.dotLBg = dotLBg;
																							}
																						},
																						React
																								.createElement(
																										"path",
																										{
																											d : "M355.68,270.7a3,3,0,0,1-.65-1.86,3,3,0,0,1,5.94,0,3,3,0,0,1-.65,1.86",
																											fill : "none",
																											stroke : "#DCA014",
																											"stroke-miterlimit" : "10",
																											strokeWidth : "1.5"
																										}),
																						React
																								.createElement(
																										"path",
																										{
																											d : "M363.88,270.29H352.13a.87.87,0,0,0-.87.86v3.52a.87.87,0,0,0,1.73,0l10,.06h0a.87.87,0,0,0,1.73,0v-3.59A.87.87,0,0,0,363.88,270.29Z",
																											fill : "url(#baubleCapGrad)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "#FFFCF9"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "url(#starPattern)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26.1",
																											fill : "url(#baubleGrad)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "url(#baubleShineGrad)"
																										/*       ref={dotGrad => {
																										this.dotGrad = dotGrad;
																										}} */
																										}))),
														React
																.createElement(
																		"rect",
																		{
																			onClick : this.toggle,
																			ref : function ref(
																					hit) {
																				_this2.hit = hit;
																			},
																			className : "hit",
																			x : "321",
																			y : "263",
																			width : "158",
																			height : "74",
																			rx : "37",
																			ry : "37",
																			fill : "transparent"
																		}));
									};

									return CleanToggle;
								}(React.Component);

								ReactDOM.render(React.createElement(
										CleanToggle, null), document
										.querySelector("#app"));

								//按钮的开关状态监听
								$(document).ready(function() {
									var i = 0;

									$(".hit").on('click', function() {
										i++;
										clickSwitch()
									});

									var clickSwitch = function() {
										if (i % 2 == 1) {
											$("#s1").val("智联招聘");
										} else {
											$("#s1").val("");
										}
									};

								});

								//.addEventListener("click", changeColor, false)

								/* $(document).ready(function() {  
								    $(".hit").addEventListener("click", clickSwitch, false);  
								  
								    var clickSwitch = function() {  
								          
								            console.log("在ON的状态下");  
								         
								            console.log("在OFF的状态下");  
								         
								    };  
								}); */
							</script>
							</br> </br>
							<h3>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;智联招聘</h3>
							<div id="app1"
								style="position: relative; left: 120px; top: 0px; width: 180px; height: 10px">

							</div>

							<script type="text/javascript">
								"use strict";

								function _classCallCheck(instance, Constructor) {
									if (!(instance instanceof Constructor)) {
										throw new TypeError(
												"Cannot call a class as a function");
									}
								}

								function _possibleConstructorReturn(self, call) {
									if (!self) {
										throw new ReferenceError(
												"this hasn't been initialised - super() hasn't been called");
									}
									return call
											&& (typeof call === "object" || typeof call === "function") ? call
											: self;
								}

								function _inherits(subClass, superClass) {
									if (typeof superClass !== "function"
											&& superClass !== null) {
										throw new TypeError(
												"Super expression must either be null or a function, not "
														+ typeof superClass);
									}
									subClass.prototype = Object.create(
											superClass && superClass.prototype,
											{
												constructor : {
													value : subClass,
													enumerable : false,
													writable : true,
													configurable : true
												}
											});
									if (superClass)
										Object.setPrototypeOf ? Object
												.setPrototypeOf(subClass,
														superClass)
												: subClass.__proto__ = superClass;
								}

								var CleanToggle = function(_React$Component) {
									_inherits(CleanToggle, _React$Component);

									function CleanToggle(props) {
										_classCallCheck(this, CleanToggle);

										var _this = _possibleConstructorReturn(
												this, _React$Component.call(
														this, props));

										_this.toggle = function(e) {
											_this.setState({
												on : !_this.state.on
											});
										};

										_this.componentDidUpdate = function(e) {
											var tl = new TimelineMax();

											tl
													.to(
															[
																	_this.dotLBg,
																	_this.dotGroup ],
															1,
															{
																x : _this.state.on ? 84
																		: 0,
																transformOrigin : "50% 50%",
																ease : Power3.easeInOut
															})
													.to(
															_this.toggleBg,
															1,
															{
																fill : _this.state.on ? "#43B86C"
																		: "#BC4B51",
																ease : Sine.easeInOut
															}, "-=1")
													.to(
															_this.patternColor,
															1,
															{
																fill : _this.state.on ? "#43B86C"
																		: "#BC4B51",
																ease : Power3.easeInOut
															}, "-=1")
													.to(
															_this.starPattern,
															1,
															{
																attr : {
																	x : _this.state.on ? 210
																			: 0
																},
																transformOrigin : "50% 50%",
																ease : Power3.easeInOut
															}, "-=1")
													.to(
															".baubleGradStopColor",
															1,
															{
																stopColor : _this.state.on ? "#184A13"
																		: "#491615"
															}, "-=1");
										};

										_this.state = {
											on : true
										};

										return _this;
									}

									CleanToggle.prototype.componentDidMount = function componentDidMount() {
										this.toggle();
									};

									CleanToggle.prototype.render = function render() {
										var _this2 = this;

										return React
												.createElement(
														"svg",
														{
															viewBox : "0 0 800 600",
															xmlns : "http://www.w3.org/2000/svg",
															xmlnsXlink : "http://www.w3.org/1999/xlink",
															preserveAspectRatio : "xMidYMid slice"
														},
														React
																.createElement(
																		"defs",
																		null,
																		React
																				.createElement(
																						"radialGradient",
																						{
																							id : "baubleShineGrad",
																							cx : "352.79",
																							cy : "293.87",
																							r : "26",
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.01",
																											stopColor : "#fff",
																											stopOpacity : "0.5"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.69",
																											stopColor : "#fff",
																											stopOpacity : "0"
																										})),
																		React
																				.createElement(
																						"radialGradient",
																						{
																							id : "baubleGrad",
																							cx : 358,
																							cy : 298,
																							r : 26,
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.5",
																											stopColor : "#FABE2B",
																											stopOpacity : 0
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.8",
																											className : "baubleGradStopColor",
																											stopColor : "#491615",
																											stopOpacity : "0.15"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : 1,
																											className : "baubleGradStopColor",
																											stopColor : "#491615",
																											stopOpacity : "0.65"
																										})),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "baubleShadow",
																							width : "350%",
																							height : "350%",
																							colorInterpolationFilters : "sRGB"
																						},
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "4",
																											result : "coloredBlur"
																										}),
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "23",
																											result : "offsetblur"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											id : "dropShadowAlpha",
																											floodColor : "#000",
																											floodOpacity : "0.21"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											in2 : "offsetblur",
																											operator : "in"
																										}),
																						React
																								.createElement(
																										"feMerge",
																										null,
																										React
																												.createElement(
																														"feMergeNode",
																														null))),
																		React
																				.createElement(
																						"linearGradient",
																						{
																							id : "baubleCapGrad",
																							x1 : "351.26",
																							y1 : "272.94",
																							x2 : "364.74",
																							y2 : "272.94",
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.09",
																											stopColor : "#f5bb3b"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.31",
																											stopColor : "#fff"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.51",
																											stopColor : "#f5bb3b"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.86",
																											stopColor : "#bd902d"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "1",
																											stopColor : "#f5bb3b"
																										})),
																		React
																				.createElement(
																						"pattern",
																						{
																							id : "starPattern",
																							ref : function ref(
																									starPattern) {
																								_this2.starPattern = starPattern;
																							},
																							width : 92,
																							height : 92,
																							patternTransform : "translate(-10.02 -3.42) scale(0.33)",
																							patternUnits : "userSpaceOnUse",
																							viewBox : "0 0 92 92",
																							x : 0,
																							y : 0
																						},
																						React
																								.createElement(
																										"rect",
																										{
																											width : 184,
																											height : 184,
																											fill : "none"
																										}),
																						React
																								.createElement(
																										"g",
																										{
																											ref : function ref(
																													patternColor) {
																												_this2.patternColor = patternColor;
																											},
																											fill : "#BC4B51"
																										},
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "84.19 73.59 95.3 83.17 109.49 79.45 103.83 92.99 111.76 105.34 97.14 104.12 87.87 115.48 84.5 101.19 70.83 95.86 83.36 88.25 84.19 73.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "45.58 87.84 48.09 90 51.3 89.16 50.02 92.22 51.81 95.02 48.51 94.74 46.41 97.31 45.65 94.08 42.55 92.87 45.39 91.15 45.58 87.84"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-7.82 73.59 3.3 83.17 17.49 79.45 11.82 92.99 19.76 105.34 5.14 104.12 -4.13 115.48 -7.5 101.19 -21.18 95.86 -8.64 88.25 -7.82 73.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "39.53 27.59 50.65 37.17 64.83 33.45 59.17 46.99 67.11 59.34 52.49 58.12 43.21 69.48 39.84 55.19 26.17 49.86 38.7 42.25 39.53 27.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "84.19 -18.41 95.3 -8.82 109.49 -12.55 103.83 0.99 111.76 13.34 97.14 12.12 87.87 23.48 84.5 9.19 70.83 3.86 83.36 -3.75 84.19 -18.41"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "90.23 41.84 92.75 44 95.95 43.16 94.67 46.22 96.47 49.02 93.16 48.74 91.06 51.31 90.3 48.08 87.21 46.87 90.05 45.15 90.23 41.84"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "45.58 -4.16 48.09 -2 51.3 -2.84 50.02 0.22 51.81 3.02 48.51 2.74 46.41 5.31 45.65 2.08 42.55 0.87 45.39 -0.85 45.58 -4.16"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-7.82 -18.41 3.3 -8.82 17.49 -12.55 11.82 0.99 19.76 13.34 5.14 12.12 -4.13 23.48 -7.5 9.19 -21.18 3.86 -8.64 -3.75 -7.82 -18.41"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-1.77 41.84 0.75 44 3.96 43.16 2.67 46.22 4.47 49.02 1.16 48.74 -0.94 51.31 -1.7 48.08 -4.79 46.87 -1.96 45.15 -1.77 41.84"
																														}))),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "insetShadow"
																						},
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "14"
																										}),
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "5",
																											result : "offset-blur"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "out",
																											"in" : "SourceGraphic",
																											in2 : "offset-blur",
																											result : "inverse"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											floodColor : "black",
																											floodOpacity : "0.5",
																											result : "color"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "in",
																											"in" : "color",
																											in2 : "inverse",
																											result : "shadow"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "over",
																											"in" : "shadow",
																											in2 : "SourceGraphic"
																										})),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "dropShadow",
																							width : "350%",
																							height : "350%",
																							colorInterpolationFilters : "sRGB"
																						},
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "4",
																											result : "coloredBlur"
																										}),
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "3",
																											result : "offsetblur"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											id : "dropShadowAlpha",
																											floodColor : "#000",
																											floodOpacity : "0.4"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											in2 : "offsetblur",
																											operator : "in"
																										}),
																						React
																								.createElement(
																										"feMerge",
																										null,
																										React
																												.createElement(
																														"feMergeNode",
																														null),
																										React
																												.createElement(
																														"feMergeNode",
																														{
																															"in" : "SourceGraphic"
																														})))),
														React
																.createElement(
																		"rect",
																		{
																			filter : "url(#insetShadow)",
																			ref : function ref(
																					toggleBg) {
																				_this2.toggleBg = toggleBg;
																			},
																			x : "321",
																			y : "263",
																			width : "158",
																			height : "74",
																			rx : "37",
																			ry : "37",
																			fill : "#B74452"
																		}),
														React
																.createElement(
																		"rect",
																		{
																			filter : "url(#baubleShadow)",
																			ref : function ref(
																					dotGroup) {
																				_this2.dotGroup = dotGroup;
																			},
																			width : "52",
																			height : "52",
																			x : "332",
																			y : "274",
																			rx : "26",
																			ry : "26",
																			fill : "#000",
																			opacity : "1"
																		}),
														React
																.createElement(
																		"g",
																		null,
																		React
																				.createElement(
																						"g",
																						{
																							ref : function ref(
																									dotLBg) {
																								_this2.dotLBg = dotLBg;
																							}
																						},
																						React
																								.createElement(
																										"path",
																										{
																											d : "M355.68,270.7a3,3,0,0,1-.65-1.86,3,3,0,0,1,5.94,0,3,3,0,0,1-.65,1.86",
																											fill : "none",
																											stroke : "#DCA014",
																											"stroke-miterlimit" : "10",
																											strokeWidth : "1.5"
																										}),
																						React
																								.createElement(
																										"path",
																										{
																											d : "M363.88,270.29H352.13a.87.87,0,0,0-.87.86v3.52a.87.87,0,0,0,1.73,0l10,.06h0a.87.87,0,0,0,1.73,0v-3.59A.87.87,0,0,0,363.88,270.29Z",
																											fill : "url(#baubleCapGrad)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "#FFFCF9"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "url(#starPattern)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26.1",
																											fill : "url(#baubleGrad)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "url(#baubleShineGrad)"
																										/*       ref={dotGrad => {
																										this.dotGrad = dotGrad;
																										}} */
																										}))),
														React
																.createElement(
																		"rect",
																		{
																			onClick : this.toggle,
																			ref : function ref(
																					hit) {
																				_this2.hit = hit;
																			},
																			className : "hit1",
																			x : "321",
																			y : "263",
																			width : "158",
																			height : "74",
																			rx : "37",
																			ry : "37",
																			fill : "transparent"
																		}));
									};

									return CleanToggle;
								}(React.Component);

								ReactDOM.render(React.createElement(
										CleanToggle, null), document
										.querySelector("#app1"));

								//按钮的开关状态监听
								$(document).ready(function() {
									var i1 = 0;

									$(".hit1").on('click', function() {
										i1++;
										clickSwitch()
									});

									var clickSwitch = function() {
										if (i1 % 2 == 1) {
											$("#s2").val("前程无忧");
										} else {
											$("#s2").val("");
										}
									};

								});
							</script>
							</br> </br>
							<h3>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前程无忧</h3>
							<div id="app2"
								style="position: relative; left: 120px; top: 0px; width: 180px; height: 10px">

							</div>

							<script type="text/javascript">
								"use strict";

								function _classCallCheck(instance, Constructor) {
									if (!(instance instanceof Constructor)) {
										throw new TypeError(
												"Cannot call a class as a function");
									}
								}

								function _possibleConstructorReturn(self, call) {
									if (!self) {
										throw new ReferenceError(
												"this hasn't been initialised - super() hasn't been called");
									}
									return call
											&& (typeof call === "object" || typeof call === "function") ? call
											: self;
								}

								function _inherits(subClass, superClass) {
									if (typeof superClass !== "function"
											&& superClass !== null) {
										throw new TypeError(
												"Super expression must either be null or a function, not "
														+ typeof superClass);
									}
									subClass.prototype = Object.create(
											superClass && superClass.prototype,
											{
												constructor : {
													value : subClass,
													enumerable : false,
													writable : true,
													configurable : true
												}
											});
									if (superClass)
										Object.setPrototypeOf ? Object
												.setPrototypeOf(subClass,
														superClass)
												: subClass.__proto__ = superClass;
								}

								var CleanToggle = function(_React$Component) {
									_inherits(CleanToggle, _React$Component);

									function CleanToggle(props) {
										_classCallCheck(this, CleanToggle);

										var _this = _possibleConstructorReturn(
												this, _React$Component.call(
														this, props));

										_this.toggle = function(e) {
											_this.setState({
												on : !_this.state.on
											});
										};

										_this.componentDidUpdate = function(e) {
											var tl = new TimelineMax();

											tl
													.to(
															[
																	_this.dotLBg,
																	_this.dotGroup ],
															1,
															{
																x : _this.state.on ? 84
																		: 0,
																transformOrigin : "50% 50%",
																ease : Power3.easeInOut
															})
													.to(
															_this.toggleBg,
															1,
															{
																fill : _this.state.on ? "#43B86C"
																		: "#BC4B51",
																ease : Sine.easeInOut
															}, "-=1")
													.to(
															_this.patternColor,
															1,
															{
																fill : _this.state.on ? "#43B86C"
																		: "#BC4B51",
																ease : Power3.easeInOut
															}, "-=1")
													.to(
															_this.starPattern,
															1,
															{
																attr : {
																	x : _this.state.on ? 210
																			: 0
																},
																transformOrigin : "50% 50%",
																ease : Power3.easeInOut
															}, "-=1")
													.to(
															".baubleGradStopColor",
															1,
															{
																stopColor : _this.state.on ? "#184A13"
																		: "#491615"
															}, "-=1");
										};

										_this.state = {
											on : true
										};

										return _this;
									}

									CleanToggle.prototype.componentDidMount = function componentDidMount() {
										this.toggle();
									};

									CleanToggle.prototype.render = function render() {
										var _this2 = this;

										return React
												.createElement(
														"svg",
														{
															viewBox : "0 0 800 600",
															xmlns : "http://www.w3.org/2000/svg",
															xmlnsXlink : "http://www.w3.org/1999/xlink",
															preserveAspectRatio : "xMidYMid slice"
														},
														React
																.createElement(
																		"defs",
																		null,
																		React
																				.createElement(
																						"radialGradient",
																						{
																							id : "baubleShineGrad",
																							cx : "352.79",
																							cy : "293.87",
																							r : "26",
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.01",
																											stopColor : "#fff",
																											stopOpacity : "0.5"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.69",
																											stopColor : "#fff",
																											stopOpacity : "0"
																										})),
																		React
																				.createElement(
																						"radialGradient",
																						{
																							id : "baubleGrad",
																							cx : 358,
																							cy : 298,
																							r : 26,
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.5",
																											stopColor : "#FABE2B",
																											stopOpacity : 0
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.8",
																											className : "baubleGradStopColor",
																											stopColor : "#491615",
																											stopOpacity : "0.15"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : 1,
																											className : "baubleGradStopColor",
																											stopColor : "#491615",
																											stopOpacity : "0.65"
																										})),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "baubleShadow",
																							width : "350%",
																							height : "350%",
																							colorInterpolationFilters : "sRGB"
																						},
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "4",
																											result : "coloredBlur"
																										}),
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "23",
																											result : "offsetblur"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											id : "dropShadowAlpha",
																											floodColor : "#000",
																											floodOpacity : "0.21"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											in2 : "offsetblur",
																											operator : "in"
																										}),
																						React
																								.createElement(
																										"feMerge",
																										null,
																										React
																												.createElement(
																														"feMergeNode",
																														null))),
																		React
																				.createElement(
																						"linearGradient",
																						{
																							id : "baubleCapGrad",
																							x1 : "351.26",
																							y1 : "272.94",
																							x2 : "364.74",
																							y2 : "272.94",
																							gradientUnits : "userSpaceOnUse"
																						},
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.09",
																											stopColor : "#f5bb3b"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.31",
																											stopColor : "#fff"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.51",
																											stopColor : "#f5bb3b"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "0.86",
																											stopColor : "#bd902d"
																										}),
																						React
																								.createElement(
																										"stop",
																										{
																											offset : "1",
																											stopColor : "#f5bb3b"
																										})),
																		React
																				.createElement(
																						"pattern",
																						{
																							id : "starPattern",
																							ref : function ref(
																									starPattern) {
																								_this2.starPattern = starPattern;
																							},
																							width : 92,
																							height : 92,
																							patternTransform : "translate(-10.02 -3.42) scale(0.33)",
																							patternUnits : "userSpaceOnUse",
																							viewBox : "0 0 92 92",
																							x : 0,
																							y : 0
																						},
																						React
																								.createElement(
																										"rect",
																										{
																											width : 184,
																											height : 184,
																											fill : "none"
																										}),
																						React
																								.createElement(
																										"g",
																										{
																											ref : function ref(
																													patternColor) {
																												_this2.patternColor = patternColor;
																											},
																											fill : "#BC4B51"
																										},
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "84.19 73.59 95.3 83.17 109.49 79.45 103.83 92.99 111.76 105.34 97.14 104.12 87.87 115.48 84.5 101.19 70.83 95.86 83.36 88.25 84.19 73.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "45.58 87.84 48.09 90 51.3 89.16 50.02 92.22 51.81 95.02 48.51 94.74 46.41 97.31 45.65 94.08 42.55 92.87 45.39 91.15 45.58 87.84"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-7.82 73.59 3.3 83.17 17.49 79.45 11.82 92.99 19.76 105.34 5.14 104.12 -4.13 115.48 -7.5 101.19 -21.18 95.86 -8.64 88.25 -7.82 73.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "39.53 27.59 50.65 37.17 64.83 33.45 59.17 46.99 67.11 59.34 52.49 58.12 43.21 69.48 39.84 55.19 26.17 49.86 38.7 42.25 39.53 27.59"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "84.19 -18.41 95.3 -8.82 109.49 -12.55 103.83 0.99 111.76 13.34 97.14 12.12 87.87 23.48 84.5 9.19 70.83 3.86 83.36 -3.75 84.19 -18.41"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "90.23 41.84 92.75 44 95.95 43.16 94.67 46.22 96.47 49.02 93.16 48.74 91.06 51.31 90.3 48.08 87.21 46.87 90.05 45.15 90.23 41.84"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "45.58 -4.16 48.09 -2 51.3 -2.84 50.02 0.22 51.81 3.02 48.51 2.74 46.41 5.31 45.65 2.08 42.55 0.87 45.39 -0.85 45.58 -4.16"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-7.82 -18.41 3.3 -8.82 17.49 -12.55 11.82 0.99 19.76 13.34 5.14 12.12 -4.13 23.48 -7.5 9.19 -21.18 3.86 -8.64 -3.75 -7.82 -18.41"
																														}),
																										React
																												.createElement(
																														"polygon",
																														{
																															points : "-1.77 41.84 0.75 44 3.96 43.16 2.67 46.22 4.47 49.02 1.16 48.74 -0.94 51.31 -1.7 48.08 -4.79 46.87 -1.96 45.15 -1.77 41.84"
																														}))),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "insetShadow"
																						},
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "14"
																										}),
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "5",
																											result : "offset-blur"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "out",
																											"in" : "SourceGraphic",
																											in2 : "offset-blur",
																											result : "inverse"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											floodColor : "black",
																											floodOpacity : "0.5",
																											result : "color"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "in",
																											"in" : "color",
																											in2 : "inverse",
																											result : "shadow"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											operator : "over",
																											"in" : "shadow",
																											in2 : "SourceGraphic"
																										})),
																		React
																				.createElement(
																						"filter",
																						{
																							id : "dropShadow",
																							width : "350%",
																							height : "350%",
																							colorInterpolationFilters : "sRGB"
																						},
																						React
																								.createElement(
																										"feGaussianBlur",
																										{
																											stdDeviation : "4",
																											result : "coloredBlur"
																										}),
																						React
																								.createElement(
																										"feOffset",
																										{
																											dx : "0",
																											dy : "3",
																											result : "offsetblur"
																										}),
																						React
																								.createElement(
																										"feFlood",
																										{
																											id : "dropShadowAlpha",
																											floodColor : "#000",
																											floodOpacity : "0.4"
																										}),
																						React
																								.createElement(
																										"feComposite",
																										{
																											in2 : "offsetblur",
																											operator : "in"
																										}),
																						React
																								.createElement(
																										"feMerge",
																										null,
																										React
																												.createElement(
																														"feMergeNode",
																														null),
																										React
																												.createElement(
																														"feMergeNode",
																														{
																															"in" : "SourceGraphic"
																														})))),
														React
																.createElement(
																		"rect",
																		{
																			filter : "url(#insetShadow)",
																			ref : function ref(
																					toggleBg) {
																				_this2.toggleBg = toggleBg;
																			},
																			x : "321",
																			y : "263",
																			width : "158",
																			height : "74",
																			rx : "37",
																			ry : "37",
																			fill : "#B74452"
																		}),
														React
																.createElement(
																		"rect",
																		{
																			filter : "url(#baubleShadow)",
																			ref : function ref(
																					dotGroup) {
																				_this2.dotGroup = dotGroup;
																			},
																			width : "52",
																			height : "52",
																			x : "332",
																			y : "274",
																			rx : "26",
																			ry : "26",
																			fill : "#000",
																			opacity : "1"
																		}),
														React
																.createElement(
																		"g",
																		null,
																		React
																				.createElement(
																						"g",
																						{
																							ref : function ref(
																									dotLBg) {
																								_this2.dotLBg = dotLBg;
																							}
																						},
																						React
																								.createElement(
																										"path",
																										{
																											d : "M355.68,270.7a3,3,0,0,1-.65-1.86,3,3,0,0,1,5.94,0,3,3,0,0,1-.65,1.86",
																											fill : "none",
																											stroke : "#DCA014",
																											"stroke-miterlimit" : "10",
																											strokeWidth : "1.5"
																										}),
																						React
																								.createElement(
																										"path",
																										{
																											d : "M363.88,270.29H352.13a.87.87,0,0,0-.87.86v3.52a.87.87,0,0,0,1.73,0l10,.06h0a.87.87,0,0,0,1.73,0v-3.59A.87.87,0,0,0,363.88,270.29Z",
																											fill : "url(#baubleCapGrad)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "#FFFCF9"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "url(#starPattern)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26.1",
																											fill : "url(#baubleGrad)"
																										}),
																						React
																								.createElement(
																										"circle",
																										{
																											cx : "358",
																											cy : "300",
																											r : "26",
																											fill : "url(#baubleShineGrad)"
																										/*       ref={dotGrad => {
																										this.dotGrad = dotGrad;
																										}} */
																										}))),
														React
																.createElement(
																		"rect",
																		{
																			onClick : this.toggle,
																			ref : function ref(
																					hit) {
																				_this2.hit = hit;
																			},
																			className : "hit2",
																			x : "321",
																			y : "263",
																			width : "158",
																			height : "74",
																			rx : "37",
																			ry : "37",
																			fill : "transparent"
																		}));
									};

									return CleanToggle;
								}(React.Component);

								ReactDOM.render(React.createElement(
										CleanToggle, null), document
										.querySelector("#app2"));

								//按钮的开关状态监听
								$(document).ready(function() {
									var i2 = 0;

									$(".hit2").on('click', function() {
										i2++;
										clickSwitch()
									});

									var clickSwitch = function() {
										if (i2 % 2 == 1) {
											$("#s3").val("58同城");
										} else {
											$("#s3").val("");
										}
									};

								});
							</script>
							</br> </br>

							<h3>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;58同城</h3>
							</br> </br>

							<p>数据爬取频率调节</p>
							</br>
							<div class="project-screening">
								<div class="project-screening-yellow"></div>
								<div class="select-1-yellow"></div>
								<div id="pinlv1" class="screening-select select-1 current ">
									<a href="javascript:void(0)">2小时</a>
								</div>
								<div id="pinlv2" class="screening-select select-2" selval="4,6">
									<a href="javascript:void(0)" selval="4,6">3小时</a>
								</div>
								<div id="pinlv3" class="screening-select select-3" selval="6,7">
									<a href="javascript:void(0)" selval="6,7">6小时</a>
								</div>
								<div id="pinlv4" class="screening-select select-4" selval="7,10">
									<a href="javascript:void(0)" selval="7,10">10小时</a>
								</div>
								<div id="pinlv5" class="screening-select select-5"
									selval="10,-1">
									<a href="javascript:void(0)" selval="10,-1">一天</a>
								</div>
							</div>



							<script type="text/javascript">
								//频率数据
								$(document).ready(function() {
									$("#s4").val("2小时");
									$("#pinlv1").click(function() {
										$("#s4").val("2小时");
									});
									$("#pinlv2").click(function() {
										$("#s4").val("3小时");
									});
									$("#pinlv3").click(function() {
										$("#s4").val("6小时");
									});
									$("#pinlv4").click(function() {
										$("#s4").val("10小时");
									});
									$("#pinlv5").click(function() {
										$("#s4").val("一天");
									});
								});

								$(".screening-select")
										.click(
												function() {
													var _parent = $(this);
													var _postX = _parent
															.position().left;
													_parent
															.siblings(
																	".screening-select")
															.removeClass(
																	"current");
													_parent.addClass("current");
													_parent
															.siblings(
																	".project-screening-yellow")
															.animate({
																width : _postX
															}, 300);
													_parent
															.siblings(
																	".select-1-yellow")
															.animate(
																	{
																		left : _postX - 5
																	}, 300);
													_parent
															.prevAll(
																	".screening-select")
															.css("background",
																	"none");
													_parent
															.nextAll()
															.removeAttr("style");
												});
							</script>
							</br>


							<p>数据爬取速率调节</p>
							</br>
							<div class="project-screening">
								<div class="project-screening-yellow"></div>
								<div class="select-1-yellow"></div>
								<div id="sulv1" class="screening-select select-1 current">
									<a href="javascript:void(0)">30%以下</a>
								</div>
								<div id="sulv2" class="screening-select select-2" selval="4,6">
									<a href="javascript:void(0)" selval="4,6">30%~50%</a>
								</div>
								<div id="sulv3" class="screening-select select-3" selval="6,7">
									<a href="javascript:void(0)" selval="6,7">50%~70%</a>
								</div>
								<div id="sulv4" class="screening-select select-4" selval="7,10">
									<a href="javascript:void(0)" selval="7,10">70%~90%</a>
								</div>
								<div id="sulv5" class="screening-select select-5" selval="10,-1">
									<a href="javascript:void(0)" selval="10,-1">90%以上</a>
								</div>
							</div>



							<script type="text/javascript">
								//速率数据
								$(document).ready(function() {
									$("#s5").val("30%以下");
									$("#sulv1").click(function() {
										$("#s5").val("30%以下");
									});
									$("#sulv2").click(function() {
										$("#s5").val("30%~50%");
									});
									$("#sulv3").click(function() {
										$("#s5").val("50%~70%");
									});
									$("#sulv4").click(function() {
										$("#s5").val("70%~90%");
									});
									$("#sulv5").click(function() {
										$("#s5").val("90%以上");
									});
								});

								$(".screening-select")
										.click(
												function() {
													var _parent = $(this);
													var _postX = _parent
															.position().left;
													_parent
															.siblings(
																	".screening-select")
															.removeClass(
																	"current");
													_parent.addClass("current");
													_parent
															.siblings(
																	".project-screening-yellow")
															.animate({
																width : _postX
															}, 300);
													_parent
															.siblings(
																	".select-1-yellow")
															.animate(
																	{
																		left : _postX - 5
																	}, 300);
													_parent
															.prevAll(
																	".screening-select")
															.css("background",
																	"none");
													_parent
															.nextAll()
															.removeAttr("style");
												});

								/*
								
								
								
								
								
								 */
							</script>
							</br>
							<p>数据分析深度调节</p>
							</br>
							<div class="project-screening">
								<div class="project-screening-yellow"></div>
								<div class="select-1-yellow"></div>
								<div id="shendu1" class="screening-select select-1 current">
									<a href="javascript:void(0)">1</a>
								</div>
								<div id="shendu2" class="screening-select select-2" selval="4,6">
									<a href="javascript:void(0)" selval="4,6">2</a>
								</div>
								<div id="shendu3" class="screening-select select-3" selval="6,7">
									<a href="javascript:void(0)" selval="6,7">3</a>
								</div>
								<div id="shendu4" class="screening-select select-4"
									selval="7,10">
									<a href="javascript:void(0)" selval="7,10">4</a>
								</div>
								<div id="shendu5" class="screening-select select-5"
									selval="10,-1">
									<a href="javascript:void(0)" selval="10,-1">5</a>
								</div>
							</div>



							<script type="text/javascript">
								//深度数据
								$(document).ready(function() {
									$("#s6").val("1");
									$("#shendu1").click(function() {
										$("#s6").val("1");
									});
									$("#shendu2").click(function() {
										$("#s6").val("2");
									});
									$("#shendu3").click(function() {
										$("#s6").val("3");
									});
									$("#shendu4").click(function() {
										$("#s6").val("4");
									});
									$("#shendu5").click(function() {
										$("#s6").val("5");
									});
								});

								$(".screening-select")
										.click(
												function() {
													var _parent = $(this);
													var _postX = _parent
															.position().left;
													_parent
															.siblings(
																	".screening-select")
															.removeClass(
																	"current");
													_parent.addClass("current");
													_parent
															.siblings(
																	".project-screening-yellow")
															.animate({
																width : _postX
															}, 300);
													_parent
															.siblings(
																	".select-1-yellow")
															.animate(
																	{
																		left : _postX - 5
																	}, 300);
													_parent
															.prevAll(
																	".screening-select")
															.css("background",
																	"none");
													_parent
															.nextAll()
															.removeAttr("style");
												});
							</script>
							</br>
							<p>数据交叉检验次数</p>
							</br>
							<div class="project-screening">
								<div class="project-screening-yellow"></div>
								<div class="select-1-yellow"></div>
								<div id="guangdu1" class="screening-select select-1 current">
									<a href="javascript:void(0)">3</a>
								</div>
								<div id="guangdu2" class="screening-select select-2"
									selval="4,6">
									<a href="javascript:void(0)" selval="4,6">4</a>
								</div>
								<div id="guangdu3" class="screening-select select-3"
									selval="6,7">
									<a href="javascript:void(0)" selval="6,7">5</a>
								</div>
								<div id="guangdu4" class="screening-select select-4"
									selval="7,10">
									<a href="javascript:void(0)" selval="7,10">6</a>
								</div>
								<div id="guangdu5" class="screening-select select-5"
									selval="10,-1">
									<a href="javascript:void(0)" selval="10,-1">7</a>
								</div>
							</div>



							<script type="text/javascript">
								//交叉验证
								$(document).ready(function() {
									$("#s7").val("3");
									$("#guangdu1").click(function() {
										$("#s7").val("3");
									});
									$("#guangdu2").click(function() {
										$("#s7").val("4");
									});
									$("#guangdu3").click(function() {
										$("#s7").val("5");
									});
									$("#guangdu4").click(function() {
										$("#s7").val("6");
									});
									$("#guangdu5").click(function() {
										$("#s7").val("7");
									});
								});

								$(".screening-select")
										.click(
												function() {
													var _parent = $(this);
													var _postX = _parent
															.position().left;
													_parent
															.siblings(
																	".screening-select")
															.removeClass(
																	"current");
													_parent.addClass("current");
													_parent
															.siblings(
																	".project-screening-yellow")
															.animate({
																width : _postX
															}, 300);
													_parent
															.siblings(
																	".select-1-yellow")
															.animate(
																	{
																		left : _postX - 5
																	}, 300);
													_parent
															.prevAll(
																	".screening-select")
															.css("background",
																	"none");
													_parent
															.nextAll()
															.removeAttr("style");
												});
							</script>

							<!-- 为ECharts准备一个具备大小（宽高）的Dom -->


							<br> <br>

							<form action="Administrator_req.jsp" method="post">
								<div>
									<div>
										<input type=hidden id=s1 name=s1 value="">
										<input type=hidden id=s2 name=s2 value="">
										<input type=hidden id=s3 name=s3 value="">
										<br>
									</div>
									
									<div>
										<input type=hidden id=s4 name=s4 value="">
										<input type=hidden id=s5 name=s5 value="">
										<input type=hidden id=s6 name=s6 value="">
										<input type=hidden id=s7 name=s7 value="">
									</div>
									<br>



									<%--<input type="submit" value="应用">--%>
									<input value="应用" class="button button-pill button-primary" type="submit">

								</div>

							</form>
							<!-- CONTACT -->
							<div class="page-section" id="contact">
								<div class="row">
									<div class="col-md-12">
										<h4 class="widget-title">联系我们</h4>
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
									<p class="copyright-text">Copyright &copy; 小型智能职业分析系统 |
										More Templates</p>
								</div>
							</div>

						</div>

					</div>
				</div>

				<script src="js/vendor/jquery-1.10.2.min.js"></script>
				<script src="js/min/plugins.min.js"></script>
				<script src="js/min/main.min.js"></script>
</body>
</html>