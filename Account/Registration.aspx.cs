using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodOrdering.Model;

namespace FoodOrdering.Account
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            tbluser user = new tbluser()
            {
                First_Name = fname.Text,
                Last_Name = lname.Text,
                Email = email.Text,
                UserName = uname.Text,
                password = pswd.Text
            };

            if (user.UserName.ToLower() != "admin")
            {
                using (DBDataContext db = new DBDataContext())
                {
                    if (db.tblusers.
                        Where(x => x.UserName == user.UserName
                    || x.Email == user.Email).Count() == 0)
                    {
                        db.tblusers.InsertOnSubmit(user);
                        db.SubmitChanges();
                        Response.Redirect("~/Account/Login.aspx");
                        //lblmsg.Text = "Registerred Successfully!...";
                        //lblmsg.ForeColor = System.Drawing.Color.Green;
                        clear();
                    }
                    else
                    {
                        lblmsg.Text = "UserName or Email is " +
                            "Already registered";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            else
            {
                lblmsg.Text = "sorry! you can not use username as admin";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void uname_TextChanged(object sender, EventArgs e)
        {
            using (DBDataContext db = new DBDataContext())
            {
                if (db.tblusers.Where(x => x.UserName == uname.Text.Trim()).Count() > 0 || uname.Text.ToLower() == "admin")
                {
                    lbluser.Text = "UserName "+ uname.Text +" Not Available";
                }
                else
                {
                    lbluser.Text = "";
                }
            }
        }

        protected void email_TextChanged(object sender, EventArgs e)
        {
            using (DBDataContext db = new DBDataContext())
            {
                if (db.tblusers.Where(x => x.Email == email.Text.Trim()).Count() > 0)
                {
                    lblemail.Text = "Email " + email.Text + " Aready registerd";
                }
                else
                {
                    lblemail.Text = "";
                }
            }
        }


        private void clear()
        {
            fname.Text = "";
            lname.Text = "";
            email.Text = "";
            uname.Text = "";
            pswd.Text = "";
            cnfpswd.Text = "";
        }
    }
}