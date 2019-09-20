using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace OrderConfirmationReport
{
    public partial class OC : System.Web.UI.Page
    {
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=W:\test\Access\Tablas.mdb");
        //OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\CSK\Tablas.mdb");
        protected void Page_Load(object sender, EventArgs e)
        {
            //PendingOC2();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "")
            {
                PendingOC2();
            }
            else
            {
                string script = "alert('Plz Enter From & To Date!!!')";
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnSubmit, this.GetType(), "Test", script, true);
            }
        }
        void PendingOC2()
        {
            con.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            string query = "Select NumPed AS OC, FecPed AS Order_Date, CliPed AS Customer_Code, PedPed AS Cust_PO,OcDate, Location FROM [Pedidos de clientes] Where OcDate Between format(#" + TextBox1.Text + "#, \"dd/mm/yyyy\") And format(#" + TextBox2.Text + "#, \"dd/mm/yyyy\")";
            OleDbDataAdapter ad = new OleDbDataAdapter(query, con);
            DataTable dtpending = new DataTable();
            ad.Fill(dtpending);
            con.Close();
            dtpending.Columns.Add("Remarks", typeof(string));
            dtpending.Columns.Add("PO_Date", typeof(DateTime));
            dtpending.Columns.Add("Days_to_Send OC", typeof(int));
            dtpending.Columns["Location"].SetOrdinal(7);

            dtpending.AcceptChanges();

            foreach (DataRow dr in dtpending.Rows)
            {

                if (Convert.ToInt32(dr[0]) == 0)
                {
                    dr.Delete();

                }
                else
                {
                    //string date = dr["Cust_PO"].ToString().Substring(dr["Cust_PO"].ToString().LastIndexOf(' ') + 1);
                    string date = dr["OcDate"].ToString();//.Substring(dr["Cust_PO"].ToString().LastIndexOf(' ') + 1);
                    //DateTime date2 = date.ToString(//DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
                    string shortDate = date;
                    DateTime date3;
                    if (date.Length != 0)
                        date3 = Convert.ToDateTime(date);
                    else
                        date3 = Convert.ToDateTime(DateTime.Today.ToShortDateString());
                    dr["PO_Date"] = date;// 3.ToShortDateString();
                    dr["Days_to_Send OC"] = (Convert.ToDateTime(dr["OcDate"]) - Convert.ToDateTime(dr["Order_Date"])).TotalDays;
                }

            }
            dtpending.DefaultView.Sort = "PO_Date asc";

            if (rdbtn1.Checked == true)
            {
                foreach (DataRow dr in dtpending.Rows)
                {
                    if (dr[7].ToString() == "2")
                        dr.Delete();
                }
                dtpending.AcceptChanges();
                GridView2.DataSource = dtpending;
                GridView2.DataBind();
            }
            if (rdbtn2.Checked == true)
            {
                foreach (DataRow dr in dtpending.Rows)
                {
                    if (dr[7].ToString() == "1")
                        dr.Delete();
                }
                dtpending.AcceptChanges();
                GridView2.DataSource = dtpending;
                GridView2.DataBind();
            }
            if (RadioButton1.Checked == true)
            {
                GridView2.DataSource = dtpending;
                GridView2.DataBind();
            }
            GridView2.DataSource = dtpending;
            GridView2.DataBind();
            DataTable dtpricezero = new DataTable();
            int i = 0;
            //label2.Text = dtpending.Rows.Count.ToString();
        }
    }
}