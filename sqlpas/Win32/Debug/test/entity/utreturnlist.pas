unit utreturnlist;
{这是注释}
interface
  type
    Rtreturnlist = ^Ttreturnlist;
    [Table('t_return_list','')]
    Ttreturnlist = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('amount_paid','')]
    amount_paid: String;    [FieldInfo('amount_payable','')]
    amount_payable: String;    [FieldInfo('remarks','')]
    remarks: String;    [FieldInfo('return_date','')]
    return_date: String;    [FieldInfo('return_number','')]
    return_number: String;    [FieldInfo('state','')]
    state: Integer;    [FieldInfo('supplier_id','')]
    supplier_id: Integer;    [FieldInfo('user_id','')]
    user_id: Integer;   
  end;
implementation