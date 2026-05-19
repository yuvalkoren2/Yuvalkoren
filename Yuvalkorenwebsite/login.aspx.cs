using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    public string stResult = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        // נלחץ שלח
        if (Page.IsPostBack)
        {
            //שליפת הנתונים מהטופס 
            string gmail = Request.Form["Email"];
            string password = Request.Form["Password"];

            // התחברות מנהל
            if (gmail == "yuvalk@gmail.com" && password == "menahel")
            {
                Session["nihul"] = "ok";
                Session["name"] = "יובל המנהל";
                Response.Redirect("manager.aspx");
            }
            else
            {


                string sqlSelect =
                "SELECT * FROM tUsers " +
                "WHERE gmail = N'" + gmail + "' " +
                "AND password = N'" + password + "'";

                //bool userExists = MyAdoHelper.IsExist(sqlSelect);
                DataTable dt = MyAdoHelper.ExecuteDataTable(sqlSelect);

                //if (!userExists)
                if (dt.Rows.Count==1)
                {
                    Session["user"] = "ok";
                    Session["name"] = dt.Rows[0]["firstname"];   //"יובל המנהל";
                    Response.Redirect("form.aspx");
                }
                else
                    stResult = "אימייל או סיסמה שגויים";
            }
        }
    }
}