unit utreturnlistgoods;
{这是注释}
interface
  type
    Rtreturnlistgoods = ^Ttreturnlistgoods;
    [Table('t_return_list_goods','')]
    Ttreturnlistgoods = Record
          [FieldInfo('id','')]
    id: String;
    code: String;
    model: String;
    name: String;
    num: Integer;
    price: String;
    total: String;
    unit: String;
    return_list_id: Integer;
    type_id: Integer;
    goods_id: Integer;   
  end;
implementation