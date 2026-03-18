using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    public string stResult = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {

            string gmail = Request.Form["Email"];
            string password = Request.Form["Password"];

//           qqהתחברות מנהל
            if (gmail == "yuvalk@gmail.com" && password == "menahel")
            {
                Response.Redirect("manager.aspx");
            }
            else
            {


                string sqlSelect =
                "SELECT * FROM tUsers " +
                "WHERE gmail = N'" + gmail + "' " +
                "AND password = N'" + password + "'";

                bool userExists = MyAdoHelper.IsExist(sqlSelect);

                if (!userExists)
                    stResult = "אימייל או סיסמה שגויים";
                else
                    stResult = "משתמש רשום";

            }
        }
    }
}