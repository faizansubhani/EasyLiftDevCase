

reportextension 50100 "Sales Invoice RIT" extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(Certificate_Reference_No__RIT; "Certificate Reference No. RIT")
            {

            }
        }
    }
    rendering
    {
        layout(RITRDLCLayout)
        {
            Type = RDLC;
            Caption = 'RIT Sales - Invoice';
            LayoutFile = 'RITSalesInvoice.rdl';
        }
    }
}
