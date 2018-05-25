# Windows_timezone
#
# Set the windows timezone using the tzutil command
# @see https://stackoverflow.com/a/16656265/3441106
#
# @param tz The timezone to set this node to use.  You must only the names
#   allowed by the `tzutil -l` command.  This has been captured on a Windows
#   2012 VM for your convenience and can be found at /doc/windows_timezones.txt
#   inside this module. The value to use for `tz` is the _second_ line of each
#   entry.
class windows_timezone(
    $tz = "UTC",
) {

  # must invoke windows command shell directly if we want to use OS pipes, see
  # https://projects.puppetlabs.com/issues/21656
  # 
  # tzutil sets the SYSTEM timezone for all users at once. Must use /X to 
  # fully match input otherwise the exec will not fire correctly
  exec { "set the windows timezone":
    command => "tzutil /s \"${tz}\"",
    unless  => "cmd /C tzutil /g | findstr /X \"${tz}\"",
    path    => 'c:\windows\system32',
  }
}
