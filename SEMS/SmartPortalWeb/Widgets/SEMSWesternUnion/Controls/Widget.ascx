<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Widget.ascx.cs" Inherits="Widgets_SEMSWesternUnion_Control_Widget" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<style>
    .panel{
            margin-bottom: 0.5rem;
    }
</style>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <div id="divCustHeader">
            WESTERN UNION INFORMATION
        </div>
        <div id="divError">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <br />
        <div class="loading">
            <asp:UpdateProgress ID="UpdateProgress3" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                <ProgressTemplate>
                    <img src="Images/tenor.gif" style="width: 32px; height: 32px;" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="row" runat="server" id="Div1">
            <div class="panel">
                <div class="panel-hdr">
                    <h2>Get information from Western Union
                    </h2>
                </div>
                <div class="panel-container">
                    <div class="panel-content form-horizontal p-b-0">
                        <asp:Panel ID="Panel3" runat="server">
                            <div class="row">
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%= Resources.labels.cashcode %></label>
                                        <div class="col-sm-7 ">
                                            <asp:TextBox ID="txtCashcode" CssClass="form-control" runat="server" MaxLength="10" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Exchange rate amount: </label>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtExchange" AutoPostBack="true" Width="120%" CssClass="amount" runat="server" OnTextChanged="txtExchange_TextChanged" onkeyup="this.value=this.value.replace(/[^0-9.]/g, '')" />
                                        </div>
                                        <asp:Label ID="lblex" runat="server" class="col-sm-3 control-label right">/1 USD</asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Total Amount Receiver: </label>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtReamount" Width="120%" CssClass="amount" runat="server" Enabled="false" />
                                        </div>
                                        <asp:Label ID="lblExchangerate"  runat="server" class="col-sm-3 control-label right"></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label" style="font-weight: bold;"><%=Resources.labels.sendtype%> </label>
                                        <div class="col-sm-7">
                                            <asp:DropDownList ID="ddlsendtype" CssClass="form-control select2 infinity" Width="100%" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlsendtype_SelectedIndexChanged">
                                                <asp:ListItem Value="EMAIL" Text="<%$ Resources:labels,  email%>"></asp:ListItem>
                                                <asp:ListItem Value="PHONE" Text="<%$ Resources:labels,  phone%>"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" runat="server" id="PhoneWallet">
            <div class="panel">
                <div class="panel-hdr">
                    <h2>Sender information
                    </h2>
                </div>
                <div class="panel-container">
                    <div class="panel-content form-horizontal p-b-0">
                        <asp:Panel ID="Panel4" runat="server">
                            <div class="row">
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.firstname %> :</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblSenderFirstName" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.lastname %> :</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblSenderLastName" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.senderccy %> :</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblSenderCCYID" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.payoutcountry %> :</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblPayOut" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.amountWU %> :</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblAmountSend" runat="server" class="control-label"></asp:Label>
                                            <asp:Label ID="Label3" runat="server" class="control-label">USD</asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.fee %> :</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblFee" runat="server" class="control-label"></asp:Label>
                                            <asp:Label ID="Label2" runat="server" class="control-label">USD</asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.tongtien %> :</label>
                                        <div class="col-sm-7">
                                            <asp:Label ID="lblTotalAmount" runat="server" class="control-label"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" class="control-label">USD</asp:Label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" runat="server" id="Div2">
            <div class="panel">
                <div class="panel-hdr">
                    <h2>Sender Details
                    </h2>
                </div>
                <div class="panel-container">
                    <div class="panel-content form-horizontal p-b-0">
                        <asp:Panel ID="Panel1" runat="server">
                            <div class="row">
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.temporaryunit %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblTemUnit" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.temporarydistrict %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblTemDistrict" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.thanhpho %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblTemCity" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.province %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblTemProvince" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.postcode %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblPostcode" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.country %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblSenderCountry" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.countrycode %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblCountryCode" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Telephone number:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lbltelephone" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><%=Resources.labels.mbcountrycode %>:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblmobilecode" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Mobile number:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="lblMobilephone" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Email:</label>
                                        <div class="col-sm-7 control-label">
                                            <asp:Label ID="txtEmail" runat="server" class="control-label"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" runat="server" id="Div3">
            <div class="panel">
                <div class="panel-hdr">
                    <h2>
                       ID detail information
                    </h2>
                </div>
                <div class="panel-container">
                    <div class="panel-content form-horizontal p-b-0">
                        <asp:Panel ID="Panel2" runat="server">
                            <div class="row">
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.idtype %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbIDType" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.idnumber %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbIDNumber" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.countryofissue %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbCouuntryOfIssue" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.expdate %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbExpiry" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.issdate %> :</label>
                                <div class="col-sm-7">
                                    <asp:Label ID="lbIssue" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label">Date of birth :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbDOB" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.officephone %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lblOffcicePhone" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.occupation %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbOccupation" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.purpose %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbPurpose" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.sourceoffund %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbSOF" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.permanentunit %>:</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbUnit" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.permanentdistrict %></label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbDistrict" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.permanentcity %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbProvince" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.permanentcountry %> :</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbCountry" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.countryofbirth %>:</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbCountryOfBirth" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.nationality %>:</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lblNation" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.gender %>:</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbGender" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.comment %>:</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lblComment" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" runat="server" id="Div4">
            <div class="panel">
                <div class="panel-hdr">
                    <h2>
                        Receiver information
                    </h2>
                </div>
                <div class="panel-container">
                    <div class="panel-content form-horizontal p-b-0">
                        <asp:Panel ID="Panel5" runat="server">
                            <div class="row">
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.firstname %>:</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lblrefirstname" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label"><%=Resources.labels.lastname %>:</label>
                                <div class="col-sm-7 control-label">
                                    <asp:Label ID="lbllastname" runat="server" class="control-label"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" runat="server" id="Div5">
            <asp:Panel ID="pndel" runat="server">
            <div class="pndel">
                <div class="panel-hdr">
                    <h2>
                        Reason Delete
                    </h2>
                </div>
                <div class="panel-container">
                    <div class="panel-content form-horizontal p-b-0">
                        
                            <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <div class="col-sm-6 col-sm-10">
                                        <label class="col-sm-12 control-label" style="font-weight: bold; text-align: center;"><%=Resources.labels.reasonType%> </label>
                                    </div>
                                    <div class="col-sm-4 col-sm-10">
                                        <asp:DropDownList ID="ddlreason" CssClass="form-control select2 infinity" Width="100%" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlreason_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="Other"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Sender canel"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Not found Cashcode"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Transaction false"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <div class="col-sm-6 col-sm-10">
                                        <label id="lbreason" class="col-sm-12 control-label" style="font-weight: bold; text-align: center;" runat="server"><%=Resources.labels.Reason%> </label>
                                    </div>
                                    <div class="col-sm-4 col-sm-10 right">
                                        <asp:TextBox ID="txtreason" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            </asp:Panel>
        </div>

        <div class="panel-container">
            <div class="panel-content div-btn rounded-bottom border-faded border-left-0 border-right-0 border-bottom-0 text-muted">
                <asp:Button ID="btsave" CssClass="btn btn-primary" runat="server" Text="<%$ Resources:labels, Send %>" OnClick="btsave_Click" Style="height: 34px;" />
                <asp:Button ID="btdel" CssClass="btn btn-danger" runat="server" Text="<%$ Resources:labels, delete %>" OnClick="btdel_Click" />
                <asp:Button ID="btback" CssClass="btn btn-secondary" runat="server" Text="<%$ Resources:labels, Back %>" OnClick="btback_Click" Style="height: 34px;" />
                <asp:Button ID="btresend" CssClass="btn btn-primary" runat="server" Text="ReSend" OnClick="btresend_Click" Style="height: 34px;" />
            </div>
        </div>
        </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<script src="/JS/Common.js"></script>
<script type="text/javascript">
    function replaceAll(str, from, to) {
        var idx = str.indexOf(from);
        while (idx > -1) {
            str = str.replace(from, to);
            idx = str.indexOf(from);
        }
        return str;
    }

    function ntt(sNumber, idDisplay, event) {
        executeComma(sNumber, event);
        if (document.getElementById(sNumber).value == "") {
            document.getElementById(idDisplay).innerHTML = "";
            return;
        }
        document.getElementById(idDisplay).innerHTML = "(" + number2text(replaceAll(document.getElementById(sNumber).value, ",", ""), '<%=System.Globalization.CultureInfo.CurrentCulture.ToString()%>') + ")";
    }
</script>

