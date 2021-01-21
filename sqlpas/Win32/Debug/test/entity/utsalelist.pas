unit utsalelist;
{这是注释}
interface
  type
    Rtsalelist = ^Ttsalelist;
    [Table('t_sale_list','')]
    Ttsalelist = Record
          [FieldInfo('id','')]
    id: String;
    amount_paid: String;
    amount_payable: String;
    remarks: String;
    sale_date: String;
    sale_number: String;
    state: Integer;
    user_id: Integer;
    customer_id: Integer;   
  end;
implementation