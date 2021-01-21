unit utpurchaselist;
{这是注释}
interface
  type
    Rtpurchaselist = ^Ttpurchaselist;
    [Table('t_purchase_list','')]
    Ttpurchaselist = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('amount_paid','')]
    amount_paid: String;    [FieldInfo('amount_payable','')]
    amount_payable: String;    [FieldInfo('purchase_date','')]
    purchase_date: String;    [FieldInfo('remarks','')]
    remarks: String;    [FieldInfo('state','')]
    state: Integer;    [FieldInfo('purchase_number','')]
    purchase_number: String;    [FieldInfo('supplier_id','')]
    supplier_id: Integer;    [FieldInfo('user_id','')]
    user_id: Integer;   
  end;
implementation