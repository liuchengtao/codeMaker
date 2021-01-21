unit utgoodsunit;
{这是注释}
interface
  type
    Rtgoodsunit = ^Ttgoodsunit;
    [Table('t_goodsunit','')]
    Ttgoodsunit = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('name','')]
    name: String;   
  end;
implementation