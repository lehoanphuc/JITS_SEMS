<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Widget.ascx.cs" Inherits="Widgets_SEMSCBTBank_Controls_Widget" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="subheader">
            <h1 class="subheader-title">
                <asp:Label ID="lblTitleProduct" runat="server"></asp:Label>
            </h1>
        </div>
        <div class="loading">
            <asp:UpdateProgress ID="UpdateProgress1" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                <ProgressTemplate>
                    <img src="Images/tenor.gif" style="width: 32px; height: 32px;" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <div id="divError">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </div>
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <div class="panel">
                    <div class="panel-hdr">
                        <h2>
                            <%=Resources.labels.thongtinnganhang%>
                        </h2>
                    </div>
                    <div class="panel-container">
                        <div class="panel-content form-horizontal p-b-0">
                            <asp:Panel ID="pnAdd" runat="server">
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-sm-4 col-xs-12 control-label required"><%=Resources.labels.countryname %></label>
                                            <div class="col-sm-8 col-xs-12">
                                                <asp:DropDownList ID="ddlCountryName" CssClass="form-control select2 infinity" Width="100%" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-sm-4 col-xs-12 control-label required"><%=Resources.labels.BankCode %></label>
                                            <div class="col-sm-8 col-xs-12">
                                                <asp:TextBox ID="txtBankCode" MaxLength="50" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-sm-4 col-xs-12 control-label required"><%=Resources.labels.BankName %></label>
                                            <div class="col-sm-8 col-xs-12">
                                                <asp:TextBox ID="txtBankName" MaxLength="300" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-sm-4 col-xs-12 control-label required"><%=Resources.labels.shortname %></label>
                                            <div class="col-sm-8 col-xs-12">
                                                <asp:TextBox ID="txtShortName" MaxLength="100" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-sm-4 col-xs-12 control-label"><%=Resources.labels.BankNameLA %></label>
                                             <div class="col-sm-8 col-xs-12">
                                                <asp:TextBox ID="txtBankNameLA" MaxLength="300" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-sm-4 col-xs-12 control-label"><%=Resources.labels.BankNameCN %></label>
                                            <div class="col-sm-8 col-xs-12">
                                                <asp:TextBox ID="txtBankNameCN" MaxLength="300" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-sm-4 col-xs-12 control-label required"><%=Resources.labels.address %></label>
                                            <div class="col-sm-8 col-xs-12">
                                                <asp:TextBox ID="txtAddress" CssClass="form-control" TextMode="MultiLine" onkeyup="ValidateLimit(this,'255');" onkeyDown="ValidateLimit(this,'255');" onpaste="ValidateLimit(this,'255');" onChange="ValidateLimit(this,'255');" onmousedown="ValidateLimit(this,'255');" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="panel-container">
                        <asp:Panel ID="subpanel" runat="server">
                            <div class="panel-hdr">
                                <h2>
                                    <%=Resources.labels.currency%>
                                </h2>
                            </div>
                            <div class="panel-content form-horizontal p-b-0">
                                <div>
                                    <asp:CheckBoxList ID="cblCCYID" CssClass="custom-control" runat="server" RepeatColumns="3"
                                        RepeatDirection="Horizontal" Width="100%">
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="panel-content div-btn rounded-bottom border-faded border-left-0 border-right-0 border-bottom-0 text-muted">
                        <asp:Button ID="btsave" CssClass="btn btn-primary" runat="server" Text="<%$ Resources:labels, save %>" OnClientClick="return checkValidation()" OnClick="btsave_Click" />
                        <asp:Button ID="btnClear" CssClass="btn btn-secondary" Text="<%$ Resources:labels, Clear %>" runat="server" OnClick="Clear_Click" />
                        <asp:Button ID="btback" CssClass="btn btn-secondary" runat="server" Text="<%$ Resources:labels, back %>" OnClick="btback_Click" />
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<script src="/JS/Common.js"></script>
<script type="text/javascript">
    var atLeast = 1
    function checkValidation() {
        if (!validateEmpty('<%=txtBankName.ClientID %>','<%=Resources.labels.validate_bankname %>')) {
            document.getElementById('<%=txtBankName.ClientID %>').focus();
            return false;
        }
        if (!validateEmpty('<%=txtShortName.ClientID %>','<%=Resources.labels.validate_shortname %>')) {
            document.getElementById('<%=txtShortName.ClientID %>').focus();
            return false;
        }
        if (!validateEmpty('<%=txtAddress.ClientID %>','<%=Resources.labels.validate_address %>')) {
            document.getElementById('<%=txtAddress.ClientID %>').focus();
            return false;
        }
        if (!validateEmpty('<%=txtBankCode.ClientID %>','<%=Resources.labels.validate_bankcode %>')) {
            document.getElementById('<%=txtBankName.ClientID %>').focus();
            return false;
        }
        var CHK = document.getElementById("<%=cblCCYID.ClientID%>");
        var checkbox = CHK.getElementsByTagName("input");
        var counter = 0;
        for (var i = 0; i < checkbox.length; i++) {
            if (checkbox[i].checked) {
                counter++;
            }
        }
        if (atLeast > counter) {
            alert("Please select at least " + atLeast + " Currency");
            return false;
        }
        return true;
    }
    function Loading() {
        if (document.getElementById('<%=lblError.ClientID%>').innerHTML != '') {
            document.getElementById('<%=lblError.ClientID%>').innerHTML = '';
        }
    }
</script>
