﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Widget.ascx.cs" Inherits="Widgets_SEMSMenuRight_Widget" %>
<link href="Widgets/MenuPermission/CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
<script src="Widgets/MenuPermission/Scripts/JScript.js" type="text/javascript"></script>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div id="divError">
            <asp:UpdateProgress ID="UpdateProgress1" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                <ProgressTemplate>
                    <img alt="" src="widgets/SEMSCustomerList/Images/ajaxloader.gif" style="width: 16px; height: 16px;" />
                    <%=Resources.labels.loading %>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:Label ID="lblAlert" runat="server"></asp:Label>
        </div>
        <asp:Panel runat="server" ID="pnFocus" DefaultButton="btnSave">
            <div id="divSearch">
                <table class="style1" cellspacing="1" cellpadding="3">

                    <tr>
                        <td style="width: 30%; text-align: right;">
                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:labels, portal %>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPortal" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPortal_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%; text-align: right;">
                            <asp:Label ID="Label11" runat="server" Text='<%$ Resources:labels, role %>'></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 30%; text-align: right;">
                            <asp:Label ID="Label3" runat="server" Text='<%$ Resources:labels, menu %>'></asp:Label>
                        </td>
                        <td>
                            <div style="height: 400px; width: 400px; overflow: auto">
                                <asp:TreeView ID="tvMenu" runat="server" ImageSet="Simple" ShowLines="True">
                                    <ParentNodeStyle Font-Bold="False" />
                                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD"
                                        HorizontalPadding="0px" VerticalPadding="0px" />
                                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black"
                                        HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" />
                                </asp:TreeView>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="padding: 10px; text-align: center;">
                &nbsp;
                <asp:Button ID="btnSave" runat="server" Text='<%$ Resources:labels, save %>' OnClick="btnSave_Click" />
                &nbsp;
                <asp:Button ID="Button2" runat="server" Text="<%$ Resources:labels, back %>" PostBackUrl="javascript:history.go(-1)" />
            </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>