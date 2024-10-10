namespace ALProject.ALProject;

using Microsoft.Finance.GeneralLedger.Ledger;

pageextension 50103 "GL Entries RIT" extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {

            field("Certificate Reference No. RIT"; Rec."Certificate Reference No. RIT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Certificate Reference No. field.', Comment = '%';
            }
        }
    }
}
