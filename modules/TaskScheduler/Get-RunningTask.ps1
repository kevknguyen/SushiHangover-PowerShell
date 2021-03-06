function Get-RunningTask
{
    <#
    .Synopsis
        Gets the tasks currently running on the system
    .Description
        A Detailed Description of what the command does
    .Example
        Get-RunningTask
    #>
    param(
    #The name of the task.  By default, all running tasks are shown
    $Name = "*",

    # If this is set, hidden tasks will also be shown.  
    # By default, only tasks that are not marked by Task Scheduler as hidden are shown.
    [Switch]
    $Hidden,    
    
    # The name of the computer to connect to.
    $ComputerName,
    
    # The credential used to connect
    [Management.Automation.PSCredential]
    $Credential
    )        
    
    process {
        $scheduler = Connect-ToTaskScheduler -ComputerName $ComputerName -Credential $Credential        
        if ($scheduler -and $scheduler.Connected) {
            $scheduler.GetRunningTasks($Hidden -as [bool]) | Where-Object { 
                $_.Path -like $Name -or 
                (Split-Path $_.Path -Leaf) -like $name
            }
        }
    }    
} 
 
