<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Prog6.Prog7.Member.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <%@ Register Src="~/Prog7/Member/ShoppingItem.ascx" TagPrefix="ucl" TagName="ShoppingItem" %>
        <link rel="stylesheet" href="../../Style.css" type="text/css" media="screen" />
        <style type="text/css">
            table{
                border: none;
            }
            td{
                border: none;
            }
        </style>
        <title>CS3870 - Fall 2019 - Program 7 - Checkout</title>
    </head>
    <body>
        <form id="Prog7CheckoutForm" runat="server">
            <h1>Web Protocols Technologies and Applications</h1>
            <h2>Adam Smith</h2>
            <h3>
                <asp:SqlDataSource ID="SqlDataSourceCheckout" runat="server" ConnectionString="<%$ ConnectionStrings:UserInfoConnectionString %>" SelectCommand="SELECT * FROM [ShoppingCart]"></asp:SqlDataSource>
                <asp:Label ID="lblLoginName" class="LoginName" runat="server" Text="LoginName"></asp:Label>
                Prog 7
                <asp:Button class="LoginStatus" ID="btnLoginStatus" runat="server" BackColor="White" BorderStyle="None" Font-Underline="True" ForeColor="Blue" Text="LoginStatus" OnClick="btnLoginStatus_Click" UseSubmitBehavior="False" />
            </h3>
            <asp:TreeView class="TreeView" ID="TreeView1" runat="server" ExpandImageToolTip="" DataSourceID="SiteMapDataSource">
                <DataBindings>
                    <asp:TreeNodeBinding DataMember="Default" NavigateUrl="/Default.aspx" Target="Default.aspx"  Text="All Products" />
                    <asp:TreeNodeBinding DataMember="Shopping" NavigateUrl="Shopping.aspx" Target="Shopping.aspx" Text="Shopping" Value="Shopping" />
                    <asp:TreeNodeBinding DataMember="Updating" NavigateUrl="/Admin\Updating.aspx" Text="Updating" Value="Updating" />
                    <asp:TreeNodeBinding DataMember="Checkout" NavigateUrl="Checkout.aspx" Text="Checkout" Value="Checkout" />
                </DataBindings>
                <Nodes>
                    <asp:TreeNode Text="All Products" Value="New Node" NavigateUrl="/Default.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Updating" Value="New Node" NavigateUrl="/Admin\Updating.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Shopping" Value="New Node" NavigateUrl="Shopping.aspx"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="Checkout.aspx" Text="Checkout" Value="New Node"></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
            <asp:SiteMapDataSource ID="SiteMapDataSource" runat="server" />
            <div style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); height: 239px; width: 465px;">
                <table align="center" style:="" width="40%">
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtTotal" runat="server" Width="209px" style="text-align: right" ReadOnly="True">$0.00</asp:TextBox>
                        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" Width="222px" OnClick="btnCheckout_Click" />
                    </td>
                </tr>
            </table>
            </div>

        </form>
    </body>
</html>
