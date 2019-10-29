<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updating.aspx.cs" Inherits="Prog3.Updating" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <title>CS3870 - Fall 2019 - Program 3</title>
    <style type="text/css">
        .auto-style1 {
            list-style-type: none;
            padding: 0;
            margin: 0;
            position: absolute;
            top: 100px;
            left: 30px;
            width: 12em;
            z-index: 1;
            text-align: left;
        }
        table{
            border: none;
        }
        td{
            border: none;
        }
    </style>
</head>
<body>
<form id="UpdatingForm" runat="server">
        <h1>Web Protocols Technologies and Applications</h1>
        <h2>Adam Smith</h2>
		<ul class="auto-style1">
			<li>
				<a class="btn" href="MasterContent.aspx">Start Page</a>
			</li>
			<li>
				<a class="btn" href="Default.aspx">All Products</a>
			</li>
		</ul>
        <table style: align= "center">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblID" runat="server" Font-Bold="True" Text="ID"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Text="Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" Text="Price"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblDescription" runat="server" Font-Bold="True" Text="Description"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Button ID="btnPrevious" runat="server" style="font-weight: 700" Text="Previous" CssClass="btn" Width="119px" Height="32px" OnClick="btnPrevious_Click" />
                    <asp:Button ID="btnNext" runat="server" style="font-weight: 700" Text="Next" CssClass="btn" Width="121px" Height="32px" OnClick="btnNext_Click" />
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" style="font-weight: 700" Text="Add" CssClass="btn" Width="119px" Height="32px" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnDelete" runat="server" style="font-weight: 700" Text="Delete" CssClass="btn" Width="119px" Height="32px" OnClick="btnDelete_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Button ID="btnFirst" runat="server" style="font-weight: 700" Text="First" CssClass="btn" Width="119px" Height="32px" OnClick="btnFirst_Click" />
                    <asp:Button ID="btnLast" runat="server" style="font-weight: 700" Text="Last" CssClass="btn" Width="119px" Height="32px" OnClick="btnLast_Click" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnUpdate" runat="server" style="font-weight: 700" Text="Update" CssClass="btn" Width="119px" Height="32px" OnClick="btnUpdate_Click" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtMessage" runat="server" Width="169px"></asp:TextBox>
                </td>
            </tr>
            </table>
    </form>
</body>
</html>
