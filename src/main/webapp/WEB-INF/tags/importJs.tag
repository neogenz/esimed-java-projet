<%@ tag language="java" pageEncoding="UTF-8" %>
<%--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<%--<script--%>
<%--src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"--%>
<%--integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"--%>
<%--crossorigin="anonymous"></script>--%>

<!-- Core -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/animsition/jquery.animsition.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/asscroll/jquery-asScroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/mousewheel/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/asscrollable/jquery.asScrollable.all.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/ashoverscroll/jquery-asHoverScroll.js"></script>

<!-- Plugins -->
<script src="${pageContext.request.contextPath}/assets/vendor/switchery/switchery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/intro-js/intro.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/screenfull/screenfull.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slidepanel/jquery-slidePanel.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/skycons/skycons.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist-js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/aspieprogress/jquery-asPieProgress.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jvectormap/jquery-jvectormap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jvectormap/maps/jquery-jvectormap-ca-lcc-en.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/matchheight/jquery.matchHeight-min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/bootstrap-datepicker.fr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/asspinner/jquery-asSpinner.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/formvalidation/formValidation.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/formvalidation/framework/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-table/extensions/mobile/bootstrap-table-mobile.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/chartist-js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/aspieprogress/jquery-asPieProgress.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/footable/footable.all.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/webui-popover/jquery.webui-popover.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/toolbar/jquery.toolbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-select/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/alertify-js/alertify.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/asbreadcrumbs/jquery-asBreadcrumbs.min.js"></script>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/site.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/sections/menu.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sections/menubar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sections/sidebar.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/configs/config-colors.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/configs/config-tour.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/components/asscrollable.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/animsition.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/slidepanel.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/switchery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/matchheight.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/jvectormap.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/bootstrap-treeview.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/material.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/asspinner.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/bootstrap-touchspin.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/webui-popover.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/toolbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/asbreadcrumbs.js"></script>


<script>
    $(document).ready(function ($) {
        Site.run();

        (function () {
            var snow = new Skycons({
                "color": $.colors("blue-grey", 500)
            });
            snow.set(document.getElementById("widgetSnow"), "snow");
            snow.play();

            var sunny = new Skycons({
                "color": $.colors("blue-grey", 700)
            });
            sunny.set(document.getElementById("widgetSunny"), "clear-day");
            sunny.play();
        })();
    });
</script>