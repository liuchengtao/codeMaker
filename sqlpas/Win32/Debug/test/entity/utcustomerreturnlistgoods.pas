unit utcustomerreturnlistgoods;
{这是注释}
interface
  type
    Rtcustomerreturnlistgoods = ^Ttcustomerreturnlistgoods;
    [Table('t_customer_return_list_goods','')]
    Ttcustomerreturnlistgoods = Record
          [FieldInfo('id','')]
    id: String;
    code: String;
    model: String;
    name: String;
    num: Integer;
    price: String;
    total: String;
    unit: String;
    customer_return_list_id: Integer;
    type_id: Integer;
    goods_id: Integer;   
  end;
implementation