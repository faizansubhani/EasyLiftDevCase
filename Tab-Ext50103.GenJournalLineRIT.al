namespace ALProject.ALProject;

using Microsoft.Finance.GeneralLedger.Journal;

tableextension 50103 "Gen. Journal Line RIT" extends "Gen. Journal Line"
{
    fields
    {
        field(50100; "Certificate Reference No. RIT"; Code[50])
        {
            Caption = 'Certificate Reference No.';
        }

    }
}
