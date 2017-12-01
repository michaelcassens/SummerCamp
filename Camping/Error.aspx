<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Summer Camp <%=DateTime.Now.Year %></title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <script src="js/jquery.cookie.js"></script>

    <!-- Menu Toggle Script -->
    <script>
        $(document).ready(function () {

            if ($.cookie('camperID') != null) {
                loginhref.innerText = "Logout";
            }
            else {
                loginhref.innerHTML = "Login";
            }
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");


            });

            $("#loginhref").click(function (e) {
                if ($.cookie('camperID') == null) {
                    $("#leaderboard").hide();
                    $("#login").fadeIn("fast");
                    $("#menu-toggle").hide();
                    $("#create").hide();
                    $("#time").hide();
                    $("#lblMessage").html("");
                    $("#timespent").hide();
                    $("#Title").html("Login");
                    $("#Title").css("font-size", "24px");
                    $("#Title").animate({ fontSize: '3em' }, "slow");
                }
                else {
                    $("#leaderboard").hide();
                    $.cookie('camperID', null, { path: '/' });
                    $.removeCookie('camperID', { path: '/' });
                    loginhref.innerHTML = "Login";
                    $("#login").fadeIn("fast");
                    $("#menu-toggle").hide();
                    $("#create").hide();
                    $("#time").hide();
                    $("#lblMessage").html("");
                    $("#timespent").hide();
                    location.href = "Default.aspx";

                }

            });

            $("#entertimehref").click(function (e) {
                $("#leaderboard").hide();
                $("#login").hide();
                $("#menu-toggle").hide();
                $("#create").hide();
                $("#time").fadeIn("fast");
                $("#lblMessage").html("");
                $("#timespent").hide();
                $("#Title").html("Enter Time");
                $("#Title").css("font-size", "24px");

                $("#Title").animate({ fontSize: '3em' }, "slow");
            });

            $("#createaccount").click(function (e) {
                $("#leaderboard").hide();
                $("#login").hide();
                $("#menu-toggle").hide();
                $("#create").fadeIn("fast");
                $("#time").hide();
                $("#lblMessage").html("");
                $("#timespent").hide();
                $("#Title").html("Create Account");
                $("#Title").css("font-size", "24px");

                $("#Title").animate({ fontSize: '3em' }, "slow");
            });


            $("#loginlink").click(function (e) {


                $("#leaderboard").hide();
                $("#login").fadeIn("fast");
                $("#menu-toggle").hide();
                $("#create").hide();
                $("#time").hide();
                $("#lblMessage").html("");
                $("#timespent").hide();
                $("#Title").html("Login");
                $("#Title").css("font-size", "24px");

                $("#Title").animate({ fontSize: '3em' }, "slow");

            });


            $("#timehref").click(function (e) {

                $("#leaderboard").hide();
                $("#login").hide();
                $("#menu-toggle").hide();
                $("#create").hide();
                $("#time").hide();
                $("#lblMessage").html("");
                $("#timespent").fadeIn("fast");
                $("#Title").html("Your Time and Score");
                $("#Title").css("font-size", "24px");

                $("#Title").animate({ fontSize: '3em' }, "slow");

            });

            $("#leaderhref").click(function (e) {

                $("#login").hide();
                $("#menu-toggle").hide();
                $("#create").hide();
                $("#time").hide();
                $("#lblMessage").html("");
                $("#timespent").hide();
                $("#leaderboard").fadeIn("fast");
                $("#Title").html("Leaderboard");
                $("#Title").css("font-size", "24px");
                $("#Title").animate({ fontSize: '3em' }, "slow");
            });

        });

    </script>
      
    <script src="js/main.js"></script>
   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body onload="prevent_previous_page_return();">
    <form runat="server">
        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#"><%=DateTime.Now.Year %>
                        </a>
                    </li>
                    <li>
                        <a href="#login" id="loginhref">Login</a>
                    </li>
                    <li>
                        <a href="#entertime" id="entertimehref" onclick="enableButton();">Enter Time</a>
                    </li>
                    <li>
                        <a href="#view" id="timehref">View Your Time</a>
                    </li>

                    <li>
                        <a href="#leaderboard" id="leaderhref">Leaderboard</a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="images/UM Main Logo Maroon.jpg" />
                            <h1 id="Title">Computer Science Summer Camp </h1>

                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <p></p>
                            <!--<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Side Menu</a>-->
                        </div>
                    </div>
                </div>
               
                    <div id="login" style="display: none">
                        <table class="table-hover">
                            <tr>
                                <td colspan="2">There was an error.  Please try again.  Make sure you are logged in.</td>
                            </tr>
                            
                        </table>

                    </div>
               
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->


    </form>
</body>

</html>