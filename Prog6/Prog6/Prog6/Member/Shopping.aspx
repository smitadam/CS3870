<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Prog6.Member.Shopping" %>

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
        .auto-style1 {
            height: 26px;
        }
    </style>
    <title>CS3870 - Fall 2019 - Program 6 - Shopping</title>
</head>
    <body>
        <form id="ShoppingForm" runat="server">
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
        <table align="center" style:="" width="60%">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Text="Name"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblID" runat="server" Font-Bold="True" Text="ID"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblSubTotal" runat="server" Font-Bold="True" Text="Sub Total"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtSubTotal" runat="server" ReadOnly="True" style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" Text="Price"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTax" runat="server" Font-Bold="True" Text="Tax"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtTax" runat="server" ReadOnly="True" style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="lblQuantity" runat="server" Font-Bold="True" Text="Quantity"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lblGrandTotal" runat="server" Font-Bold="True" Text="Grand Total"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtGrandTotal" runat="server" ReadOnly="True" style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblQuantityError" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Button ID="btnCompute" runat="server" CssClass="btn" Height="32px" OnClick="btnCompute_Click" style="font-weight: 700" Text="Compute" Width="121px" />
                    <asp:Button ID="btnAddCart" runat="server" CssClass="btn" Height="32px" OnClick="btnAddCart_Click" style="font-weight: 700" Text="Add to cart" Width="121px" Enabled="False" />
                </td>
                <td>
                    <asp:Button ID="btnReset" runat="server" CssClass="btn" Height="32px" OnClick="btnReset_Click" style="font-weight: 700" Text="Reset" Width="119px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
