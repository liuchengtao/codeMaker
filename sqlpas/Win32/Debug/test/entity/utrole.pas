unit utrole;
{这是注释}
interface
  type
    Rtrole = ^Ttrole;
    [Table('t_role','')]
    Ttrole = Record
          [FieldInfo('id','')]
    id: String;
    bz: String;
    name: String;
    remarks: String;   
  end;
implementation