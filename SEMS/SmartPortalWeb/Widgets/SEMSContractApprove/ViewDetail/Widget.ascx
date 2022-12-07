<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Widget.ascx.cs" Inherits="Widgets_SEMSContractList_ViewDetail_Widget" %>
<%@ Import Namespace="SmartPortal.Constant" %>
<script src="/JS/Common.js"></script>
<%@ Register Src="~/Controls/GirdViewPaging/GridViewPaging.ascx" TagPrefix="uc1" TagName="GridViewPaging" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="subheader">
            <h1 class="subheader-title">
                <%=Resources.labels.thongtinhopdong %>
            </h1>
        </div>
        <div class="loading">
            <asp:UpdateProgress ID="UpdateProgress2" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                <ProgressTemplate>
                    <img src="Images/tenor.gif" style="width: 32px; height: 32px;" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <div id="divError">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <asp:HiddenField ID="hdusertype" runat="server" />
        <div class="row" runat="server" id="divAccount">
            <div class="col-sm-12">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active" id="liTabDetailContract" runat="server"><a href="#tab_1" data-toggle="tab"><%=Resources.labels.chitiethopdong %></a></li>
                        <li id="liTabDetailCustomer" runat="server"><a href="#tab_2" data-toggle="tab"><%=Resources.labels.chitietkhachhang %></a></li>
                        <li id="liKYC" runat="server"><a href="#tab_2_1" data-toggle="tab"><%=Resources.labels.kycinformation %></a></li>
                        <li id="liTabWorkingAcc" runat="server"><a href="#tab_3" data-toggle="tab"><%=Resources.labels.taikhoansudung %></a></li>
                        <li id="liTabWorkingCard" runat="server"><a href="#tab_4" data-toggle="tab"><%=Resources.labels.workingcard %></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1">
                            <div class="panel-container">
                                <div class="panel-content form-horizontal p-b-0">
                                    <asp:Panel ID="pnAdd" runat="server">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.mahopdong %></label>
                                                    <div class="col-sm-8">
                                                        <%--<asp:Label class="col-sm-12 control-label" runat="server" ID="lbcontractno"></asp:Label>--%>
                                                        <asp:TextBox ID="lbcontractno" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.tenkhachhang %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbfullname" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.loaihopdong %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbcontracttype" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.loaihinhsanpham %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbproducttype" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.nguoitao %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbusercreate" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.trangthai %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbstatus" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        <asp:Label ID="lblSTS" runat="server" Visible="False" class="col-sm-4 control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.ngayhethan %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbenddate" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.ngaymo %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbopendate" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.nguoiduyet %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbuserapprove" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.nguoisuadoi %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbusermodify" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        <asp:Label ID="lblUT" runat="server" Visible="False" class="col-sm-4 control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.ngaysuadoi %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lblastmodify" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.subusertype %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lblSubUserType" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.chinhanh %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbbranch" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--                                            <div class="col-sm-6" runat="server">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.transactionalert %></label>
                                                    <div class="col-sm-8">
                                                      <asp:TextBox ID="txtAlterTran" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                         <div class="row">
                                            <div class="col-sm-12" runat="server">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"><%=Resources.labels.transactionalert %></label>
                                                    <div class="col-sm-10">
                                                        <div class="row">
                                                            <div class="form-group custom-control">
                                                                <div class="col-sm-3">
                                                                    <asp:CheckBox ID="cbSMS" runat="server" Text="<%$ Resources:labels, sms %>"  Enabled ="false"/>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <asp:CheckBox ID="cbWAPP" runat="server" Text="<%$ Resources:labels, whatsapp %>" Enabled ="false" />
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <asp:CheckBox ID="cbLINE" runat="server" Text="<%$ Resources:labels, line %>"  Enabled ="false"/>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <asp:CheckBox ID="cbTELE" runat="server" Text="<%$ Resources:labels, telegram %>" Enabled ="false"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group custom-control">
                                                    <asp:CheckBox ID="chkRenew" runat="server" Enabled="false" Checked="True" Text="<%$ Resources:labels, autorenewlabel %>" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6" runat="server" id="MerchantCategory" visible="false">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">Merchant category</label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="ddlMerchantCategory" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group custom-control">
                                                    <asp:CheckBox ID="cbIsReceiver" runat="server" Enabled="False" Visible="false"
                                                        Text="<%$ Resources:labels, chichophepchuyenkhoantrongdanhsachnguoithuhuong %>" />
                                                </div>
                                            </div>
                                        </div>
                                       
                                    </asp:Panel>
                                </div>
                            </div>
                            <asp:Panel ID="pnsendinfoPersonal" Visible="false" runat="server">
                                <table id="tblsendinfor" runat="server" cellspacing="1" cellpadding="3">
                                    <tr id="trinfo_owner" runat="server">
                                        <td width="35%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="lblsendinfo" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfor_owner %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSendinfo" CssClass="form-control select2 infinity" runat="server" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr id="trinfo_coowner" runat="server">
                                        <td id="tdinfo_coowner" runat="server" width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="lblsendinfo_coowner" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfor_coowner %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSendinfo_coowner" CssClass="form-control select2 infinity" runat="server" Width="100px">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnsenddinfoSimple" Visible="false" runat="server">
                                <table id="Table1" runat="server" cellspacing="1" cellpadding="3">
                                    <tr id="trinfo_sim_owner" runat="server" visible="false">
                                        <td width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label9" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfor_owner %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_sim_owner" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="trinfo_sim_QLHC" runat="server" visible="false">
                                        <td id="td1" runat="server" width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label10" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfo_simple_qlhc %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_sim_qlhc" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr id="trinfo_sim_KT" runat="server" visible="false">
                                        <td id="td3" runat="server" width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label13" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfo_simple_kt %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_sim_kt" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr id="trinfo_sim_edit" runat="server" visible="false">
                                        <td id="td6" runat="server" width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label16" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfor_owner %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_sim_edit" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnsendinfoAdvance" Visible="false" runat="server">
                                <table id="Table2" runat="server" cellspacing="1" cellpadding="3">
                                    <tr id="trinfo_adv_owner" runat="server">
                                        <td width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label11" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfor_owner %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_adv_owner" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="trinfo_adv_admin">
                                        <td id="td2" runat="server" width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label12" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfo_adv_admin %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_adv_admin" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr id="trinfo_adv_coowner" runat="server" visible="false">
                                        <td id="td4" runat="server" width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label14" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfo_adv_coowner %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_adv_coowner" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr id="trinfo_adv_L2" runat="server" visible="false">
                                        <td id="td5" runat="server" width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label15" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfo_adv_l2 %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_adv_l2" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>

                                </table>
                            </asp:Panel>

                            <%--  Lannth - 24.9.2018 add dropdown sendinfo for corp matrix--%>
                            <asp:Panel ID="pnsendinfoMatrix" Visible="false" runat="server">
                                <table id="Table3" runat="server" cellspacing="1" cellpadding="3">
                                    <tr id="tr1" runat="server">
                                        <td width="25%" style="background-color: #F5F5F5; color: #38277c;">
                                            <asp:Label ID="Label17" Font-Bold="true" runat="server" Text="<%$ Resources:labels, sendcontractinfor_owner %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_matrix" runat="server" CssClass="form-control select2 infinity" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                </table>
                            </asp:Panel>
                        </div>
                        <div class="tab-pane " id="tab_2">
                            <div class="panel-container">
                                <div class="panel-content form-horizontal p-b-0">
                                    <asp:Panel ID="Panel1" runat="server">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.custcode %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lblcustcode" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.loaikhachhang %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbcusttype" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">Customer ID</label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbcustid" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.tendaydu %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbfullnameCust" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.tenviettat %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbshortname" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.chinhanh %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbbranch1" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.region %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lblregion" runat="server" CssClass="form-control" Enabled="false" Width="100%">
                                                        </asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.Townshipname %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lblTownship" runat="server" CssClass="form-control" Enabled="false" Width="100%">
                                                        </asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.birthday %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbbirth" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.gender %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbsex" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.phone %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbmobi" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.email %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbemail" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.hochieuchungminh %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbpassportcmdn" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.ngaycap %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbreleasedate" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.noicap %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbrelease" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.quocgia %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbnation" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 ">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.diachithuongtru %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbresidentaddress" TextMode="MultiLine" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 ">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><%=Resources.labels.diachitamtru %></label>
                                                    <div class="col-sm-8">
                                                        <asp:TextBox ID="lbtempstay" TextMode="MultiLine" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_2_1">
                            <div class="panel-container">
                                <div class="panel-content form-horizontal p-b-0">
                                    <%--<asp:Panel ID="Panel2" runat="server">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">KYC type</label>
                                                    <div class="col-sm-8">
                                                        <div class="col-sm-8">
                                                            <asp:TextBox ID="txttypeKYC" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:Label runat="server" ID="lblnumberID" class="col-sm-4 control-label">ID</asp:Label>
                                                    <div class="col-sm-8">
                                                        <div class="col-sm-8">
                                                            <asp:TextBox ID="txtNumberID" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 200px; background-color: #e2e2e2">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">Upload NRIC Photo</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="margin-top: 10px">
                                                <div class="form-group">
                                                    <asp:Image runat="server" ID="Font_IMG" data-toggle="modal" data-target="#myModal" Style="max-width: 300px; max-height: 180px" />
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="margin-top: 10px">
                                                <div class="form-group">
                                                    <asp:Image runat="server" ID="Back_IMG" data-toggle="modal" data-target="#myModal1"  Style="max-width: 300px; max-height: 180px" />
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    --%>

                                    <asp:Panel ScrollBars="Auto" runat="server" GroupingText="KYC Information">
                                        <%--<div style="overflow-x:hidden; overflow-y:scroll;">--%>
                                        <asp:Repeater runat="server" ID="Repeater1" OnItemCommand="rptData_ItemCommand">
                                            <HeaderTemplate>
                                                <div class="pane">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover footable c_list">
                                                            <thead class="thead-light repeater-table">
                                                                <tr>

                                                                    <th class="title-repeater"><%=Resources.labels.RequestNo%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.KycLevel%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.PaperNumber%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.PhoneNumber%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.status%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.DateCreate%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.CreatedBy%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.ApprovedBy%></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="tr-boder"><%#Eval("RequestID") %></td>
                                                    <td class="tr-boder"><%#Eval("PaperNO") %></td>
                                                    <td class="tr-boder"><%#Eval("PaperType") %></td>
                                                    <td class="tr-boder"><%#Eval("PHONE") %></td>
                                                    <td class="tr-boder"><%#Eval("StatusCaption")%></td>
                                                    <td class="tr-boder"><%#Eval("DateCreateFormat") %></td>
                                                    <td class="tr-boder"><%#Eval("UserCreated")%></td>
                                                    <td class="tr-boder"><%#Eval("UserApproved") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                        </table>
                        </div> </div>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <asp:HiddenField runat="server" ID="HiddenField1" />
                                        <%--</div>--%>
                                    </asp:Panel>
                                    <asp:UpdatePanel ID="UpdatePanelGridView" UpdateMode="Always" runat="server" RenderMode="Inline">
                                        <ContentTemplate>
                                            <uc1:GridViewPaging ID="GridViewPaging" Visible="false" runat="server"></uc1:GridViewPaging>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="GridViewPaging" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                    <asp:Panel ScrollBars="Auto" runat="server" GroupingText="Document Information">
                                        <%--<div style="overflow-x:hidden; overflow-y:scroll;">--%>
                                        <asp:Repeater runat="server" ID="rptData" OnItemDataBound="rptData_OnItemDataBound" OnItemCommand="rptData_ItemCommand">
                                            <HeaderTemplate>
                                                <div class="pane">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover footable c_list">
                                                            <thead class="thead-light repeater-table">
                                                                <tr>
                                                                    <th class="title-repeater"><%=Resources.labels.DocumentCode%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.DocumentName%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.UploadDate%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.CreatedBy%></th>
                                                                    <th class="title-repeater"><%=Resources.labels.status%></th>
                                                                    <th class="title-repeater" runat="server" visible="true"><%=Resources.labels.view%></th>
                                                                    <th class="title-repeater" runat="server" visible="true"><%=Resources.labels.Download%></th>
                                                                    <th class="title-repeater" runat="server" visible="false"><%=Resources.labels.delete%></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="tr-boder"><%#Eval("DocumentCode") %></td>
                                                    <td class="tr-boder"><%#Eval("DocumentName") %></td>
                                                    <td class="tr-boder"><%#Eval("DateCreated") %></td>
                                                    <td class="tr-boder"><%#Eval("UserCreated")%></td>
                                                    <td class="tr-boder">
                                                        <%#Eval("Status") %>
                                                        <label id="lbStatusDocument" visible="false" runat="server"><%#Eval("ValueStatus") %></label>
                                                    </td>
                                                    <td class="tr-boder item-center" runat="server" visible="true">
                                                        <%--<asp:LinkButton ID="lbtnViewFile" runat="server" class="btn btn-info" CommandArgument='<%#Eval("FILE") %>' CommandName='<%#IPC.ACTIONPAGE.DETAILS %>'> <%=Resources.labels.view%>
                                                </asp:LinkButton>--%>
                                                        <asp:UpdatePanel ID="updatepanel" runat="server">
                                                            <ContentTemplate>
                                                                <%--<uc1:PreviewImage ID="PreviewImage" runat="server"></uc1:PreviewImage>--%>
                                                                <a id="btnShowPopup" data-toggle="modal" data-target="#Modal<%#Eval("No") %>">
                                                                    <asp:Image ID="ImageView" Style="max-width: 150px" runat="server" src='<%# "data:image/jpg;base64," + Eval("FILE") %>' data-toggle="tooltip" title="Show image" />
                                                                </a>
                                                                <asp:Panel ID="pannelModal" runat="server" DefaultButton="btnOK">
                                                                    <!-- The Modal -->
                                                                    <div class="modal" id="Modal<%#Eval("No") %>">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">

                                                                                <!-- Modal Header -->
                                                                                <div class="modal-header">
                                                                                    <h4 class="modal-title" style="text-align: left!important">Edit Document</h4>
                                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                </div>

                                                                                <!-- Modal body -->
                                                                                <div class="divlog" style="color: red">
                                                                                    <label id="lblErrorPopup" runat="server"></label>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <div class="panel-container">
                                                                                        <div class="panel-content form-horizontal p-b-0">
                                                                                            <asp:TextBox ID="txtNo" Visible="false" Text='<%#Eval("No") %>' runat="server"></asp:TextBox>
                                                                                            <asp:TextBox ID="txtDocname" Visible="false" Text='<%#Eval("DocumentName") %>' runat="server"></asp:TextBox>
                                                                                            <asp:HiddenField ID="hdfDocumentType" runat="server" Value='<%#Eval("DocumentType") %>' />
                                                                                            <div class="form-group">
                                                                                                <label class="control-label required" style="float: left"><%=Resources.labels.DocumentName%></label>
                                                                                                <asp:TextBox ID="txtDocumentName" MaxLength="250" Text='<%#Eval("DocumentName") %>' runat="server" CssClass="form-control"></asp:TextBox>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="control-label required" style="float: left"><%=Resources.labels.DocumentType%></label>
                                                                                                <asp:DropDownList ID="ddlDocumentType" MaxLength="250" runat="server" Style="height: auto;" CssClass="form-control">
                                                                                                </asp:DropDownList>
                                                                                            </div>
                                                                                            <div class="view-image" style="text-align: center; width: 100%; height: auto">
                                                                                                <asp:Image ID="ImageDocument" runat="server" src='<%# "data:image/jpg;base64," + Eval("FILE") %>' Style="width: 100%; max-width: 500px; height: auto;" Height="400" Width="500" />
                                                                                            </div>
                                                                                            <div class="button" style="text-align: right; padding-bottom: 10px">
                                                                                                <%--<asp:FileUpload ID="fileUpdate" runat="server" accept=".PNG, .png, .jpg, .JPG, .JPEG, .jpeg, .BMP, .bmp, .PDF, .pdf, .webp, .WEBP" Width="348px" Height="27px" />--%>
                                                                                                <asp:FileUpload ID="fileUpdate" runat="server" accept=".PNG, .png, .jpg, .JPG, .JPEG, .jpeg, .BMP, .bmp" Width="348px" Height="27px" />
                                                                                                <asp:UpdatePanel ID="UpdatePanelUpdate" UpdateMode="Always" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:Button ID="btnImportUpdate" type="button" CssClass="btn btn-primary" runat="server" Text="<%$ Resources:labels, ImportFile %>" autopostback="false" OnClick="btnImportFileUpdate_Click" />
                                                                                                    </ContentTemplate>
                                                                                                    <Triggers>
                                                                                                        <asp:PostBackTrigger ControlID="btnImportUpdate" />
                                                                                                    </Triggers>
                                                                                                </asp:UpdatePanel>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Modal footer -->
                                                                                <div class="modal-footer" style="text-align: center!important">
                                                                                    <asp:Button runat="server" class="btn btn-primary" data-check="itemBranch111" ID="btnOK" OnClick="btnOK_Click" data-close="<%=BankCode.ClientID%>" Text='<%$Resources:labels,ok %>' />
                                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><%=Resources.labels.cancel %></button>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="btnOK" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td class="tr-boder item-center" runat="server" visible="true">
                                                        <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Always" runat="server">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" class="btn btn-info" BackColor="DodgerBlue" ID="txtdown_file1" CommandArgument='<%#Eval("DocumentCode") + "---" + Eval("File") %>' CommandName='<%#IPC.ACTIONPAGE.EXPORT %>'><i class="fa fa-download"></i> Download</asp:LinkButton>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="txtdown_file1" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td class="tr-boder item-center" runat="server" visible="false">
                                                        <asp:LinkButton ID="lbtnDelete" runat="server" class="btn btn-secondary" CommandArgument='<%#Eval("No")+ "|" +Eval("DocumentID")%>' CommandName='<%#IPC.ACTIONPAGE.DELETE%>' OnClientClick="return ConfirmDelete('Are you sure you want to delete this entry?');"> <%=Resources.labels.delete%> </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                            </table>
                                            </div> </div>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <div class="button" style="text-align: right; padding-bottom: 10px">
                                            <%--<asp:FileUpload ID="documentUpload" runat="server" accept=".PNG, .png, .jpg, .JPG, .JPEG, .jpeg, .BMP, .bmp, .PDF, .pdf, .webp, .WEBP" Width="348px" Height="27px" />--%>
                                            <asp:FileUpload ID="documentUpload" runat="server" accept=".PNG, .png, .jpg, .JPG, .JPEG, .jpeg, .BMP, .bmp" Width="348px" Height="27px" Visible="false" />
                                            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Always" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnImport" type="button" CssClass="btn btn-primary" runat="server" Text="<%$ Resources:labels, ImportFile %>" autopostback="false" OnClick="btnImportFile_Click" Visible="false" />
                                                    <asp:Button ID="btnDowloadAll" type="button" CssClass="btn btn-secondary" runat="server" Text="<%$ Resources:labels, DownloadAllFile %>" autopostback="false" OnClick="btnDownloadAll_Click" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnDowloadAll" />
                                                    <asp:PostBackTrigger ControlID="btnImport" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                        <asp:HiddenField runat="server" ID="hdCLMS_SCO_SCO_PRODUCT" />
                                        <%--</div>--%>
                                    </asp:Panel>
                                    <div class="panel-content div-btn rounded-bottom border-faded border-left-0 border-right-0 border-bottom-0 text-muted">
                                        <asp:Button ID="btSaveDocument" CssClass="btn btn-primary" runat="server" Text="<%$ Resources:labels, SaveDocument %>" OnClick="btSaveDoc_Click" Visible="false" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane " id="tab_3">
                            <div class="divResult">
                                <asp:GridView ID="gvCustomerList" runat="server" BackColor="White" CssClass="table table-hover"
                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                                    Width="100%" AllowPaging="True" AutoGenerateColumns="False"
                                    OnRowDataBound="gvCustomerList_RowDataBound" PageSize="15">
                                    <RowStyle ForeColor="#000000" />
                                    <Columns>

                                        <asp:TemplateField HeaderText="<%$ Resources:labels, fullname %>" SortExpression="FULLNAME">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hpUserFullName" runat="server"></asp:HyperLink>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:labels, phone %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:labels, kieunguoidung %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserType" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblType" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:labels, trangthai %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle CssClass="gvFooterStyle" />
                                    <PagerStyle HorizontalAlign="Center" CssClass="pager" />
                                    <SelectedRowStyle />
                                    <HeaderStyle CssClass="gvHeader" />
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="tab-pane " id="tab_4">
                            <div class="divResult">
                                <asp:GridView ID="gvCard" runat="server" BackColor="White" CssClass="table table-hover"
                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                                    Width="100%" AllowPaging="True" AutoGenerateColumns="False"
                                    OnRowDataBound="gvCard_RowDataBound" PageSize="15">
                                    <RowStyle ForeColor="#000000" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbxSelect" runat="server" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="USERID" Visible="false">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hpUID" runat="server" Visible="false"></asp:HyperLink>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:labels, makhachhang %>" SortExpression="FULLNAME">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hpHolderCIF" runat="server"></asp:HyperLink>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:labels, tendaydu %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFullName" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="gvHeader" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:labels, numberofcard %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNoCard" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Link type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblType" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:labels, trangthai %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="<%$ Resources:labels, edit %> ">
                        <ItemTemplate>
                            <asp:HyperLink ID="hpEdit" runat="server">[hpEdit]</asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:labels, delete %>">
                        <ItemTemplate>
                            <asp:HyperLink ID="hpDelete" runat="server">[hpDelete]</asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>--%>
                                    </Columns>
                                    <FooterStyle CssClass="gvFooterStyle" />
                                    <PagerStyle HorizontalAlign="Center" CssClass="pager" />
                                    <SelectedRowStyle />
                                    <HeaderStyle CssClass="gvHeader" />
                                </asp:GridView>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" runat="server" id="divReject">
            <div class="col-sm-12">
                <div class="panel">
                    <div class="panel-hdr">
                        <h2>Reject Reason </h2>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active">
                            <div class="panel-container">
                                <div class="panel-content form-horizontal p-b-0">
                                    <asp:Panel ID="Panel2" runat="server">
                                        <div class="row">
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-8">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label required">Reason name</label>
                                                    <div class="col-sm-6">
                                                        <asp:DropDownList ID="ddlReason" runat="server" CssClass="form-control select2">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-8">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">Description</label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txtDescription" MaxLength="250" CssClass="form-control" runat="server" TextMode="MultiLine" onkeyup="ValidateLimit(this,'250');" onkeyDown="ValidateLimit(this,'250');" onpaste="ValidateLimit(this,'250');" onChange="ValidateLimit(this,'250');" onmousedown="ValidateLimit(this,'250');"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"></div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 10px; text-align: center;">
            &nbsp;	
        <asp:Button ID="btApprove" runat="server" Text="<%$ Resources:labels, approve %>" CssClass="btn btn-primary"
            Width="80px" OnClick="btApprove_Click" />
            &nbsp;	
	<asp:Button ID="btReject" runat="server" Text="<%$ Resources:labels, reject %>" CssClass="btn btn-secondary"
        Width="86px" OnClick="btReject_Click1" />
            &nbsp;	
            <asp:Button ID="btnExit" runat="server" Text="<%$ Resources:labels, back %>" CssClass="btn btn-secondary"
                OnClick="btnExit_Click" />
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">

    function SelectCbx(obj) {
        var count = document.getElementById('aspnetForm').elements.length;
        var elements = document.getElementById('aspnetForm').elements;
        if (obj.checked) {
            for (i = 0; i < count; i++) {
                if (elements[i].type == 'checkbox' && elements[i].id != '') {
                    elements[i].checked = true;
                    //elements[i].parentNode.parentNode.className="hightlight";
                }
            }

        } else {
            for (i = 0; i < count; i++) {
                if (elements[i].type == 'checkbox' && elements[i].id != '') {
                    elements[i].checked = false;
                    //elements[i].parentNode.parentNode.className="nohightlight";
                }
            }
        }
    }

    function HighLightCBX(obj, obj1) {
        //var obj2=document.getElementById(obj1);
        if (obj1.checked) {
            document.getElementById(obj).className = "hightlight";
        }
        else {
            document.getElementById(obj).className = "nohightlight";
        }
    }
</script>
