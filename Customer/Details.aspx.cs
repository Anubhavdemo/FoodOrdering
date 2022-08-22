using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Customer
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int bid;

            if(!IsPostBack)
            {
                if(Request.QueryString["id"] != null)
                {
                    if (int.TryParse(Request.QueryString["id"], out bid))
                    {
                        using(DBDataContext db = new DBDataContext())
                        {
                            tblproduct p = db.tblproducts.SingleOrDefault(x => x.pid == bid);
                            if(p != null)
                            {
                                bimage.ImageUrl = p.image;
                                lbltitle.Text = p.pname;
                                lblprice.Text = p.price.ToString();
                                lblauthor.Text = p.Author;
                                lbldesc.Text = p.Desc;
                                carturl.NavigateUrl = "~/Customer/SecuredPage/AddToCart.aspx?pid="+p.pid;
                            }
                        }
                    }
                    else
                    {

                    }
                }
                else
                {

                }
              
            }
        }
    }
}