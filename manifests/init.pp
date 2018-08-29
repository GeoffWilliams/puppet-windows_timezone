# @summary Set the windows timezone using the `tzutil` command
#
# You must specify the timezone to use in the correct format to the `tz` parameter
# otherwise this class will take no action.
#
# @example Setting the timezone
#   class { "windows_timezone":
#     tz => "New Zealand Standard Time",
#   }
#
# @see https://github.com/GeoffWilliams/puppet-windows_timezone/blob/master/doc/windows_timezones.txt
#
# @see https://stackoverflow.com/a/16656265/3441106
#
# @param tz The timezone to set this node to use.  You must only the names
#   allowed by the `tzutil -l` command.  This has been captured on a Windows
#   2012 VM for your convenience and can be found at /doc/windows_timezones.txt
#   inside this module. The value to use for `tz` is the _second_ line of each
#   entry.
class windows_timezone(
    Optional[String] $tz = undef
) {

  if $tz {
    # must invoke windows command shell directly if we want to use OS pipes, see
    # https://projects.puppetlabs.com/issues/21656
    #
    # tzutil sets the SYSTEM timezone for all users at once. Must use /C to
    # fully match input otherwise the exec will not fire correctly
    exec { "set the windows timezone":
      command => "tzutil /s \"${tz}\"",
      unless  => "cmd /C tzutil /g | findstr /C:\"${tz}\"",
      path    => 'c:\windows\system32',
    }
  }
}
