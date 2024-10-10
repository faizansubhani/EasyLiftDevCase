tableextension 50101 "Sales Inoice EXT RIT" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Certificate Reference No. RIT"; Code[50])
        {
            Caption = 'Certificate Reference No.';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}