unit utpurchaselistgoods;
{这是注释}
interface
  type
    Rtpurchaselistgoods = ^Ttpurchaselistgoods;
    [Table('t_purchase_list_goods','')]
    Ttpurchaselistgoods = Record
          [FieldInfo('id','')]
    id: String;
    code: String;
    model: String;
    name: String;
    num: Integer;
    price: String;
    total: String;
    unit: String;
    purchase_list_id: Integer;
    type_id: Integer;
    goods_id: Integer;   
  end;
implementation