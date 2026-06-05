using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager : System.Web.UI.Page
{
    // משתנה מחרוזת גלובלי המיועד להכלת טבלת ה-HTML שתוצג למשתמש
    protected string usersTable = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // =======================================================================
        //  אבטחת דף הניהול - חסימת משתמשים רגילים או אורחים
        // =======================================================================
        // בדיקה: אם משתנה ה-Session של הניהול ריק או שערכו אינו מאושר
        if (Session["nihul"] == null || Session["nihul"].ToString() != "ok")
        {
            // חסימה: המשתמש אינו מנהל, נחזיר אותו מיד אל דף ההתחברות
            Response.Redirect("login.aspx");
        }
        else
        {
            // =======================================================================
            //  שליפת נתוני המשתמשים והצגתם
            // =======================================================================
            // בניית שאילתת SQL פשוטה ששולפת את כל העמודות והשורות מטבלת המשתמשים
            string sqlSelect = "SELECT * FROM tUsers";

            // שימוש בפונקציית העזר printDataTable כדי להמיר את השורות לטבלה מעוצבת
            usersTable = MyAdoHelper.printDataTable("MyDB.mdf", sqlSelect);
        }
    }
}