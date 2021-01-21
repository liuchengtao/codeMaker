unit utoverflowlist;
{这是注释}
interface
  type
    Rtoverflowlist = ^Ttoverflowlist;
    [Table('t_overflow_list','')]
    Ttoverflowlist = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('overflow_date','')]
    overflow_date: String;    [FieldInfo('overflow_number','')]
    overflow_number: String;    [FieldInfo('remarks','')]
    remarks: String;    [FieldInfo('user_id','')]
    user_id: Integer;   
  end;
implementation