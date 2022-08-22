<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="FoodOrdering.Admin.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bgcolor {
            background: rgb(254, 245, 245);
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            opacity: 0.8;
            color: green;
        }
    </style>
    <script>


        function AlertMessage(message, cssclass) {
            $("#spnmsg").html(message);
            $("#altmsg").addClass(cssclass);
            $("#altmsg").show('fade');

            setInterval(function () {
                $("#altmsg").hide('fade');
            }, 5000);
        }

        function CloseAlertMessage() {
            $("#altmsg").hide('fade');
        }

        function Preview(e) {
            var reader = new FileReader();
            reader.onload = function () {
                //alert(reader.result);
                document.getElementById("prev").setAttribute("src", reader.result);
            }
            reader.readAsDataURL(e.target.files[0])
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-8 col-md-offset-2 bgcolor well-lg">
        <div id="altmsg" class="alert alert-success collapse">
            <a onclick="CloseAlertMessage()" href="#" class="close" aria-label="close">&times;</a>
            <strong>Success!</strong> <span id="spnmsg"></span>.
        </div>


        <div class="form-group">
            <div class="row">
                <div class="form-group">
                    <div class="col-md-4">
                        <asp:RequiredFieldValidator
                            runat="server" ControlToValidate="txtfile"
                            ErrorMessage="Please Select Image"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <div style="height: 200px; width: 190px; border: 1px medium gray">
                            <img id="prev" src="../img/gallery/Icon.jpg"
                                style="height: 166px;"
                                class="img-thumbnail img-responsive" />
                            <asp:FileUpload runat="server"
                                ID="txtfile"
                                Width="189"
                                Style="margin-left: 0px;"
                                onchange="Preview(event)"
                                CssClass="btn btn-sm btn-primary" />

                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Vegetable Name</label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="txtfname"
                                    CssClass="form-control"
                                    autocomplete="off">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator
                                    runat="server" ControlToValidate="txtfname"
                                    ErrorMessage="Please Enter Vegetable Name"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-4">
                                    <label>Select Unit</label>
                                </div>
                                <div class="col-md-8">
                                    <asp:DropDownList runat="server" ID="units"
                                        CssClass="form-control"
                                        >
                                        <asp:ListItem Value="-1">Select Unit</asp:ListItem>
                                         <asp:ListItem Value="per kg">per kg</asp:ListItem>
                                         <asp:ListItem Value="per unit">per unit</asp:ListItem>
                                         <asp:ListItem Value="500 gm">500 gm</asp:ListItem>
                                         <asp:ListItem Value="250 gm">250 gm</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator
                                        runat="server" ControlToValidate="units"
                                        ErrorMessage="Please select Unit"
                                        InitialValue="-1"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Price Per Unit/Kg</label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="txtprice"
                                    CssClass="form-control"
                                    autocomplete="off">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator
                                    runat="server" ControlToValidate="txtprice"
                                    ErrorMessage="Please Enter Price"
                                    ForeColor="Red" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    runat="server" ControlToValidate="txtprice"
                                    ErrorMessage="Price should in Number"
                                    ValidationExpression="[0-9]*"
                                    ForeColor="Red" Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-4">
                                    <label>Category</label>
                                </div>
                                <div class="col-md-8">
                                    <asp:DropDownList runat="server" ID="ddlcat"
                                        CssClass="form-control"
                                        DataTextField="cname"
                                        DataValueField="cid">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator
                                        runat="server" ControlToValidate="ddlcat"
                                        ErrorMessage="Please select Category"
                                        InitialValue="-1"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="form-group">
                    <div class="col-md-4">
                        <label>Description </label>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox TextMode="MultiLine" Rows="5"
                            MaxLength="400"
                            runat="server" ID="txtdesc"
                            CssClass="form-control"
                            autocomplete="off"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="form-group">
                    <div class="col-md-3 col-md-offset-1">
                        <asp:Button Text="Save"
                            runat="server"
                            ID="btnsave"
                            OnClick="btnsave_Click"
                            CssClass="btn btn-block btn-success" />
                    </div>
                    <div class="col-md-3">
                        <input type="reset" value="Clear"
                            class="btn btn-block btn-danger" />
                        <%--                    <asp:Button Text="Clear"
                        CausesValidation="false"
                        runat="server"
                        CssClass="btn btn-block btn-danger" />--%>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
