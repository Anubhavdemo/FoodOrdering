<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="FoodOrdering.Customer.SecuredPage.AddToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bgcolor {
            background-color: white;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
        }

        .bg {
            background-color: green;
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
            margin-top: 50px;
            margin-bottom: 5px;
            height: 230px;
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%

        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(cs);
        conn.Open();
        int pid;

        if (Request.QueryString["pid"] != null && int.TryParse(Request.QueryString["pid"], out pid))
        {

            String query = "select pid, image, pname, price, [type] from tblproduct where pid =  " + pid;
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn);

            System.Data.SqlClient.SqlDataReader sr = cmd.ExecuteReader();

            if (sr.Read())
            {

                Session["pid"] = (int)sr["pid"];
                Session["pname"] = sr["pname"].ToString();
                Session["price"] = (int)sr["price"];
                Session["img"] = sr["image"].ToString();
    %>

    <div class="row">
        <div class="well-sm col-md-8 col-md-offset-2 bg text-center">
            <h1 class="text-success">Your Orders</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 col-md-offset-2 bgcolor">

            <div class="col-md-4">
                <div class="">
                    <img src="../<% Response.Write(sr["image"]); %>">

                    <asp:Label CssClass="btn-block" ID="lblmsg" runat="server" Font-Bold="True"
                        Font-Names="Times New Roman" Font-Size="Large" ForeColor="#9900FF"
                        Text="Added in Cart Successfully...!"></asp:Label>
                    <br />
                    <asp:HyperLink ID="hl" runat="server" Font-Bold="True"
                        Font-Names="Times New Roman" Font-Size="Large" ForeColor="#336600"
                        NavigateUrl="~/Customer/SecuredPage/ViewCart.aspx">View Cart</asp:HyperLink>
                </div>
            </div>
            <div class="col-md-6">
                <div class="">

                    <h3>Titel : <% Response.Write(sr["pname"]); %></h3>
                    <br />
                    <h3>Price : &#8377 <% Response.Write(sr["price"]);  Response.Write(" / "+sr["type"]);%></h3>
                    <p>&nbsp;
                       <%-- <span>  <% Response.Write(sr["type"]); %></span>--%>
                    </p>
                   
                    <div class="row">
                        <div class="col-md-6">
                             <h3>Select Quantity:  </h3>
                        </div>
                        <div class="col-md-6">
                            <br />
                            <asp:DropDownList ID="ddlunit"
                                CssClass="form-control"
                                runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>



                    <%--  <asp:TextBox ID="txtqty" runat="server" Style="width: 30px; height: 25px"></asp:TextBox></h3>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Number Only" ControlToValidate="txtqty" Text="*" Display="Dynamic" ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Some Quantity" Text="*" Display="Dynamic" ControlToValidate="txtqty"></asp:RequiredFieldValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    --%><br />
                    <br />
                    <asp:HyperLink Text="Go Back" CssClass="btn btn-warning"
                        runat="server" NavigateUrl="~/Customer/Product.aspx"></asp:HyperLink>
                    <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" Text="Add to Cart" class="add_qty_btn"
                        OnClick="Button1_Click" />
                    &nbsp;&nbsp;
        	
       

                    <br />
                    <br />

                </div>
            </div>
        </div>
    </div>
    <%}
            else
            {
                Response.Redirect("~/Customer/Book.aspx");
            }
        }
        else
        {

            Response.Redirect("~/Customer/Book.aspx");

        }%>
</asp:Content>
