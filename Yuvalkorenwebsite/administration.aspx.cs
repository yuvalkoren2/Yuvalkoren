using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class administration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // בדיקת אבטחה קשוחה לדף הניהול: האם המשתמש הנוכחי הוא אינו מנהל?
        if (Session["nihul"] != "ok")
        {
            // הגנה: אם הוא לא מנהל מורשה, נעיף אותו ישר לדף ההתחברות
            Response.Redirect("login.aspx");
        }
    }
}