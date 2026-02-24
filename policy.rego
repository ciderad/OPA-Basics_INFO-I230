# Conditional Access Control (RBAC)
# --------------------------------

package play

default allow := false

allow := true if {
  is_admin
  is_in_indiana
  is_valid_time
}

is_admin if {
  user := data.users[_]
  user.username == input.username
  user.role == "admin"
}

is_in_indiana if {
  input.state == "IN"
}

is_valid_time if {
  input.hour >= 8
  input.hour <= 20
}