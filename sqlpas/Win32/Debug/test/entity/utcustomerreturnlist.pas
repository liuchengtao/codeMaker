unit utcustomerreturnlist;
{这是注释}
interface
  type
    Rtcustomerreturnlist = ^Ttcustomerreturnlist;
    [Table('t_customer_return_list','')]
    Ttcustomerreturnlist = Record
          [FieldInfo('id','')]
    id: String;
    amount_paid: String;
    amount_payable: String;
    customer_return_date: String;
    customer_return_number: String;
    remarks: String;
    state: Integer;
    user_id: Integer;
    customer_id: Integer;   
  end;
implementation