unit utcustomer;
{这是注释}
interface
  type
    Rtcustomer = ^Ttcustomer;
    [Table('t_customer','1314')]
    Ttcustomer = Record
          [FieldInfo('id','')]
    id: String;
    address: String;
    contact: String;
    name: String;
    number: String;
    remarks: String;   
  end;
implementation