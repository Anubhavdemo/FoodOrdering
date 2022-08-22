<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FoodOrdering.Customer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../script/scripts.js"></script>
    <style>
        .bookimg {
            height: 230px;
            width: 160px;
        }

        body{
           background-image:url('');
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="banner">
        <img src="../img/slide1.jpg" class="bannerimg">
        <img src="../img/slide2.jpg" class="bannerimg">
        <img src="../img/slide3.jpg" class="bannerimg">
        <img src="../img/slide4.jpg" class="bannerimg">
        <img src="../img/slide5.jpg" class="bannerimg">
    </div>
    <br />
    <br />
   <div>
       <div class="row">
           <div class="col-md-4 col-md-offset-1">
               <img src="../img/gallery/vegetable.jpg"
                   style="width : 400px; height:300px;"
                   />
           </div>
           <div class="col-md-4 col-md-offset-1">
               <h4 class="text-justify">
                   Vegetables are parts of plants that are 
                   consumed by humans or other animals as food. 
                   The original meaning is still commonly used and is
                   applied to plants collectively to refer to all edible plant matter, 
                   including the flowers, fruits, stems, leaves, roots, and seeds.
                   <br />
                   <br />
                   Eating vegetables provides health benefits – people who eat more vegetables and fruits as 
                   part of an overall healthy diet are likely to have a reduced risk of some chronic diseases. 
                   Vegetables provide nutrients vital for health and maintenance of your body.
               </h4>
           </div>
       </div>
   </div>

    <br />
    <br />

     <div>
       <div class="row">
          
           <div class="col-md-4 col-md-offset-1">
               <h4 class="text-justify">
                  Leaf vegetables, also called leafy greens,
                   salad greens, pot herbs, vegetable greens, or
                   simply greens, are plant leaves eaten as a vegetable,
                   sometimes accompanied by tender petioles and shoots. 
                   Although they come from a very wide variety of plants, most share
                   a great deal with other leaf vegetables in nutrition and cooking methods.
                   <br />
                   <br />
                   Leaf vegetables are typically 
                   low in calories and fat, and high in protein per calorie, dietary fiber, 
                   vitamin C, pro-vitamin A carotenoids, folate, manganese and vitamin K.
               </h4>
           </div>
            <div class="col-md-4 col-md-offset-1">
               <img src="../img/gallery/vegetable2.jpeg"
                   style="width : 500px; height:300px;"
                   />
           </div>
       </div>
   </div>

     <br />
    <br />
   <div>
       <div class="row">
           <div class="col-md-4 col-md-offset-1">
               <img src="../img/gallery/Root.jpg"
                   style="width : 400px; height:300px;"
                   />
           </div>
           <div class="col-md-4 col-md-offset-1">
               <h4 class="text-justify">
                   Root vegetables are generally storage organs,
                   enlarged to store energy in the form of carbohydrates. 
                   They differ in the concentration and the balance among starches, 
                   sugars, and other types of carbohydrate. Of particular 
                   economic importance are those with a high carbohydrate 
                   concentration in the form of starch; 
                   starchy root vegetables are important staple foods,
                   <br />
                   <br />
                   Eating vegetables provides health benefits – people who eat more vegetables and fruits as 
                   part of an overall healthy diet are likely to have a reduced risk of some chronic diseases. 
                   Vegetables provide nutrients vital for health and maintenance of your body.
               </h4>
           </div>
       </div>
   </div>

</asp:Content>
