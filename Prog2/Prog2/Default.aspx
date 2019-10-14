<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Prog2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CS3870 - Fall 2019 - Program 2</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <style type="text/css">
        .auto-style1 {
            list-style-type: none;
            padding: 0;
            margin: 0;
            position: absolute;
            top: 100px;
            left: 30px;
            width: 12.2em;
            z-index: 1;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="Default" runat="server">
        <h1>Web Protocols Technologies and Applications</h1>
        <h2>Adam Smith</h2>
        <h3>CS 3870: Program 2</h3>
		<ul class="auto-style1">
			<li>
				<a class="btn" href="Default.aspx">Start Page</a>
                <br />
			</li>
			<li>
				<a class="btn" href="OrderingProduct.aspx">Order Form</a>
			</li>
		</ul>
		<ul>
			<li>Dynamic Pages</li>
			<li>PostBack</li>
			<li>Event Procedures</li>
			<li>Validation</li>
			<li>Style and CSS Files</li>
		</ul>
    </form>
</body>
</html>
