unit utdamagelistgoods;
{这是注释}
interface
  type
    Rtdamagelistgoods = ^Ttdamagelistgoods;
    [Table('t_damage_list_goods','')]
    Ttdamagelistgoods = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('code','')]
    code: String;    [FieldInfo('model','')]
    model: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('num','')]
    num: Integer;    [FieldInfo('price','')]
    price: String;    [FieldInfo('total','')]
    total: String;    [FieldInfo('unit','')]
    unit: String;    [FieldInfo('damage_list_id','')]
    damage_list_id: Integer;    [FieldInfo('type_id','')]
    type_id: Integer;    [FieldInfo('goods_id','')]
    goods_id: Integer;   
  end;
implementation