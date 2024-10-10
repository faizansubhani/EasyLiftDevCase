
pageextension 50102 "Posted Sales Invoice RIT" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {

            field("Certificate Reference No. RIT"; Rec."Certificate Reference No. RIT")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Certificate Reference No. field.', Comment = '%';
            }
        }

        addfirst(FactBoxes)
        {
            part("Attached Documents RIT"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Sales Invoice Header"),
                              "No." = field("No.");
            }

        }
    }
}
