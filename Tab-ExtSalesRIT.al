tableextension 50100 "Sales Header EXT RIT" extends "Sales Header"
{
    fields
    {
        field(50100; "Certificate Reference No. RIT"; Code[20])
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
