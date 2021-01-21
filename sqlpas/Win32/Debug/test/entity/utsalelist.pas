unit utsalelist;
{这是注释}
interface
  type
    Rtsalelist = ^Ttsalelist;
    [Table('t_sale_list','')]
    Ttsalelist = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('amount_paid','')]
    amount_paid: String;    [FieldInfo('amount_payable','')]
    amount_payable: String;    [FieldInfo('remarks','')]
    remarks: String;    [FieldInfo('sale_date','')]
    sale_date: String;    [FieldInfo('sale_number','')]
    sale_number: String;    [FieldInfo('state','')]
    state: Integer;    [FieldInfo('user_id','')]
    user_id: Integer;    [FieldInfo('customer_id','')]
    customer_id: Integer;   
  end;
implementation