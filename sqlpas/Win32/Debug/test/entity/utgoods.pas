unit utgoods;
{这是注释}
interface
  type
    Rtgoods = ^Ttgoods;
    [Table('t_goods','')]
    Ttgoods = Record
          [FieldInfo('id','')]
    id: String;
    code: String;
    inventory_quantity: Integer;
    min_num: Integer;
    model: String;
    name: String;
    producer: String;
    purchasing_price: String;
    remarks: String;
    selling_price: String;
    unit: String;
    type_id: Integer;
    state: Integer;
    last_purchasing_price: String;   
  end;
implementation