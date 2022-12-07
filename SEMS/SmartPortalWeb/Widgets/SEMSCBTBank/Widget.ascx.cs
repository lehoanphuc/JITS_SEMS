using SmartPortal.Common.Utilities;
using SmartPortal.Constant;
using SmartPortal.ExceptionCollection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Widgets_SEMSCBTBank_Widget : WidgetBase
{
    public static bool isAscend = false;
    string IPCERRORCODE = "";
    string IPCERRORDESC = "";
    private int size = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = string.Empty;
            litError.Text = "";
            if (!IsPostBack)
            {
                LoadddlCountryName();
                btnDelete.Visible = CheckPermitPageAction(IPC.ACTIONPAGE.DELETE);
                btnAdd_New.Visible = CheckPermitPageAction(IPC.ACTIONPAGE.ADD);
                GridViewPaging.Visible = false;
                divResult.Visible = false;
            }
            GridViewPaging.pagingClickArgs += new EventHandler(GridViewPaging_Click);
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
        }
    }
    private void LoadddlCountryName()
    {
        DataSet ds = new SmartPortal.SEMS.Country().LoadAllCountry("", ref IPCERRORCODE, ref IPCERRORDESC);
        if (IPCERRORCODE == "0")
        {
            ddlCountryName.DataSource = ds;
            ddlCountryName.DataTextField = "CountryName";
            ddlCountryName.DataValueField = "CountryID";
            ddlCountryName.DataBind();
            ddlCountryName.Items.Insert(0, new ListItem(Resources.labels.tatca, ""));
        }
        else
        {
            throw new IPCException(IPCERRORDESC);
        }
    }
    private void GridViewPaging_Click(object sender, EventArgs e)
    {
        gvBankList.PageSize = Convert.ToInt32(((DropDownList)GridViewPaging.FindControl("PageRowSize")).SelectedValue);
        gvBankList.PageIndex = Convert.ToInt32(((TextBox)GridViewPaging.FindControl("SelectedPageNo")).Text) - 1;
        BindData();
    }
    void BindData()
    {

        try
        {
            divResult.Visible = true;
            litError.Text = String.Empty;

            if (Convert.ToInt32(((HiddenField)GridViewPaging.FindControl("TotalRows")).Value) < gvBankList.PageIndex * gvBankList.PageSize) return;
            DataSet dtCountry = new DataSet();
            dtCountry = new SmartPortal.SEMS.Bank().SearchCBTBankByCondition(
                    Utility.KillSqlInjection(txtBankID.Text.Trim()),
                    Utility.KillSqlInjection(ddlCountryName.SelectedValue.Trim()),
                    Utility.KillSqlInjection(txtBankCode.Text.Trim()),
                    Utility.KillSqlInjection(txtBankName.Text.Trim()),
                    gvBankList.PageSize, gvBankList.PageIndex * gvBankList.PageSize,
                    ref IPCERRORCODE,
                    ref IPCERRORDESC
                );
            if (IPCERRORCODE == "0")
            {
                gvBankList.DataSource = dtCountry;
                gvBankList.DataBind();
            }
            else
            {
                lblError.Text = IPCERRORDESC;
            }
            if (dtCountry.Tables[0].Rows.Count > 0)
            {
                litError.Text = String.Empty;
                GridViewPaging.Visible = true;
                ((HiddenField)GridViewPaging.FindControl("TotalRows")).Value = dtCountry.Tables[0].Rows[0]["TRECORDCOUNT"].ToString();
            }
            else
            {
                litError.Text = "<p class='divDataNotFound'>" + Resources.labels.datanotfound + "</p>";
                GridViewPaging.Visible = false;
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
        }
    }
    protected void gvBankList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            CheckBox cbxSelect;
            Label lblCountryName, lblBankCode, lblBankName, lblBankNameLA, lblBankNameCN, lblShortName, lblAddress;
            LinkButton lbBankID, lbEdit, lbDelete;
            DataRowView drv;

            if (e.Row.RowType == DataControlRowType.Header)
            {
                cbxSelect = new CheckBox();
                cbxSelect.ID = "cbxSelectAll";
                cbxSelect.Attributes.Add("onclick", "SelectCbx(this);");
                e.Row.Cells[0].Controls.Add(cbxSelect);
            }
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                TableRow tbRow = (TableRow)(e.Row.Cells[0].Controls[0].Controls[0]);
                tbRow.Cells.AddAt(0, new TableCell());
                tbRow.Cells[0].Text = "<strong>" + Resources.labels.page + " :</strong>";
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                drv = (DataRowView)e.Row.DataItem;
                cbxSelect = (CheckBox)e.Row.FindControl("cbxSelect");
                cbxSelect.Attributes.Add("onclick", "ChildClick(this);");

                lbBankID = (LinkButton)e.Row.FindControl("lbBankID");
                lblCountryName = (Label)e.Row.FindControl("lblCountryName");
                lblBankCode = (Label)e.Row.FindControl("lblBankCode");
                lblBankName = (Label)e.Row.FindControl("lblBankName");
                lblBankNameLA = (Label)e.Row.FindControl("lblBankNameLA");
                lblBankNameCN = (Label)e.Row.FindControl("lblBankNameCN");
                lblShortName = (Label)e.Row.FindControl("lblShortName");
                lblAddress = (Label)e.Row.FindControl("lblAddress");

                lbEdit = (LinkButton)e.Row.FindControl("lbEdit");
                lbDelete = (LinkButton)e.Row.FindControl("lbDelete");

                lbBankID.Text = drv["BankID"].ToString();
                lblCountryName.Text = drv["CountryName"].ToString();
                lblBankCode.Text = drv["BankCode"].ToString();
                lblBankName.Text = drv["BankName"].ToString();
                lblBankNameLA.Text = drv["BankNameLA"].ToString();
                lblBankNameCN.Text = drv["BankNameCN"].ToString();
                lblShortName.Text = drv["ShortName"].ToString();
                lblAddress.Text = drv["Address"].ToString();

                if (!CheckPermitPageAction(IPC.ACTIONPAGE.EDIT))
                {
                    lbEdit.Enabled = false;
                    lbEdit.OnClientClick = string.Empty;
                }
                if (!CheckPermitPageAction(IPC.ACTIONPAGE.DELETE))
                {
                    lbDelete.Enabled = false;
                    lbDelete.OnClientClick = string.Empty;
                }
                if (cbxSelect.Enabled)
                {
                    size++;
                }
                hdCounter.Value = "0";
                hdPageSize.Value = size.ToString();
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
        }
    }
    protected void gvBankList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string commandName = e.CommandName;
        string commandArg = e.CommandArgument.ToString();
        if (CheckPermitPageAction(commandName))
        {
            switch (commandName)
            {
                case IPC.ACTIONPAGE.DETAILS:
                    RedirectToActionPage(IPC.ACTIONPAGE.DETAILS, "&" + SmartPortal.Constant.IPC.ID + "=" + commandArg);
                    break;
                case IPC.ACTIONPAGE.EDIT:
                    RedirectToActionPage(IPC.ACTIONPAGE.EDIT, "&" + SmartPortal.Constant.IPC.ID + "=" + commandArg);
                    break;
            }
        }
    }
    protected void gvBankList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string commandArg = string.Empty;
            commandArg = ((LinkButton)gvBankList.Rows[e.RowIndex].Cells[1].FindControl("lbBankID")).Text;
            new SmartPortal.SEMS.Bank().DeleteCBTBank(commandArg, ref IPCERRORCODE, ref IPCERRORDESC);
            if (IPCERRORCODE == "0")
            {
                LoadddlCountryName();
                btnSearch_Click(sender, e);
                BindData2();
                lblError.Text = Resources.labels.xoanganhangthanhcong;
            }
            else
            {
                lblError.Text = IPCERRORDESC;
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData2();
    }
    protected void btnAdd_New_Click(object sender, EventArgs e)
    {
        if (CheckPermitPageAction(IPC.ACTIONPAGE.ADD))
        {
            RedirectToActionPage(IPC.ACTIONPAGE.ADD, string.Empty);
        }
    }
    void BindData2()
    {
        try
        {
            ((TextBox)GridViewPaging.FindControl("SelectedPageNo")).Text = "1";
            ((HiddenField)GridViewPaging.FindControl("hdfCurrentPage")).Value = "1";
            gvBankList.PageSize = Convert.ToInt32(((DropDownList)GridViewPaging.FindControl("PageRowSize")).SelectedValue);
            string SelectedPageNo = ((TextBox)GridViewPaging.FindControl("SelectedPageNo")).Text;
            gvBankList.PageIndex = !string.IsNullOrEmpty(SelectedPageNo) ? Convert.ToInt32(SelectedPageNo) - 1 : 0;
            BindData();
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (CheckPermitPageAction(IPC.ACTIONPAGE.DELETE))
        {
            CheckBox cbxSelect;
            LinkButton lbBankID;
            string strBankID = "";
            try
            {
                foreach (GridViewRow gvr in gvBankList.Rows)
                {
                    cbxSelect = (CheckBox)gvr.Cells[0].FindControl("cbxSelect");
                    if (cbxSelect.Checked == true)
                    {
                        lbBankID = (LinkButton)gvr.Cells[1].FindControl("lbBankID");
                        strBankID += lbBankID.Text.Trim() + "#";
                    }
                }
                if (string.IsNullOrEmpty(strBankID))
                {
                    lblError.Text = Resources.labels.pleaseselectbeforedeleting;
                    return;
                }
                else
                {
                    string[] BankID = strBankID.Split('#');
                    for (int i = 0; i < BankID.Length - 1; i++)
                    {
                        new SmartPortal.SEMS.Bank().DeleteCBTBank(BankID[i], ref IPCERRORCODE, ref IPCERRORDESC);
                        if (IPCERRORCODE.Equals("0"))
                        {
                            LoadddlCountryName();
                            btnSearch_Click(sender, e);
                            BindData2();
                            lblError.Text = Resources.labels.xoanganhangthanhcong;
                        }
                        else
                        {
                            lblError.Text = IPCERRORDESC;
                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
                SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
            }
        }
    }
}