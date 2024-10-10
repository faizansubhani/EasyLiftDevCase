

codeunit 50101 "Document Attachment RIT"
{

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        SalesHeader: Record "Sales Header";
        SalesInvoiceHdr: Record "Sales Invoice Header";
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"Sales Header":
                begin
                    RecRef.Open(DATABASE::"Sales Header");
                    SalesHeader.SetRange("No.", DocumentAttachment."No.");
                    if SalesHeader.FindFirst() then
                        RecRef.GetTable(SalesHeader);

                end;

            DATABASE::"Sales Invoice Header":
                begin
                    RecRef.Open(DATABASE::"Sales Invoice Header");
                    SalesInvoiceHdr.SetRange("No.", DocumentAttachment."No.");
                    if SalesInvoiceHdr.FindFirst() then
                        RecRef.GetTable(SalesInvoiceHdr);

                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"Sales Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            DATABASE::"Sales Invoice Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"Sales Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            DATABASE::"Sales Invoice Header":
                begin
                    FieldRef := RecRef.Field(2);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeFinalizePosting, '', false, false)]
    local procedure "Sales-Post_OnBeforeFinalizePosting"(var Sender: Codeunit "Sales-Post"; var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line" temporary; var EverythingInvoiced: Boolean; SuppressCommit: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    var
        Doc: Record "Document Attachment";
        DocCopy: Record "Document Attachment";
    begin
        doc.Reset();
        doc.SetRange("Table ID", Database::"Sales Header");
        doc.SetRange("No.", SalesHeader."No.");
        if Doc.FindSet() then
            repeat
                DocCopy.get(doc."Table ID", doc."No.", doc."Document Type", Doc."Line No.", Doc.ID);
                doccopy.Rename(Database::"Sales Invoice Header", doc."No.", doc."Document Type", Doc."Line No.", Doc.ID);
            until Doc.Next() = 0;
    end;

    //Keeping this code as reference to show it can be done as its already there in SO to SI
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Bank Acc. Reconciliation Post", 'OnBeforeFinalizePost', '', false, false)]
    local procedure OnBeforeFinalizePost(var BankAccReconciliation: Record "Bank Acc. Reconciliation");
    var
        Doc: Record "Document Attachment";
        DocCopy: Record "Document Attachment";
    begin
        doc.Reset();
        doc.SetRange("Table ID", 273);
        doc.SetRange("No.", BankAccReconciliation."Statement No.");
        if Doc.FindSet() then
            repeat
                DocCopy.get(doc."Table ID", doc."No.", doc."Document Type", Doc."Line No.", Doc.ID);
                doccopy.Rename(275, doc."No.", doc."Document Type", Doc."Line No.", Doc.ID);
            until Doc.Next() = 0;
    end;

}

