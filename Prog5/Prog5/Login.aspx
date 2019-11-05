<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Prog5.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <title>CS3870 - Fall 2019 - Program 5 - Login</title>
    <style type="text/css">
        table{
            border: none;
        }
        td{
            border: none;
        }
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="LoginForm" runat="server">
        <h1>Web Protocols Technologies and Applications</h1>
        <h2>Adam Smith</h2>
        <table align="center" style:="" width="40%">
            <tr>
                <td class="auto-style1">
                    <asp:HyperLink Target="_self" ID="HyperLink1" runat="server" Font-Underline="True" NavigateUrl="CreateUser.aspx">Register new user</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblLogIn" runat="server" Text="Log In"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;<asp:Label ID="lblUserName" runat="server" Text="User Name: "></asp:Label>
                    <asp:TextBox ID="txtUserName" runat="server" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server" ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Password:  "></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:CheckBox ID="cbRemember" runat="server" Text="Remember me next time." />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Text="ErrorMessage" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnLogin" runat="server" Height="22px" OnClick="btnLogin_Click" Text="Log In" />
                </td>
            </tr>
            </table>
    </form>
</body>
</html>
