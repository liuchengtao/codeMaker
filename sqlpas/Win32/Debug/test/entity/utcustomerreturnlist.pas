unit utcustomerreturnlist;
{这是注释}
interface
  type
    Rtcustomerreturnlist = ^Ttcustomerreturnlist;
    [Table('t_customer_return_list','')]
    Ttcustomerreturnlist = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('amount_paid','')]
    amount_paid: String;    [FieldInfo('amount_payable','')]
    amount_payable: String;    [FieldInfo('customer_return_date','')]
    customer_return_date: String;    [FieldInfo('customer_return_number','')]
    customer_return_number: String;    [FieldInfo('remarks','')]
    remarks: String;    [FieldInfo('state','')]
    state: Integer;    [FieldInfo('user_id','')]
    user_id: Integer;    [FieldInfo('customer_id','')]
    customer_id: Integer;   
  end;
implementation