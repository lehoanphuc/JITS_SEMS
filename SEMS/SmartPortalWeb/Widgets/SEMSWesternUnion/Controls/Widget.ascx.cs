using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using SmartPortal.Common;
using SmartPortal.Common.Utilities;
using SmartPortal.ExceptionCollection;
using System.Globalization;
using SmartPortal.Constant;

public partial class Widgets_SEMSWesternUnion_Control_Widget : WidgetBase
{
    private string ACTION = string.Empty;
    string IPCERRORCODE = string.Empty;
    string IPCERRORDESC = string.Empty;
    private string sendtype = ""; 
    string ID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //txtExchange.Attributes.Add("onkeyup", "ntt('" + txtExchange.ClientID + "','',event)");
        sendtype = ddlsendtype.SelectedValue;
        ID = GetParamsPage(IPC.ID)[0].Trim();
        ACTION = GetActionPage();
        if (!IsPostBack)
        {
            try
            {
                BindData(sender,e);
            }
            catch (Exception ex)
            {
                SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
                SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
            }

        }
    }

    void BindData(object sender, EventArgs e)
    {
        try
        {
            DataSet sb = new SmartPortal.SEMS.Transactions().GetDetailWestern(ID,ref IPCERRORCODE, ref IPCERRORDESC);
            if (IPCERRORCODE == "0")
            {
                DataTable dt = new DataTable();
                dt = sb.Tables[0];
                txtCashcode.Text = dt.Rows[0]["CASHCODE"].ToString();
                lblExchangerate.Text = dt.Rows[0]["RCCYID"].ToString();
                lblex.Text = dt.Rows[0]["RCCYID"].ToString() + "/1 USD";

                lblSenderFirstName.Text = dt.Rows[0]["SENDERFIRSTNAME"].ToString();
                lblSenderLastName.Text = dt.Rows[0]["SENDERLASTNAME"].ToString();
                lblSenderCCYID.Text = dt.Rows[0]["SCCYID"].ToString();
                lblPayOut.Text = dt.Rows[0]["PAYCOUNTRY"].ToString();
                lblAmountSend.Text = SmartPortal.Common.Utilities.Utility.FormatMoney(dt.Rows[0]["SENDERAMOUNT"].ToString(),"USD");
                lblFee.Text = SmartPortal.Common.Utilities.Utility.FormatMoney(dt.Rows[0]["FEE"].ToString(),"USD");
                lblTotalAmount.Text = SmartPortal.Common.Utilities.Utility.FormatMoney((SmartPortal.Common.Utilities.Utility.isDouble(lblAmountSend.Text, true) + SmartPortal.Common.Utilities.Utility.isDouble(lblFee.Text, true)).ToString(), "USD");

                #region Sender detail
                lblTemUnit.Text = dt.Rows[0]["SENDERUNIT"].ToString();
                lblTemDistrict.Text = dt.Rows[0]["SENDERDISTRICT"].ToString();
                lblTemCity.Text = dt.Rows[0]["SENDERCITY"].ToString();
                lblTemProvince.Text = dt.Rows[0]["SENDERPROVINCE"].ToString();
                lblPostcode.Text = dt.Rows[0]["POSTCODE"].ToString();
                lblSenderCountry.Text = dt.Rows[0]["SENDERCOUNTRY"].ToString();
                lblCountryCode.Text = dt.Rows[0]["COUNTRYCODE"].ToString();
                lbltelephone.Text = dt.Rows[0]["TELEPHONE"].ToString();
                lblmobilecode.Text = dt.Rows[0]["MOBILEPHONECODE"].ToString();
                lblMobilephone.Text = dt.Rows[0]["PHONENO"].ToString();
                txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                #endregion

                lbIDType.Text = dt.Rows[0]["ICTYPE"].ToString();
                lbIDNumber.Text = dt.Rows[0]["ICNUMBER"].ToString();
                lbCouuntryOfIssue.Text = dt.Rows[0]["ISSUECOUNTRY"].ToString();
                lbExpiry.Text = dt.Rows[0]["EXDATE"].ToString();
                lbIssue.Text = dt.Rows[0]["ISSUEDATE"].ToString();
                lbDOB.Text = dt.Rows[0]["DATEOFBIRTH"].ToString();
                lblOffcicePhone.Text = dt.Rows[0]["OFFICEPHONE"].ToString();
                lbOccupation.Text = dt.Rows[0]["OCCUPATION"].ToString();
                lbPurpose.Text = dt.Rows[0]["PURPOSE"].ToString();
                lbCountryOfBirth.Text = dt.Rows[0]["BIRTHCOUTRY"].ToString();

                lbSOF.Text = dt.Rows[0]["SOURCEOFUND"].ToString();
                lbUnit.Text = dt.Rows[0]["ICUNIT"].ToString();
                lbDistrict.Text = dt.Rows[0]["ICDISTRICT"].ToString();
                lbProvince.Text = dt.Rows[0]["ICPROVINCE"].ToString();
                lbCountry.Text = dt.Rows[0]["ICCOUNTRY"].ToString();
                lblNation.Text = dt.Rows[0]["NATIONLITY"].ToString();
                if(dt.Rows[0]["GENDER"].ToString() == "M")
                {
                    lbGender.Text = "Male";
                }
                else
                {
                    lbGender.Text = "FeMale";
                }
                

                lblComment.Text = dt.Rows[0]["COMMENT"].ToString();

                lblrefirstname.Text = dt.Rows[0]["REFIRSTNAME"].ToString();
                lbllastname.Text = dt.Rows[0]["RELASTNAME"].ToString();

                if (txtCashcode.Text != "" || sb.Tables[0].Rows[0]["STATUS"].ToString().Equals("D"))
                {
                    txtCashcode.Enabled = false;
                    btsave.Visible = false;
                    btresend.Visible = false;
                }

                string email = new SmartPortal.SEMS.User().GetUBID(sb.Tables[0].Rows[0]["USERCREATE"].ToString()).Rows[0]["EMAIL"].ToString();
                if (email == "")
                {
                    ddlsendtype.SelectedValue = "PHONE";
                    sendtype = "PHONE";
                    ddlsendtype.Enabled = false;
                }
            }
            else
            {
                lblError.Text = IPCERRORDESC;
            }

            #region Enable/Disable theo Action
            switch (ACTION)
            {
                case IPC.ACTIONPAGE.DETAILS:
                    btsave.Visible = false;
                    txtCashcode.Enabled = false;
                    btdel.Visible = false;
                    pndel.Visible = false;
					btresend.Visible = false;
                    txtExchange.Enabled = false;
                    txtExchange.Text = SmartPortal.Common.Utilities.Utility.FormatMoney(sb.Tables[0].Rows[0]["EXCHANGERATE"].ToString(), "USD");
                    txtExchange_TextChanged(sender, e);
                    break;
                case IPC.ACTIONPAGE.EDIT:
                    btdel.Visible = false;
                    pndel.Visible = false;
					if(sb.Tables[0].Rows[0]["STATUS"].ToString().Equals("A"))
					{
						btresend.Visible = true;
						btsave.Visible = false;
                        txtExchange.Enabled = false;
                        txtExchange.Text = SmartPortal.Common.Utilities.Utility.FormatMoney(sb.Tables[0].Rows[0]["EXCHANGERATE"].ToString(), "USD");
                        txtExchange_TextChanged(sender, e);
                    }
                    if(sb.Tables[0].Rows[0]["STATUS"].ToString().Equals("P"))
					{
						btresend.Visible = false;
						btsave.Visible = true;
					}
                    break;
                case IPC.ACTIONPAGE.DELETE:
                    txtExchange.Enabled = false;
                    txtCashcode.Enabled = false;
                    btsave.Visible = false;
                    btresend.Visible = false;
                    break;
            }
            #endregion
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
    }

   

    protected void btsave_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            string cashcode = txtCashcode.Text.Trim();
            double exchangerate = SmartPortal.Common.Utilities.Utility.isDouble(txtExchange.Text.Trim(),true);
            double reamount = SmartPortal.Common.Utilities.Utility.isDouble(txtReamount.Text.Trim(),true);
            if (string.IsNullOrEmpty(cashcode))
            {
                lblError.Text = "Please input Cash code";
            }
            else
            {
                new SmartPortal.SEMS.Transactions().UpdateWestern(ID, "UPDATE", cashcode, sendtype, "", exchangerate, reamount, ref IPCERRORCODE, ref IPCERRORDESC);
                if (IPCERRORCODE == "0")
                {
                    lblError.Text = Resources.labels.sendsuccessful;
                    btsave.Visible = false;
                    txtCashcode.Enabled = false;
                    txtExchange.Enabled = false;
                    ddlsendtype.Enabled = false;
                }
                else
                {
                    lblError.Text = IPCERRORDESC;
                }
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

    protected void ddlsendtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            if (ddlsendtype.SelectedValue == "EMAIL")
            {
                sendtype = "EMAIL";
            }
            else
            {
                sendtype = "PHONE";
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }

    }

    protected void ddlreason_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            switch (ddlreason.SelectedValue)
            {
                case "0":
                    lbreason.Visible = true;
                    txtreason.Visible = true;
                    break;
                case "1":
                    lbreason.Visible = false;
                    txtreason.Visible = false;
                    break;
                case "2":
                    lbreason.Visible = false;
                    txtreason.Visible = false;
                    break;
                case "3":
                    lbreason.Visible = false;
                    txtreason.Visible = false;
                    break;
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
    }

    protected void btdel_Click(object sender, EventArgs e)
    {
        try
        {
            string reason = "";
            switch (ddlreason.SelectedValue)
            {
                case "0":
                    reason = txtreason.Text;
                    break;
                case "1":
                    reason = ddlreason.SelectedItem.Text;
                    break;
                case "2":
                    reason = ddlreason.SelectedItem.Text; 
                    break;
                case "3":
                    reason = ddlreason.SelectedItem.Text; 
                    break;
            }

            new SmartPortal.SEMS.Transactions().UpdateWestern(ID, "DELETE", "", "", reason,0,0, ref IPCERRORCODE, ref IPCERRORDESC);
            if (IPCERRORCODE == "0")
            {
                lblError.Text = Resources.labels.deletesuccessfully;
                btdel.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.ToString(), Request.Url.Query);
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], Request.Url.Query);
        }
    }

    protected void btresend_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet dt = new SmartPortal.SEMS.Transactions().SendWestern(ID, sendtype, ref IPCERRORCODE, ref IPCERRORDESC);
            if (IPCERRORCODE == "0")
            {
                lblError.Text = Resources.labels.sendsuccessful;
				btresend.Visible = false;
            }
            else
            {
                lblError.Text = "Error";
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
        }
    }

    protected void txtExchange_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (String.IsNullOrEmpty(txtExchange.Text))
            {
                lblError.Text = "Exchangrate is wrong!";
            }
            else
            {
                txtReamount.Text = SmartPortal.Common.Utilities.Utility.FormatMoney((SmartPortal.Common.Utilities.Utility.isDouble(lblAmountSend.Text, true) * SmartPortal.Common.Utilities.Utility.isDouble(txtExchange.Text.Trim(), true)).ToString(),"");
                txtExchange.Text = SmartPortal.Common.Utilities.Utility.FormatMoney(txtExchange.Text, "");
            }
        }
        catch (Exception ex)
        {
            SmartPortal.Common.Log.RaiseError(System.Configuration.ConfigurationManager.AppSettings["sysec"], this.GetType().BaseType.Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message, "");
            SmartPortal.Common.Log.GoToErrorPage(System.Configuration.ConfigurationManager.AppSettings["sysec"], "");
        }
    }
}
