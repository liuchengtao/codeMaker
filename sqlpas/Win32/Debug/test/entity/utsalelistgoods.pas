unit utsalelistgoods;
{这是注释}
interface
  type
    Rtsalelistgoods = ^Ttsalelistgoods;
    [Table('t_sale_list_goods','')]
    Ttsalelistgoods = Record
          [FieldInfo('id','')]
    id: String;
    code: String;
    model: String;
    name: String;
    num: Integer;
    price: String;
    total: String;
    unit: String;
    sale_list_id: Integer;
    type_id: Integer;
    goods_id: Integer;   
  end;
implementation