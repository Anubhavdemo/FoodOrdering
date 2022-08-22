using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Admin
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                using(DBDataContext db = new DBDataContext())
                {
                    productgrid.DataSource = db.tblproducts.ToList();
                    productgrid.DataBind();
                }
            }
        }

        protected void productgrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void productgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(productgrid.DataKeys[e.RowIndex].Value);

            using (DBDataContext db = new DBDataContext())
            {
                
               db.tblproducts.DeleteOnSubmit(db.tblproducts.SingleOrDefault(x => x.pid == id));
               db.SubmitChanges();
                    Response.Redirect("ViewProduct.aspx");
            }
        }
    }
}