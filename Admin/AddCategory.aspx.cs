using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using(DBDataContext db = new DBDataContext())
                {
                    catgrid.DataSource = db.tblcategories.ToList();
                    catgrid.DataBind();
                }
            }
        }

      

        protected void btnsave_Click(object sender, EventArgs e)
        {
            tblcategory cat = new tblcategory()
            {
                cname = txtcname.Text,
                desc = txtdesc.Text
            };

           using(DBDataContext db = new DBDataContext())
            {
                db.tblcategories.InsertOnSubmit(cat);
                db.SubmitChanges();
            }

            Response.Redirect("AddCategory.aspx");
        }

        protected void catgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cid = Convert.ToInt32(catgrid.DataKeys[e.RowIndex].Value);

            using(DBDataContext db = new DBDataContext())
            {
                int c = db.tblproducts.Where(x => x.cid == cid).Count();

                if(c > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "k", "alert('you can not remove this category because food are added in this category')", true);
                }
                else
                {
                    db.tblcategories.DeleteOnSubmit(db.tblcategories.SingleOrDefault(x => x.cid == cid));
                    db.SubmitChanges();
                    Response.Redirect("AddCategory.aspx");

                }

            }

        }

        protected void catgrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int cid = Convert.ToInt32(catgrid.DataKeys[e.NewSelectedIndex].Value);
            using (DBDataContext db = new DBDataContext())
            {
               tblcategory cat = db.tblcategories.SingleOrDefault(x => x.cid == cid);
               
                if(cat != null)
                {
                    txtcname.Text = cat.cname;
                    txtdesc.Text = cat.desc;
                        ViewState["Id"] = cat.cid;
                 

                    MaintainScrollPositionOnPostBack = false;
                }
            }

            btnsave.Visible = false;
            btnUpdate.Visible = true;
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int cid = Convert.ToInt32(ViewState["Id"]);
            using (DBDataContext db = new DBDataContext())
            {
                tblcategory cat = db.tblcategories.SingleOrDefault(x => x.cid == cid);

                if (cat != null)
                {
                     cat.cname = txtcname.Text;
                     cat.desc = txtdesc.Text;

                    db.SubmitChanges();
                }

                Response.Redirect("AddCategory.aspx");

            }

        }

        protected void catgrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}