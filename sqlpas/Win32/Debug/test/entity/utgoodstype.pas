unit utgoodstype;
{这是注释}
interface
  type
    Rtgoodstype = ^Ttgoodstype;
    [Table('t_goodstype','')]
    Ttgoodstype = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('p_id','')]
    p_id: Integer;    [FieldInfo('state','')]
    state: Integer;    [FieldInfo('icon','')]
    icon: String;   
  end;
implementation