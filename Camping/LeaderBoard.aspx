<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaderBoard.aspx.cs" Inherits="LeaderBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="refresh" content="15">
     <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title>Leaderboard</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Leaderboard</h1>
    <asp:DataGrid ID="dgLeaderBoard" runat="server" AutoGenerateColumns="false" 
                    BackColor="AliceBlue" CellSpacing="5" AlternatingItemStyle-BackColor="Wheat"
                     HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" BorderColor="Black" BorderStyle="Ridge"
                     Width="75%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BorderStyle="Ridge">
                    <Columns>
                        <asp:BoundColumn DataField="FirstName" HeaderText="First Name" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="LastName" HeaderText="Last Name"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Score" HeaderText="Score" DataFormatString="{0:###,###}"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>

        <asp:Label ID="lblLeaders" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
