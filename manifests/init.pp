# Windows_timezone
#
# Set the windows timezone using the tzutil command
# @see https://stackoverflow.com/a/16656265/3441106
#
# @param tz The timezone to set this node to use.  You must only the names
#   allowed by the `tzutil -l` command.  This has been captured on a Windows
#   2012 VM for your convenience and can be found at /doc/windows_timezones.txt
#   inside this module
class windows_timezone(
    $tz = "UTC",
) {

  # must invoke windows command shell directly if we want to use OS pipes, see
  # https://projects.puppetlabs.com/issues/21656
  exec { "set the windows timezone":
    command => "tzutil /s \"${tz}\"",
    unless  => "cmd /C tzutil /g | findstr \"${tz}\"",
    path    => 'c:\windows\system32',
  }
}
