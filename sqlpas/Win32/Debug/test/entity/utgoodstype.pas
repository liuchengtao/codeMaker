unit utgoodstype;
{这是注释}
interface
  type
    Rtgoodstype = ^Ttgoodstype;
    [Table('t_goodstype','')]
    Ttgoodstype = Record
          [FieldInfo('id','')]
    id: String;
    name: String;
    p_id: Integer;
    state: Integer;
    icon: String;   
  end;
implementation