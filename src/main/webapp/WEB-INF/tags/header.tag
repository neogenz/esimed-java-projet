<%@ tag language="java" pageEncoding="UTF-8" %>
<%@attribute name="title" required="false" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap admin template">
    <meta name="author" content="">

    <title>${(title ? title : 'Gestion de projet')}</title>

    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/apple-touch-icon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-extend.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/site.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animsition/animsition.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/asscrollable/asScrollable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/switchery/switchery.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/intro-js/introjs.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/slidepanel/slidePanel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/flag-icon-css/flag-icon.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap-treeview/bootstrap-treeview.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap-touchspin/bootstrap-touchspin.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap-table/bootstrap-table.css">

    <!-- Plugin -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/chartist-js/chartist.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/asspinner/asSpinner.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/formvalidation/formValidation.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/aspieprogress/asPieProgress.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/footable/footable.core.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/toolbar/toolbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap-select/bootstrap-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/alertify-js/alertify.min.css">

    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/weather-icons/weather-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard/v2.css">

    <!-- Fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/web-icons/web-icons.min.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome/font-awesome.min.css">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>


    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/assets/vendor/html5shiv/html5shiv.min.js"></script>
    <![endif]-->

    <!--[if lt IE 10]>
    <script src="${pageContext.request.contextPath}/assets/vendor/media-match/media.match.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/respond/respond.min.js"></script>
    <![endif]-->

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/assets/vendor/modernizr/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/breakpoints/breakpoints.js"></script>
    <script>
        Breakpoints();
    </script>
</head>