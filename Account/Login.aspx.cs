using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using FoodOrdering.Model;

namespace FoodOrdering.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.QueryString["ReturnUrl"] != null)
                {
                    if(!(Request.QueryString["ReturnUrl"].Contains("ViewCart") 
                        || Request.QueryString["ReturnUrl"].Contains("AddToCart")))
                    {
                        Response.Redirect("~/Account/Login.aspx");
                    }
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string username = uname.Text;
            string password = pswd.Text;
            
            if(username == "admin" && password == "admin1234")
            {
                FormsAuthentication.RedirectFromLoginPage(username, false);
            }
            else
            {
                using(DBDataContext db = new DBDataContext())
                {
                    int c = db.tblusers.
                        Where(x => x.UserName == username && x.password == password).Count();
                    int c2 = db.tblusers.
                       Where(x => x.Email == username && x.password == password).Count();
                    if (c > 0 || c2 > 0)
                    {
                     
                       FormsAuthentication.RedirectFromLoginPage(username,false);
                      
                    }

                    else
                    {
                        lblmsg.Text = "Incorrect Username or password";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
           


        }
    }
}