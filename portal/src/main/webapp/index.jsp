<%@ page import="org.mskcc.cbio.portal.servlet.QueryBuilder" %>
<%@ page import="org.mskcc.cbio.portal.util.SessionServiceRequestWrapper" %>
<%@ page import="org.mskcc.cbio.portal.util.GlobalProperties" %>

<%
    String url = request.getRequestURL().toString();
    String baseUrl = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath();
    baseUrl = baseUrl.replace("https://", "").replace("http://", "");
%>


<!DOCTYPE html>
<html class="cbioportal-frontend">
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="/images/cbioportal_icon.png"/>
    <title>cBioPortal for Cancer Genomics</title>
    <script>
        window.frontendConfig = {
            configurationServiceUrl:"//" + '<%=baseUrl%>' +  "/config_service.jsp",
            sessionServiceUrl:'http://www.cbioportal.org/rc/api-legacy/proxy/session/',
            frontendUrl: '//'+ '<%=baseUrl%>/', 
            appVersion: '<%=GlobalProperties.getAppVersion()%>',
            apiRoot: '//'+ '<%=baseUrl%>/',
            baseUrl: '<%=baseUrl%>',
            basePath: '<%=request.getContextPath()%>',
            googleAnalyticsProfile:'UA-85438068-3',
            skinFaqSourceURL:"https://docs.google.com/document/d/e/2PACX-1vSWTtIJZF2tuBimihr8ke-d00DpKh7fydFIQb5xYpE_bMYM9hZyY9OP1Vz1Ts0ow7ob-3h2S19cuB5O/pub?embedded=true",
              // customTabs:[
                        //     {
                        //         "title": "Custom Tab",
                        //         "location": "RESULTS_PAGE",
                        //         "mountCallbackName": "renderCustomTab1",
                        //         "pathsToJs":["http://127.0.0.1:8080/customTab1.js"],
                        //         "showWithMultipleStudies": true,
                        //         "customParameters": { example:1 },
                        //         "unmountOnHide":false
                        //     }
                        // ]
        };
        
        window.localdev = localStorage.localdev === 'true';
        window.localdist = localStorage.localdist === 'true';
        window.heroku = localStorage.heroku;
        
        if (window.localdev) {
            window.frontendConfig.frontendUrl = "//localhost:3000/"
            localStorage.setItem("e2etest", "true");
        } else if (window.heroku) {
            window.frontendConfig.frontendUrl = ['//',localStorage.heroku,'.herokuapp.com','/'].join('');
            localStorage.setItem("e2etest", "true");
        } 

    </script>
    <script type="text/javascript" src="//<%=baseUrl%>/js/src/load-frontend.js?<%=GlobalProperties.getAppVersion()%>"></script>       
    <script>
        window.frontendConfig.customTabs && window.frontendConfig.customTabs.forEach(function(tab){
            if (tab.pathsToJs) {
                tab.pathsToJs.forEach(function(src){
                    document.write('<scr'+'ipt type="text/javascript" src="'+ src +'"></sc'+'ript>');
                });
            }
        });
    </script>

    <script>
            loadReactApp(window.frontendConfig);
    </script>

</head>

<body>
    <div id="reactRoot"></div>
</body>
</html>