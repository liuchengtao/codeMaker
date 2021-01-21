unit utcustomer;
{这是注释}
interface
  type
    Rtcustomer = ^Ttcustomer;
    [Table('t_customer','1314')]
    Ttcustomer = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('address','')]
    address: String;    [FieldInfo('contact','')]
    contact: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('number','??')]
    number: String;    [FieldInfo('remarks','')]
    remarks: String;   
  end;
implementation