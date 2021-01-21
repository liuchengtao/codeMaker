unit utpurchaselistgoods;
{这是注释}
interface
  type
    Rtpurchaselistgoods = ^Ttpurchaselistgoods;
    [Table('t_purchase_list_goods','')]
    Ttpurchaselistgoods = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('code','')]
    code: String;    [FieldInfo('model','')]
    model: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('num','')]
    num: Integer;    [FieldInfo('price','')]
    price: String;    [FieldInfo('total','')]
    total: String;    [FieldInfo('unit','')]
    unit: String;    [FieldInfo('purchase_list_id','')]
    purchase_list_id: Integer;    [FieldInfo('type_id','')]
    type_id: Integer;    [FieldInfo('goods_id','')]
    goods_id: Integer;   
  end;
implementation