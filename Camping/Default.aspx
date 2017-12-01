<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                else
                {
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
                }

              
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
                    $("#login").hide();
                    $("#menu-toggle").hide();
                    $("#create").hide();
                    $("#time").hide();
                    $("#lblMessage").html("");
                    $("#timespent").fadeIn("fast");
                    $("#Title").html("Your Time and Score");
                    $("#Title").css("font-size", "24px");

                    $("#Title").animate({ fontSize: '3em' }, "slow");
                }
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
    <script  type="text/javascript">
       function prevent_previous_page_return()
       {
           window.history.forward();
       }
       var isSubmitted = false;
 
       function preventMultipleSubmissions() {

           if (!isSubmitted) {

               $('#<%=btnEnterTime.ClientID %>').val('Submitting.. Please Wait..');

               isSubmitted = true;

               return true;

           }

           else {

               return false;

           }
       }
   </script>
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
                <asp:Panel ID="pnLogin" DefaultButton="btnSubmit" runat="server">
                    <div id="login" style="display: none">
                        <table class="table-hover">
                            <tr>
                                <td>User Name:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtUserName" ForeColor="Red" ErrorMessage="*" ValidationGroup="login" runat="server"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Password:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPWD" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtPWD" ForeColor="Red" ErrorMessage="*" ValidationGroup="login" runat="server"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnSubmit" Text="Login" runat="server" OnClick="btnSubmit_Click" ValidationGroup="login" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="#createaccount" id="createaccount">Create Account</a>
                                </td>
                            </tr>
                        </table>

                    </div>
                </asp:Panel>
                <asp:Panel ID="pnCreate" runat="server" DefaultButton="btnCreate">
                    <div id="create" style="display: none">
                        <table class="table-hover">
                            <tr>
                                <td>First Name:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtFirstName" ForeColor="Red" ErrorMessage="*" ValidationGroup="create" runat="server"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Last Name:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtLastName" ForeColor="Red" ErrorMessage="*" ValidationGroup="create" runat="server"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>User Name:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtUser" ForeColor="Red" ErrorMessage="*" ValidationGroup="create" runat="server"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Password:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="*" ValidationGroup="create" runat="server"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnCreate" Text="Create Account" runat="server" OnClick="btnCreate_Click" ValidationGroup="create" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="#" id="loginlink">Login</a>
                                </td>
                            </tr>
                        </table>

                    </div>
                </asp:Panel>
                <asp:Panel ID="pnTime" runat="server" DefaultButton="btnEnterTime">
                    <div id="time" style="display: none">
                        <table class="table-hover">
                            <tr>
                                <td>Date:&nbsp;
                                </td>
                                <td>

                                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="time" ControlToValidate="txtDate" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Time Spent:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTimeSpent" runat="server"></asp:TextBox>&nbsp;minutes
                                    <asp:RequiredFieldValidator ValidationGroup="time" ControlToValidate="txtTimeSpent" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="time" ControlToValidate="txtTimeSpent" ErrorMessage="Please enter a number." ForeColor="Red" ValidationExpression="\d+" runat="server"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Project Type:&nbsp;
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProjectType" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Description:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" Columns="40"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Authorized By:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAuthorizedBy" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="time" ControlToValidate="txtAuthorizedBy" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Admin PWD:&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAdminPWD" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="time" ControlToValidate="txtAdminPWD" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnEnterTime" Text="Enter Time" runat="server" OnClick="btnEnterTime_Click" ValidationGroup="time" OnClientClick="return preventMultipleSubmissions();" />
                                </td>
                            </tr>

                        </table>

                    </div>
                </asp:Panel>
                <div id="timespent" style="display: none">

                    <asp:DataGrid ID="dgTimeSpent" runat="server" AutoGenerateColumns="false"
                        BackColor="#274a6e" CellSpacing="50" CellPadding="50" ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-BackColor="#669999"
                        HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" BorderColor="Black" BorderStyle="Double"
                        Width="500" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="None" ItemStyle-ForeColor="White"
                        AlternatingItemStyle-ForeColor="Black">
                        <Columns>
                            <asp:BoundColumn DataField="ProjectType" HeaderText="Project"></asp:BoundColumn>
                            <asp:BoundColumn DataField="MinutesSpent" HeaderText="Minutes Spent" DataFormatString="{0:###,###}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Score" HeaderText="Score" DataFormatString="{0:###,###}"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                    <p></p>

                        <asp:Label ID="lblTimeSpent" runat="server" Font-Bold="true" Font-Size="Larger" Font-Names="Tahoma"></asp:Label>
                        <p></p>
                        <asp:Label ID="lblTotalScore" runat="server" Font-Bold="true" Font-Size="Larger" Font-Names="Tahoma"></asp:Label>
                        <p>
                            <h4><strong>Current Badge:</strong></h4><br />
                            <asp:Image ID="imgCurrentBadge" runat="server" />
                        </p>                  
                </div>

                <div id="leaderboard" style="display: none">

                    <asp:Label ID="lblLeaders" runat="server"></asp:Label>

                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->


    </form>
</body>

</html>
