unit utgoods;
{这是注释}
interface
  type
    Rtgoods = ^Ttgoods;
    [Table('t_goods','')]
    Ttgoods = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('code','')]
    code: String;    [FieldInfo('inventory_quantity','')]
    inventory_quantity: Integer;    [FieldInfo('min_num','')]
    min_num: Integer;    [FieldInfo('model','')]
    model: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('producer','')]
    producer: String;    [FieldInfo('purchasing_price','')]
    purchasing_price: String;    [FieldInfo('remarks','')]
    remarks: String;    [FieldInfo('selling_price','')]
    selling_price: String;    [FieldInfo('unit','')]
    unit: String;    [FieldInfo('type_id','')]
    type_id: Integer;    [FieldInfo('state','')]
    state: Integer;    [FieldInfo('last_purchasing_price','')]
    last_purchasing_price: String;   
  end;
implementation