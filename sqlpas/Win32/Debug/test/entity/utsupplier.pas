unit utsupplier;
{这是注释}
interface
  type
    Rtsupplier = ^Ttsupplier;
    [Table('t_supplier','')]
    Ttsupplier = Record
          [FieldInfo('id','')]
    id: String;
    address: String;
    contact: String;
    name: String;
    number: String;
    remarks: String;   
  end;
implementation