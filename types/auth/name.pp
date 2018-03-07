# Match an username or a group name.
#
type AWS_Firewall::Auth::Name = Pattern[/^[a-z][a-z0-9\-]{1,31}$/]
