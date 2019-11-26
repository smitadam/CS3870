<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetRoles.aspx.cs" Inherits="Prog6.Admin.SetRoles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="/Style.css" type="text/css" media="screen" />
    <style type="text/css">
        table{
            border: none;
        }
        td{
            border: none;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
    <title>CS3870 - Fall 2019 - Program 6 - Shopping</title>
</head>
    <body>
        <form id="SetRolesForm" runat="server">
            <h1>Web Protocols Technologies and Applications</h1>
            <h2>Adam Smith</h2>
            <h3>
                <asp:Label ID="lblLoginName" class="LoginName" runat="server" Text="LoginName"></asp:Label>
                Prog 6
                <asp:Button class="LoginStatus" ID="btnLoginStatus" runat="server" BackColor="White" BorderStyle="None" Font-Underline="True" ForeColor="Blue" Text="LoginStatus" OnClick="btnLoginStatus_Click" UseSubmitBehavior="False" />
            </h3>
            <asp:TreeView class="TreeView" ID="TreeView1" runat="server" ExpandImageToolTip="" DataSourceID="SiteMapDataSource">
                <DataBindings>
                    <asp:TreeNodeBinding DataMember="Default" NavigateUrl="/Default.aspx" Target="Default.aspx"  Text="All Products" />
                    <asp:TreeNodeBinding DataMember="Shopping" NavigateUrl="/Member\Shopping.aspx" Target="Shopping.aspx" Text="Shopping" Value="Shopping" />
                    <asp:TreeNodeBinding DataMember="Updating" NavigateUrl="Updating.aspx" Text="Updating" Value="Updating" />
                    <asp:TreeNodeBinding DataMember="Checkout" NavigateUrl="/Member\Checkout.aspx" Text="Checkout" Value="Checkout" />
                </DataBindings>
                <Nodes>
                    <asp:TreeNode Text="All Products" Value="New Node" NavigateUrl="/Default.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Updating" Value="New Node" NavigateUrl="Updating.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Shopping" Value="New Node" NavigateUrl="/Member\Shopping.aspx"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="/Member\Checkout.aspx" Text="Checkout" Value="New Node"></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
            <asp:SiteMapDataSource ID="SiteMapDataSource" runat="server" />
        <table align="center" style:="" width="60%">
            <tr>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:TextBox ID="txtRole" runat="server" Width="145px"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddUsers" runat="server" DataSourceID="SqlDataSourceUsers" DataTextField="userID" DataValueField="userID" Height="16px" Width="166px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:UserInfoConnectionString %>" SelectCommand="SELECT [userID] FROM [UserData]" DeleteCommand="DELTE FROM [UserData] WHERE [userID] = @UserID">
                        <DeleteParameters>
                            <asp:Parameter Name="UserID" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnDeleteUser" runat="server" CssClass="btn" Height="32px" OnClick="btnDeleteUser_Click" style="font-weight: 700" Text="Delete User" Width="121px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Button ID="btnAddRole" runat="server" CssClass="btn" Height="32px" OnClick="btnAddRole_Click" style="font-weight: 700" Text="Add Role" Width="196px" />
                    <asp:Button ID="btnRemoveRole" runat="server" CssClass="btn" Height="32px" OnClick="btnRemoveRole_Click" style="font-weight: 700" Text="Remove Role" Width="196px" />
                </td>
                <td>
                    <asp:Button ID="btnAddUserToRole" runat="server" CssClass="btn" Height="32px" OnClick="btnAddUserToRole_Click" style="font-weight: 700" Text="Add User to Role" Width="196px" />
                    <asp:Button ID="btnRemoveUserFromRole" runat="server" CssClass="btn" Height="32px" OnClick="btnRemoveUserFromRole_Click" style="font-weight: 700" Text="Remove User from Role" Width="196px" />
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
                    <asp:DropDownList ID="ddSelectRole" runat="server" DataSourceID="SqlDataSourceRoles" DataTextField="RoleName" DataValueField="RoleName" Height="16px" Width="166px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:UserInfoConnectionString %>" SelectCommand="SELECT * FROM [RoleInfo]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList ID="ddUsersInRole" runat="server" Height="16px" Width="166px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style2">
                </td>
            </tr>
            </table>
            <asp:TextBox ID="txtMessage" runat="server" Height="78px" TextMode="MultiLine" Width="464px"></asp:TextBox>
    </form>
</body>
</html>
