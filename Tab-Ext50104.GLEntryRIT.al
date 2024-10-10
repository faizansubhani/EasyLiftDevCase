namespace ALProject.ALProject;

using Microsoft.Finance.GeneralLedger.Ledger;

tableextension 50104 "GLEntry RIT" extends "G/L Entry"
{
    fields
    {
        field(50100; "Certificate Reference No. RIT"; Code[50])
        {
            Caption = 'Certificate Reference No.';
        }

    }
}
