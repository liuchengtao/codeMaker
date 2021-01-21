unit utreturnlist;
{这是注释}
interface
  type
    Rtreturnlist = ^Ttreturnlist;
    [Table('t_return_list','')]
    Ttreturnlist = Record
          [FieldInfo('id','')]
    id: String;
    amount_paid: String;
    amount_payable: String;
    remarks: String;
    return_date: String;
    return_number: String;
    state: Integer;
    supplier_id: Integer;
    user_id: Integer;   
  end;
implementation