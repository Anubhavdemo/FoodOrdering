<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodOrdering.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bgcolor
        {
            background-color :  white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 bgcolor well-lg">
            <h2 class="text-center">Please Login
            </h2>
            <br />
            <br />
            <hr />
            <br />
            <div class="row">
                <div class="col-md-4">
                    <h4>UserName</h4>
                </div>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="uname"
                        CssClass="form-control"
                        placeholder="UserName or Registered Email"></asp:TextBox>
                </div>
            </div>

            <br />
            <div class="row">
                <div class="col-md-4">
                    <h4>Password</h4>
                </div>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="pswd"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Password"></asp:TextBox>
                </div>
            </div>
            <div>
                <h4><asp:Label ID="lblmsg" runat="server"></asp:Label></h4>
            </div>
            <br />
            <div class="row">
                <div>
                    <asp:Button ID="btnsubmit" runat="server"
                        OnClick="btnsubmit_Click"
                        Text="Login"
                        CssClass="btn btn-block btn-success"/>
                </div>
            </div>
            <br />
             <div class="row">
                <div>
                   <asp:HyperLink NavigateUrl="~/Account/Registration.aspx"
                       Text="Don't have an Account? Register here"
                       runat="server">
                   </asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
