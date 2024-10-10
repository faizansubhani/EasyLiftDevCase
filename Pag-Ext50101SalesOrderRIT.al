pageextension 50101 "Sales Order EXT RIT" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {

            field("Certificate Reference No. RIT"; Rec."Certificate Reference No. RIT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Certificate Reference No. field.', Comment = '%';
            }
        }

        addfirst(FactBoxes)
        {
            part("Attached Documents RIT"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Sales Header"),
                              "No." = field("No."),
                              "Document Type" = field("Document Type");
            }

        }
    }
}
