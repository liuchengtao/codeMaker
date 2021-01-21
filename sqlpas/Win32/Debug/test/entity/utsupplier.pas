unit utsupplier;
{这是注释}
interface
  type
    Rtsupplier = ^Ttsupplier;
    [Table('t_supplier','')]
    Ttsupplier = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('address','')]
    address: String;    [FieldInfo('contact','')]
    contact: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('number','')]
    number: String;    [FieldInfo('remarks','')]
    remarks: String;   
  end;
implementation