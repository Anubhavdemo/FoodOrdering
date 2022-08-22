using FoodOrdering.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering.Customer.SecuredPage
{
    public partial class DeleteProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["pid"] != null)
            {
                int pid;

                if (int.TryParse(Request.QueryString["pid"], out pid))
                {
                    List<Product> prodlist = (List<Product>)Session["prodlist"];

                    ProductList list = new ProductList(prodlist);
                    prodlist = list.removeProduct(pid);
                    Session["prodlist"] = prodlist;
                }
                Response.Redirect("/Customer/SecuredPage/ViewCart.aspx");
            }
        }
    }
}