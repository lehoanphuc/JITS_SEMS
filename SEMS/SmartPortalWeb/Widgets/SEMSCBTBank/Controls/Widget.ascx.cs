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

public partial class Widgets_SEMSCBTBank_Controls_Widget : WidgetBase
{
    private string ACTION = string.Empty;
    private string IPCERRORCODE = string.Empty;
    private string IPCERRORDESC = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ACTION = GetActionPage();
            if (!IsPostBack)
            {
                BindData();
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
        //  loadCCYID();
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
        }
        else
        {
            throw new IPCException(IPCERRORDESC);
        }
    }
    protected void btsave_Click(object sender, EventArgs e)
    {
        try
        {
            string countryID = SmartPortal.Common.Utilities.Utility.KillSqlInjection(ddlCountryName.SelectedValue);
            string bankCode = SmartPortal.Common.Utilities.Utility.KillSqlInjection(txtBankCode.Text.Trim());
            string bankName = SmartPortal.Common.Utilities.Utility.KillSqlInjection(txtBankName.Text.Trim());
            string bankNameLA = SmartPortal.Common.Utilities.Utility.KillSqlInjection(txtBankNameLA.Text.Trim());
            string bankNameCN = SmartPortal.Common.Utilities.Utility.KillSqlInjection(txtBankNameCN.Text.Trim());
            string shortName = SmartPortal.Common.Utilities.Utility.KillSqlInjection(txtShortName.Text.Trim());
            string address = SmartPortal.Common.Utilities.Utility.KillSqlInjection(txtAddress.Text.Trim());


            switch (ACTION)
            {
                case IPC.ACTIONPAGE.ADD:
                    try
                    {
                        if (!CheckPermitPageAction(IPC.ACTIONPAGE.ADD)) return;
                        DataSet ds = new DataSet();
                        ds = new SmartPortal.SEMS.Bank().Insert(countryID, bankCode, bankName, bankNameLA, bankNameCN, shortName, address, Session["userName"].ToString(), ref IPCERRORCODE, ref IPCERRORDESC);
                        if (IPCERRORCODE != "0")
                        {
                            lblError.Text = IPCERRORDESC;
                            return;
                        }
                        else
                        {
                            int bankID = Int32.Parse(ds.Tables[0].Rows[0]["BankID"].ToString());
                            InsertCBTBankCCYID(bankID);
                            lblError.Text = Resources.labels.themnganhangthanhcong;
                        }

                    }
                    catch (IPCException IPCex)
                    {
                        SmartPortal.Common.Log.RaiseError(IPCex.ToString(), this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, IPCex.ToString(), Request.Url.Query);
                        SmartPortal.Common.Log.GoToErrorPage(IPCex.Message, Request.Url.Query);
                    }
                    catch (Exception ex)
                    {
                        SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
                        SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
                    }
                    break;
                case IPC.ACTIONPAGE.EDIT:
                    if (!CheckPermitPageAction(IPC.ACTIONPAGE.EDIT)) return;
                    try
                    {
                        string ID = GetParamsPage(IPC.ID)[0].Trim();
                        new SmartPortal.SEMS.Bank().UpdateCBTBank(ID, countryID, bankCode, bankName, bankNameLA, bankNameCN, shortName, address, Session["userName"].ToString(), ref IPCERRORCODE, ref IPCERRORDESC);
                        if (IPCERRORCODE == "0")
                        {
                            DeleteCBTBankCCYID(ID);
                            InsertCBTBankCCYID(Int32.Parse(ID));
                            lblError.Text = Resources.labels.suathanhcong;
                            pnAdd.Enabled = false;
                            subpanel.Enabled = false;
                            btsave.Enabled = false;
                        }
                        else
                        {
                            lblError.Text = IPCERRORDESC;
                        }
                    }
                    catch (IPCException IPCex)
                    {
                        SmartPortal.Common.Log.RaiseError(IPCex.ToString(), this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, IPCex.ToString(), Request.Url.Query);
                        SmartPortal.Common.Log.GoToErrorPage(IPCex.Message, Request.Url.Query);
                    }
                    catch (Exception ex)
                    {
                        SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
                        SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
                    }
                    break;

            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
    }

    protected void InsertCBTBankCCYID(int BankID)
    {

        try
        {
            foreach (ListItem item in cblCCYID.Items)
            {
                if (item.Selected)
                {
                    new SmartPortal.SEMS.Bank().InsertCBTCCYID(BankID, item.Value, ref IPCERRORCODE, ref IPCERRORDESC);
                }

            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"],
                this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"],
                "");
        }
    }

    protected void DeleteCBTBankCCYID(string BankID)
    {

        try
        {
            foreach (ListItem item in cblCCYID.Items)
            {
                if (item.Selected)
                {
                    new SmartPortal.SEMS.Bank().DeleteCBTCCYID(BankID, ref IPCERRORCODE, ref IPCERRORDESC);
                }
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"],
                this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"],
                "");
        }
    }

    private void loadCCYID()
    {
        try
        {
            DataTable dt = new SmartPortal.SEMS.Product().LoaddAllCCYID(ref IPCERRORCODE, ref IPCERRORDESC);
            if (IPCERRORCODE == "0")
            {
                cblCCYID.DataSource = dt;
                cblCCYID.DataTextField = "CCYID";
                cblCCYID.DataValueField = "CCYID";
                cblCCYID.DataBind();
            }
        }
        catch (Exception ex)
        {

            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
    }
    private void loadCCYIDBYBankID(string bankID)
    {
        try
        {
            loadCCYID();
            DataSet ds = new SmartPortal.SEMS.Bank().LoadCCYIDBYBANKID(bankID, ref IPCERRORCODE, ref IPCERRORDESC);
            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (ListItem item in cblCCYID.Items)
                {

                    item.Selected = ds.Tables[0].Select("CCYID='" + item.Value + "'").Any();
                }
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
    }
    void BindData()
    {
        try
        {

            switch (ACTION)
            {
                case IPC.ACTIONPAGE.ADD:
                    btsave.Text = Resources.labels.add;
                    LoadddlCountryName();
                    loadCCYID();
                    break;
                default:
                    btnClear.Enabled = false;
                    string ID = GetParamsPage(IPC.ID)[0].Trim();
                    DataSet ds = new SmartPortal.SEMS.Bank().GetCBTBankDetailsByID(ID, ref IPCERRORCODE, ref IPCERRORDESC);
                    if (ds != null)
                    {
                        DataTable dt = ds.Tables[0];
                        if (dt.Rows.Count != 0)
                        {
                            LoadddlCountryName();
                            loadCCYIDBYBankID(dt.Rows[0]["BankID"].ToString());
                            ddlCountryName.SelectedValue = dt.Rows[0]["CountryID"].ToString();
                            txtBankCode.Text = dt.Rows[0]["BankCode"].ToString();
                            txtBankName.Text = dt.Rows[0]["BankName"].ToString();
                            txtBankNameLA.Text = dt.Rows[0]["BankNameLA"].ToString();
                            txtBankNameCN.Text = dt.Rows[0]["BankNameCN"].ToString();
                            txtShortName.Text = dt.Rows[0]["ShortName"].ToString();
                            txtAddress.Text = dt.Rows[0]["Address"].ToString();

                        }
                    }
                    break;
            }
            switch (ACTION)
            {
                case IPC.ACTIONPAGE.DETAILS:
                    pnAdd.Enabled = false;
                    subpanel.Enabled = false;
                    btsave.Enabled = false;
                    btnClear.Enabled = false;
                    break;
                case IPC.ACTIONPAGE.EDIT:
                    break;
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
    }
    protected void btback_Click(object sender, EventArgs e)
    {
        RedirectBackToMainPage();
    }
    protected void Clear_Click(object sender, EventArgs e)
    {
        lblError.Text = String.Empty;
        ClearInputs(Page.Controls);
        pnAdd.Enabled = true;
        subpanel.Enabled = false;
        btsave.Enabled = true;
    }
    void ClearInputs(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            ClearInputs(ctrl.Controls);
        }
    }


}