unit utoverflowlistgoods;
{这是注释}
interface
  type
    Rtoverflowlistgoods = ^Ttoverflowlistgoods;
    [Table('t_overflow_list_goods','')]
    Ttoverflowlistgoods = Record
          [FieldInfo('id','')]
    id: String;
    code: String;
    model: String;
    name: String;
    num: Integer;
    price: String;
    total: String;
    unit: String;
    overflow_list_id: Integer;
    type_id: Integer;
    goods_id: Integer;   
  end;
implementation