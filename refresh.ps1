powershell -command "robocopy 'C:\testcase' 'C:\ProgramData\PuppetLabs\code\modules\windows_timezone' /NFL /NDL /NJH /NJS /nc /ns /np /MIR /XD .git fixtures ; exit $LastExitCode"
powershell -command "robocopy 'C:\testcase\spec\fixtures\hieradata' 'C:\spec\fixtures\hieradata' /NFL /NDL /NJH /NJS /nc /ns /np /MIR /XD .git fixtures ; exit $LastExitCode"
powershell -command "copy-item 'C:\testcase\spec\fixtures\hiera.yaml' -destination 'C:\ProgramData\PuppetLabs\puppet\etc\hiera.yaml' ; exit $LastExitCode"
powershell -command "copy-item 'C:\testcase\spec\default_facts.yml' -destination 'C:\ProgramData\PuppetLabs\facter\facts.d\default_facts.yml' ; exit $LastExitCode"
