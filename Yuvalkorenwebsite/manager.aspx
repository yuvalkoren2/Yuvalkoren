<%@ Page Title="ניהול משתמשים" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* עיצוב נקי ומסודר למיכל דף הניהול */
        .manager-container { max-width: 900px; margin: 30px auto; padding: 20px; background-color: #ffffff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); font-family: Arial, sans-serif; text-align: center; }
        
        /* עיצוב דינמי לטבלת הנתונים המודפסת מתוך מסד הנתונים */
        .manager-container table { width: 100%; border-collapse: collapse; margin-top: 20px; direction: rtl; }
        .manager-container th, .manager-container td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        .manager-container th { background-color: #34495e; color: white; font-weight: bold; }
        .manager-container tr:nth-child(even) { background-color: #f9f9f9; }
        .manager-container tr:hover { background-color: #f1f1f1; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="manager-container">
        <h1>דף ניהול מערכת (כל המשתמשים הרשומים)</h1>
        <p>להלן ריכוז של כל פרטי המשתמשים הקיימים במסד הנתונים של האתר:</p>
        
        <%-- גלילה אופקית אוטומטית במקרה שהטבלה רחבה מדי במסכים קטנים --%>
        <div style="overflow-x:auto;">
            <%-- הדפסת טבלת ה-HTML הדינמית שנבנתה ונשלפה מתוך קוד ה-C# --%>
            <%= usersTable %>
        </div>
    </div>
</asp:Content>