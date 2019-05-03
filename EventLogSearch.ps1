<#
.Synopsis
Simple PowerShell Script to filter through event logs. 
Written by John A. [L0wd0wN]

.Description
You can Search through the logs by ID,LogName,Event Count, Date Ranges, and Event Log Level. 

-EventId <id1,id2,id3,..> will search for specified event id. 
-LogName <Logname1,Logname2,..> Will search only the specified log name. Default is Application,System, and Security. 


.Example
.
searches for all logs within last 7 days with a level of 1 (Critical)

EventLogSearch.ps1 -level 1

.Example
.
Searches the Application Log between the 04/28/19 at 12:00 AM through 04/30/19 at 10:00 AM for Events matching machine name localhost. 

EventLogSearch.ps1 -LogName Application -StartDate "04/28/19 00:00:00 AM" -EndDate "04/30/19 10:00:00 AM" -ComputerName localhost

.Example
.
Searches from 05/01/19 12:00 AM through Current date/time for events 4624 and 15

EventLogSearch.ps1 -StartDate "05/01/19 00:00:00 AM" -eventid 4624,15

.Example
.
Searches all logs at default search settings and exports it to CSV file in default location c:\LogSearch\log

.\EventLogSearch.ps1 -LogName Application -FullEventDetail -ExportCSV 

.Example
.
This will search security logs between the specified time for critical,error,and warning and output to gridview
.\EventLogSearch.ps1 -StartDate "04/30/19 10:00:00 AM" -EndDate "04/30/19 10:30:00 AM" -LogName Security -visual



#>

 Param
(
[parameter(ParameterSetName="ID")]$eventid,
$LogName=("Application","Security","System"),
$ComputerName="localhost",
[Parameter(HelpMessage="1=Critical  2=Error  3=Warning  4=Information  5=Verbose")]$Level=(1,2,3,4,5),
[Parameter(HelpMessage="Integer")][int]$EventCount,
[Parameter(HelpMessage='Enter enclosed in double qutes in the following format:  "MM/DD/YY hh:mm:ss AM|PM" The default is seven days back.')][System.DateTime]$StartDate=(Get-Date).Adddays(-7),
[Parameter(HelpMessage='Enter enclosed in double qutes in the following format:  "MM/DD/YY hh:mm:ss AM|PM" The default is current date/time.')][System.DateTime]$EndDate=(Get-Date),
[switch]$FullEventDetail,
[switch]$ExportCSV,
[switch]$ExportXML,
$Path='c:\LogSearch\log',
[switch]$Visual
)



function recent-events-ID 
{
    Param
        (
            [parameter(ParameterSetName="ID")]$eventid,
            $LogName=("Application","Security","System"),
            $ComputerName="localhost",
            [Parameter(HelpMessage="1=Critical  2=Error  3=Warning  4=Information  5=Verbose")]$Level=(1,2,3,4,5),
            [Parameter(HelpMessage="Integer")][int]$EventCount,
            [Parameter(HelpMessage='Enter enclosed in double qutes in the following format:  "MM/DD/YY hh:mm:ss AM|PM" The default is seven days back.')][System.DateTime]$StartDate=(Get-Date).Adddays(-7),
            [Parameter(HelpMessage='Enter enclosed in double qutes in the following format:  "MM/DD/YY hh:mm:ss AM|PM" The default is current date/time.')][System.DateTime]$EndDate=(Get-Date),
            [switch]$FullEventDetail
        )

           
     if($FullEventDetail -and $EventCount -and $eventid)
     {
         Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;ID=$eventid;Level=$Level} -MaxEvents $EventCount -ComputerName $ComputerName | 
         select-object -property timecreated,id,leveldisplayname,level,message|format-list -Property TimeCreated,ID,leveldisplayname,level,message
     }
         elseif($FullEventDetail -and $EventCount)
         {
             Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;Level=$Level} -MaxEvents $EventCount -ComputerName $ComputerName | 
             select-object -property timecreated,id,leveldisplayname,level,message|format-list -Property TimeCreated,ID,leveldisplayname,level,message 
     
         }
             elseif($FullEventDetail -and $Eventid)
             {
                 Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;ID=$eventid;Level=$Level} -ComputerName $ComputerName | 
                 select-object -property timecreated,id,leveldisplayname,level,message|format-list -Property TimeCreated,ID,leveldisplayname,level,message 
             }
                 elseif($FullEventDetail)
                 {
                     Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;Level=$Level} -ComputerName $ComputerName |
                     select-object -property timecreated,id,leveldisplayname,level,message|format-list -Property TimeCreated,ID,leveldisplayname,level,message
                 }
                     elseif($EventCount -and $EventID)
                     {
                         Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;ID=$eventid;Level=$Level} -MaxEvents $EventCount -ComputerName $ComputerName | 
                         select-object -property timecreated,id,level,message
                     }
                         elseif($EventCount)
                         {
                             Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;Level=$Level} -MaxEvents $EventCount -ComputerName $ComputerName | 
                            select-object -property timecreated,id,level,message
                         }
                             elseif($EventID)
                             {
                                 Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;ID=$eventid;Level=$Level} -ComputerName $ComputerName | 
                                 select-object -property timecreated,id,level,message
                             }
                                 else
                                 {
                                     Get-WinEvent -FilterHashtable @{LogName=$LogName;StartTime=$StartDate;EndTime=$EndDate;Level=$Level} -ComputerName $ComputerName | 
                                     select-object -property timecreated,id,level,message
                                 }
}
if($ExportCSV -or $ExportXML)
{
    if($Path="c:\LogSearch\log")
    {    
        New-Item -ItemType directory -ErrorAction SilentlyContinue -Path c:\LogSearch
    }
}


if($FullEventDetail -and $ExportCSV)
{
recent-events-ID -eventid $eventid -LogName $LogName -StartDate $StartDate -EndDate $EndDate -ComputerName $ComputerName -level $level -EventCount $EventCount -FullEventDetail | Export-Csv -Path $path 
}
elseif($FullEventDetail -and $ExportXML)
{
recent-events-ID -eventid $eventid -LogName $LogName -StartDate $StartDate -EndDate $EndDate -ComputerName $ComputerName -level $level -EventCount $EventCount -FullEventDetail | Export-Csv -Path $path 
}
elseif($FullEventDetail -and $Visual)
{
recent-events-ID -eventid $eventid -LogName $LogName -StartDate $StartDate -EndDate $EndDate -ComputerName $ComputerName -level $level -EventCount $EventCount -FullEventDetail |Out-GridView
}
elseif($Visual)
{
recent-events-ID -eventid $eventid -LogName $LogName -StartDate $StartDate -EndDate $EndDate -ComputerName $ComputerName -level $level -EventCount $EventCount |Out-GridView
}
elseif($FullEventDetail)
{
recent-events-ID -eventid $eventid -LogName $LogName -StartDate $StartDate -EndDate $EndDate -ComputerName $ComputerName -level $level -EventCount $EventCount -FullEventDetail
}
else
{
recent-events-ID -eventid $eventid -LogName $LogName -StartDate $StartDate -EndDate $EndDate -ComputerName $ComputerName -level $level -EventCount $EventCount
}