<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="FoodOrdering.Customer.SecuredPage.ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.nav li a').each(function () {
                var href = $(this).attr("href");
                href = href.replace(".aspx", "");
                href = href.substring(href.lastIndexOf("/") + 1);
                if (href == "ViewCart") {
                    $(this).addClass("act");
                }

            });
        });
    </script>
    <style>
        .bgcolor {
            /*/background-color: white;*/
            background: rgb(254, 245, 245);
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
            opacity: 0.8;
        }

        .bg {
            background-color: blue;
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

            .bg h1 {
                font-family: cursive;
                color: white;
            }

        img {
            margin-top: 20px;
            margin-bottom: 5px;
            height: 200px;
            width: 160px;
           
        }

        #line {
            height: 3px;
            width: 100%;
        }

        #name {
            font-size: 25px;
            font-family: cursive;
        }

        .total {
            background-color: white;
        }

        #errormsg {
            height: 300px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            background-color: white;
            color: red;
            text-align: center;
        }

            #errormsg h2 {
                margin-top: 120px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-8 well-sm bg col-md-offset-2">
            <h1 class="text-center">Your Cart</h1>
        </div>
    </div>
    <div class="row">
        <%
            int sum = 0;
            if (Session["prodlist"] != null)
            {

                List<FoodOrdering.Model.Product> prodlist = (List<FoodOrdering.Model.Product>)Session["prodlist"];

                if (prodlist.Count() > 0)
                {

                    for (int i = 0; i < prodlist.Count; i++)
                    {


                        FoodOrdering.Model.Product p = prodlist[i];
                        sum += p.Qty * p.Price;


        %>

        <div class="col-md-8 bgcolor col-md-offset-2">
            <div class="col-md-4">
                <div>
                     <img src="../<% Response.Write(p.Img);%>">
                </div>
                <div>
                      <span id="name"><% Response.Write(p.Pname); %></span>
                </div>
            </div>
            <div class="col-md-4">
                <br />
                <br />
                <div class="col-md-6">
                    <h3>Qty &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </h3>
                </div>
                <div class="col-md-6">
                    <h3><%Response.Write(p.Type);%> </h3>
                </div>
                <div class="col-md-6">
                    <h3>Price &nbsp;&nbsp;&nbsp;: </h3>
                </div>
                <div class="col-md-6">
                    <h3>&#8377; <%Response.Write(p.Price); %></h3>
                </div>
                <div class="col-md-6">
                    <h3>Total &nbsp;&nbsp;&nbsp;&nbsp;: </h3>
                </div>
                <div class="col-md-6">
                    <h3>&#8377; <%Response.Write(p.Price * p.Qty); %></h3>
                </div>
                <br />
                <div class="col-md-6">
                    <a href="AddToCart.aspx?pid=<%Response.Write(p.Pid); %>">
                        <input type="button" name="" value="Update" class="btn btn-block btn-warning">
                    </a>
                </div>

                <div class="col-md-6">
                    <a href="DeleteProduct.aspx?pid=<%Response.Write(p.Pid); %>">
                        <input type="button" name="" value="Delete" class="btn btn-block btn-danger">
                    </a>
                </div>
            </div>
            <div>
                 <img id="line" src="../../img/bg.gif" / >
            </div>
        </div>
        <%}%>
    </div>
    <div class="row">
        <div class="col-md-8 total col-md-offset-2">
            <h1 class="text-center">Total Amount : 
               &#8377 <%Response.Write(sum); Session["bill"] = sum; %>
            </h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 well-sm bg-primary col-md-offset-2">
            <div class="col-md-6">
                <a href="../Product.aspx" class="btn btn-block btn-warning">Order More</a>
            </div>
            <div class="col-md-6">
                <a href="ConfirmOreder.aspx" class="btn btn-block btn-success">Place Order</a>
            </div>
        </div>
    </div>

    <%}
        else
        {
    %>
    <div class="col-md-8 col-md-offset-2" id="errormsg">
        <h2>OOPS! YOUR CART IS EMPTY</h2>

        <br />
        <br />
        <div class="col-md-6 col-md-offset-3">
            <a href="../Product.aspx" class="btn btn-lg btn-block btn-primary">Continue</a>
        </div>
    </div>

    <%
            }
        }
        else
        {

    %>

    <div class="col-md-8 col-md-offset-2" id="errormsg">
        <h2>OOPS! YOUR CART IS EMPTY</h2>

        <br />
        <br />
        <div class="col-md-6 col-md-offset-3">
            <a href="../Product.aspx" class="btn btn-lg btn-block btn-primary">Continue</a>
        </div>
    </div>



    <% } %>
</asp:Content>
