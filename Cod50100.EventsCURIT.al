codeunit 50100 "Events CU RIT"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure "Sales-Post_OnBeforePostSalesDoc"(var Sender: Codeunit "Sales-Post"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    begin
        if Salesheader."Document Type" = Salesheader."Document Type"::Order then
            SalesHeader.Testfield("Certificate Reference No. RIT");
    end;


    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line");
    begin
        GenJournalLine."Certificate Reference No. RIT" := SalesHeader."Certificate Reference No. RIT"
    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", OnAfterCopyGLEntryFromGenJnlLine, '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line");
    begin
        GLEntry."Certificate Reference No. RIT" := GenJournalLine."Certificate Reference No. RIT";
    end;
}
