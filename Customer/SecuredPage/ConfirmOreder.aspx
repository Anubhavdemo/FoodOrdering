<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="ConfirmOreder.aspx.cs" Inherits="FoodOrdering.Customer.SecuredPage.ConfirmOreder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bgcolor {
            background-color: black;
            color: white;
        }

        .size {
            height: 50px;
            width: 50px;
            border-radius: 25px;
        }

        /*#MainContent_p3{
          
        }*/

        #errormsg {
            margin-top: 150px;
            margin-left: 300px;
            height: 300px;
            border-radius: 20px;
            background-color: white;
            color: red;
            text-align: center;
            z-index: 100;
            position: fixed;
        }

            #errormsg h2 {
                margin-top: 120px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="p3" runat="server" Visible="false">
        <div class="col-md-6 col-md-offset-3" id="errormsg">
            <h2 class="text-success">Order Placed Successfully!...</h2>

            <br />
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <asp:Button
                        CssClass="btn btn-block btn-success"
                        ID="btnok" Text="OK" runat="server"
                        OnClick="btnok_Click" />
                </div>
            </div>

        </div>
    </asp:Panel>

    <div class="row">
        <div class="well-lg bgcolor col-md-8 col-md-offset-2">
            <fieldset>
                <legend class="text-success">
                    <asp:Label runat="server" ID="lblheading"></asp:Label>
                </legend>
                <asp:Panel ID="p1" runat="server"
                    Visible="false">
                    <div class="row">
                        <div class="col-md-2">
                            <label>Address</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lbladdress"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <label>Land Mark</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lblmark"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <label>Contact Number</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lblmob"></asp:Label>
                        </div>
                    </div>

                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <label>Contact Person</label>
                        </div>
                        <div class="col-md-10">
                            <asp:Label runat="server"
                                ID="lblname"></asp:Label>
                        </div>
                    </div>

                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-7">
                            <asp:Button Text="Edit"
                                runat="server"
                                ID="btnedid"
                                OnClick="btnedid_Click"
                                CssClass="btn btn-block btn-primary" />
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="p2" runat="server"
                    Visible="false">
                    <div class="row">
                        <div class="col-md-2">
                            <label>Address</label>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Rows="3"
                                ID="txtaddress"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <label>Land Mark</label>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox runat="server"
                                CssClass="form-control"
                                ID="txtmark"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <label>Contact Number</label>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox runat="server"
                                CssClass="form-control"
                                ID="txtmob"></asp:TextBox>
                        </div>
                    </div>

                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <label>Contact Person</label>
                        </div>
                        <div class="col-md-10">
                            <asp:TextBox runat="server"
                                CssClass="form-control"
                                ID="txtname"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-7">
                            <asp:Button Text="Save"
                                runat="server"
                                ID="btnsaveaddress"
                                OnClick="btnsaveaddress_Click"
                                CssClass="btn btn-block btn-primary" />
                        </div>
                    </div>
                </asp:Panel>

            </fieldset>
        </div>
    </div>
    <br />
    <br />

    <div class="row">
        <div class="well-lg bgcolor col-md-8 col-md-offset-2">
            <fieldset>
                <legend class="text-success">Order Details
                    <span class="pull-right">
                        <%
                            if (p1.Visible)
                            {
                        %>
                        <asp:Button ID="placeorder" runat="server"
                            OnClick="placeorder_Click"
                            Text="Confirm Order" CssClass="btn  btn-warning" />
                        <%
                            }
                        %>
                    </span>
                </legend>
                <div class="row">
                    <div class="col-md-4">
                        <b>Item </b>
                    </div>

                    <div class="col-md-4">
                        <b>QUANTITY</b>
                    </div>
                    <div class="col-md-4">
                        <b>Amount</b>
                    </div>
                </div>

                <br />
                <br />
                <asp:Repeater ID="rptitem" runat="server">
                    <ItemTemplate>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="row">
                                    <asp:Label Text='<%# DataBinder.Eval(Container.DataItem,"pname") %>' runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <span>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>'></asp:Label>

                                </span>
                            </div>
                            <div class="col-md-4">
                                &#8377 
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"total") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <br />
                <hr />
                <div class="row">
                    <div class="col-md-4">
                        <b>Total </b>
                    </div>
                    <div class="col-md-4">
                        <b>
                            <asp:Label runat="server" ID="totalqty"></asp:Label>
                            <span>Unit(s)</span>
                        </b>
                    </div>
                    <div class="col-md-4">
                        <b><span>&#8377 </span>
                            <asp:Label ID="totalprice" runat="server"></asp:Label>
                        </b>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>




</asp:Content>
