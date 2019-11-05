﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Prog5.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <style type="text/css">
        table{
            border: none;
        }
        td{
            border: none;
        }
    </style>
    <title>CS3870 - Fall 2019 - Program 5 - Default</title>
</head>
    <body>
        <form id="DefaultForm" runat="server">
            <h1>Web Protocols Technologies and Applications</h1>
            <h2>Adam Smith</h2>
            <h3>
                <asp:Label ID="lblLoginName" class="LoginName" runat="server" Text="LoginName"></asp:Label>
                Prog 5
                <asp:Button class="LoginStatus" ID="btnLoginStatus" runat="server" BackColor="White" BorderStyle="None" Font-Underline="True" ForeColor="Blue" Text="LoginStatus" OnClick="btnLoginStatus_Click" UseSubmitBehavior="False" />
            </h3>
            <asp:TreeView class="TreeView" ID="TreeView1" runat="server" ExpandImageToolTip="">
                <DataBindings>
                    <asp:TreeNodeBinding DataMember="Default" NavigateUrl="Default.aspx" Target="Default.aspx"  Text="All Products" />
                    <asp:TreeNodeBinding DataMember="Shopping" NavigateUrl="Shopping.aspx" Target="Shopping.aspx" Text="Shopping" Value="Shopping" />
                    <asp:TreeNodeBinding DataMember="Updating" NavigateUrl="Updating.aspx" Text="Updating" Value="Updating" />
                    <asp:TreeNodeBinding DataMember="Checkout" NavigateUrl="Checkout.aspx" Text="Checkout" Value="Checkout" />
                </DataBindings>
                <Nodes>
                    <asp:TreeNode Text="All Products" Value="New Node" NavigateUrl="Default.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Updating" Value="New Node" NavigateUrl="Updating.aspx"></asp:TreeNode>
                    <asp:TreeNode Text="Shopping" Value="New Node" NavigateUrl="Shopping.aspx"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="Checkout.aspx" Text="Checkout" Value="New Node"></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
                        <div style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); height: 239px; width: 465px;">
                <asp:GridView ID="ProductGrid" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ProductID" style="align-items: center; text-align: left;" AllowPaging="True" PageSize="5" DataSourceID="SqlDataSource" Height="231px" Width="456px">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" SortExpression="ProductID">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" DataFormatString="{0:C2}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" Font-Bold="True" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UWPCS3870ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
            </div>
    </form>
</body>
</html>