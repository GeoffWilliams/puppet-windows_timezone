# Windows_timezone
#
# Set the windows timezone using the tzutil command
# @see https://stackoverflow.com/a/16656265/3441106
#
# @param tz The timezone to set this node to use
class windows_timezone(
    $tz = "UTC",
) {
  exec { "set the windows timezone":
    command => "tzutil /s \"${tz}\"",
    unless  => "findstr \"${tz}\"",
    path    => 'c:\windows\system32',
  }
}
