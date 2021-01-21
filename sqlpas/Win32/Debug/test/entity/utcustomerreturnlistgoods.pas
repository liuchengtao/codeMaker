unit utcustomerreturnlistgoods;
{这是注释}
interface
  type
    Rtcustomerreturnlistgoods = ^Ttcustomerreturnlistgoods;
    [Table('t_customer_return_list_goods','')]
    Ttcustomerreturnlistgoods = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('code','')]
    code: String;    [FieldInfo('model','')]
    model: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('num','')]
    num: Integer;    [FieldInfo('price','')]
    price: String;    [FieldInfo('total','')]
    total: String;    [FieldInfo('unit','')]
    unit: String;    [FieldInfo('customer_return_list_id','')]
    customer_return_list_id: Integer;    [FieldInfo('type_id','')]
    type_id: Integer;    [FieldInfo('goods_id','')]
    goods_id: Integer;   
  end;
implementation