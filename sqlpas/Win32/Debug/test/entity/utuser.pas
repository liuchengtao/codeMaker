unit utuser;
{这是注释}
interface
  type
    Rtuser = ^Ttuser;
    [Table('t_user','')]
    Ttuser = Record
          [FieldInfo('id','')]
    id: String;
    bz: String;
    password: String;
    true_name: String;
    user_name: String;
    remarks: String;   
  end;
implementation