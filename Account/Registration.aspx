<%@ Page Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FoodOrdering.Account.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <div class="well form-horizontal" id="contact_form">
                <fieldset>
                <!-- Form Name -->
                <legend>
                    <center><h2><b>Registration Form</b></h2></center>
                </legend>
                <br>
                 <h4 class="text-center">
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </h4>
                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">First Name</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="fname" runat="server" name="first_name" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="fname"
                                ErrorMessage="this field is required"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="fname"
                                ErrorMessage="Special charaters and numbers not allowed"
                                ValidationExpression="[a-zA-Z/s]*"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>

                        </div>
                    </div>
                </div>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Last Name</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="lname" runat="server" name="last_name" placeholder="Last Name" CssClass="form-control" type="text"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="lname"
                                ErrorMessage="this field is required"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="lname"
                                ErrorMessage="Special charaters and numbers not allowed"
                                ValidationExpression="[a-zA-Z/s]*"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>



                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Username</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox AutoPostBack="true" OnTextChanged="uname_TextChanged" runat="server" ID="uname" name="user_name" placeholder="Username" CssClass="form-control" type="text"></asp:TextBox>
                            <span>
                                <asp:Label ForeColor="Red" runat="server" ID="lbluser"></asp:Label>
                            </span> 
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="uname"
                                ErrorMessage="this field is required"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Password</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox runat="server" ID="pswd" name="user_password" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="pswd"
                                ErrorMessage="this field is required"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Text input-->

                <div class="form-group">
                    <label class="col-md-4 control-label">Confirm Password</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox runat="server" ID="cnfpswd" name="confirm_password" placeholder="Confirm Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="cnfpswd"
                                ErrorMessage="this field is required"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                             <asp:CompareValidator runat="server"
                                 ControlToCompare="pswd"
                                ControlToValidate="cnfpswd"
                                ErrorMessage="password not matches"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:CompareValidator>
                        </div>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">E-Mail</label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <asp:TextBox runat="server" ID="email" name="email"
                                OnTextChanged="email_TextChanged"
                                AutoPostBack="true"
                                placeholder="E-Mail Address"
                                CssClass="form-control" type="text"></asp:TextBox>
                              <span>
                                <asp:Label ForeColor="Red" runat="server" ID="lblemail"></asp:Label>
                            </span> 
                             <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="email"
                                ErrorMessage="this field is required"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="email"
                                ErrorMessage="Email format is not correct"
                                ForeColor="Red"
                                Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>


                <!-- Text input-->

                <!-- Success message -->

                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-4">
                        <asp:Button CssClass="btn btn-block btn-warning" 
                            runat="server" Text="Submit" ID="btnsubmit" OnClick="btnsubmit_Click" />
                    </div>
                   
                </div>

            </fieldset>
        </div>
    </div>
    <!-- /.container -->
</asp:Content>

