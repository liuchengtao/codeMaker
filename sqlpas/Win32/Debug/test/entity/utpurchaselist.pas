unit utpurchaselist;
{这是注释}
interface
  type
    Rtpurchaselist = ^Ttpurchaselist;
    [Table('t_purchase_list','')]
    Ttpurchaselist = Record
          [FieldInfo('id','')]
    id: String;
    amount_paid: String;
    amount_payable: String;
    purchase_date: String;
    remarks: String;
    state: Integer;
    purchase_number: String;
    supplier_id: Integer;
    user_id: Integer;   
  end;
implementation