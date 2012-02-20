<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<% def helper = request.get('helper') %>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>我的課程 - PLWeb 程式設計練習系統 v2.0</title>

	<!-- Compass -->
	<link href="${helper.basehref}stylesheets/screen.css" media="screen, projection" rel="stylesheet" type="text/css" />
	<link href="${helper.basehref}stylesheets/print.css" media="print" rel="stylesheet" type="text/css" />
	<!--[if IE]>
	<link href="${helper.basehref}stylesheets/ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
	<![endif]-->

	${helper.htmlhead()}
	<link rel="stylesheet" type="text/css" media="screen" href="${helper.basehref}css/jquery.tipsy.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${helper.basehref}css/colorbox-style1/colorbox.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${helper.basehref}css/jquery.jgrowl.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${helper.basehref}css/jHtmlArea/jHtmlArea.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${helper.basehref}dashboard/index.css" />
	<script type="text/javascript" src="${helper.basehref}js/jHtmlArea-0.7.0.min.js"></script>
	<script type="text/javascript" src="${helper.basehref}js/jquery.spotlight.min.js"></script>
	<script type="text/javascript" src="${helper.basehref}js/jquery.colorbox.min.js"></script>
	<script type="text/javascript" src="${helper.basehref}js/jquery.tipsy.js"></script>
	<script type="text/javascript" src="${helper.basehref}js/jquery.jgrowl_minimized.js"></script>
	<script type="text/javascript" src="${helper.basehref}dashboard/index.js"></script>
</head>
<body class="theme fancy-layout">
	<div class="page-wrapper">
		<div class="header">
			<img class="plweb-logo" src="${helper.basehref}img/plweb_logo.png" alt="PLWeb Logo" />
			
			<div class="topNav">
				<div class="topLinks">
					<span><%=helper.sess('uname')%>(<%=helper.sess('uemail')%>)</span>
					<a href="account.groovy" class="embedded-link">個人帳號</a>
					<%if(helper.attr('is_admin')){%>
					|
					<a href="admin/index.groovy" class="new-window-link" target="_blank">系統管理</a>
					<%}%>
					|
					<a href="http://wiki.plweb.org/" class="" target="_blank">線上教材</a>
					|
					<a href="http://help.plweb.org/installation:jdk" class="embedded-link" target="_blank">Java 安裝設定</a>
					|
					<a href="http://help.plweb.org/technical_support" class="embedded-link" target="_blank">技術支援</a>
					|
					<a href="${helper.sess('logout_url')}" onclick="return confirm('確定要登出系統嗎?')">登出</a>
				</div>
				
				<div class="formLinks">
					<ul>
						<li>
							<span><a href="${response.encodeUrl('dashboard/index.groovy')}" class="link-item">我的課程</a></span>
						</li>
						<li>
							<span><a href="${helper.basehref}class/index.groovy" class="link-item new-window-link" target="_blank">課程管理</a></span>
						</li>			
						<li>
							<span><a href="${helper.basehref}course/index.groovy" class="link-item new-window-link" target="_blank">教材管理</a></span>
						</li>
						<li>
							<span><a href="exam/exam.groovy" class="link-item embedded-link">測驗模式</a></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="content-left"><div class="content-left-inner">
				<img src="${helper.basehref}img/plweb_subtitle.png" />

				<%if(helper.attr('classes').size()>0){%>
				<ul class="classMenu">
					<%helper.attr('classes').each{row->%>
					<li>
						<a href="${row.href}" title="${row.year} / ${row.school} / ${row.dept}" class="<%=row.selected?'selected':''%>">
							${row.name} 
						</a>
						<div class="classId">${helper.fetch('secret')==null?row.id:'0000000000'}</div>
						<div class="classInfo">${row.school} / ${row.dept}</div>
					</li>
					<%}%>
				</ul>
				<%}else{%>
				<div style="line-height:1.8em;font-size:13px;width:240px;margin:5px">
					<p>您尚未參與任何課程！</p>
					<ol>
						<li>如果您是學生：請向授課教師取得<b>課程代碼</b>，在「<a href="class/index.groovy" class="embedded-link"><b>課程管理</b></a>」中設定「<b>選修課程</b>」。</li>
						<li>如果您是教師：請使用「<a href="class/index.groovy" class="embedded-link"><b>課程管理</b></a>」的「<b>建立新課程</b>」，並將系統產生的<b>課程代碼</b>提供給任課班級學生。</li>
					</ol>
				</div>
				<%}%>
				
				
				<!--facebook social widget--->
				<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fplweb.org%2F&amp;layout=standard&amp;show_faces=true&amp;width=230&amp;action=like&amp;font=arial&amp;colorscheme=light&amp;height=80" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:230px; height:80px; padding: 10px;" allowTransparency="true"></iframe>
			</div></div>
			
			<div class="content-center"><div class="content-center-inner">
				<% helper.include "${helper.fetch('m', 'dashboard')}.groovy" %>
			</div></div>
			
			<div class="content-footer"><div class="content-footer-inner">
				PLWebApp 2.0 Copyright &copy; PLWeb 2011  本系統由程式語言專業教學中心維護
			</div></div>
		</div>
	</div>
<%
helper.include '/common/google_analytics.groovy'
%>
</body>
</html>
