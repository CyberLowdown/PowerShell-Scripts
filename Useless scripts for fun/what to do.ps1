
   <############################################################
   .SYNOPSIS
   
   This is a playful script. What will you spend your productivity
   on today? Well run this script and we shall see. 

   .DESCRIPTION

   Are you not sure what to do? Do you have trouble deciding between 
   work and streaming? Well this is the script for you!

   ############################################################>

param($StartTime=(get-date),[Parameter(mandatory=0)][datetime]$EndTime)

$RandomComments = 
@(
"A Chip on Your Shoulder 
 Meaning: Being angry about something that happened in the past.", 
 "Head Over Heels
 Meaning: Falling deeply in love with another person.", 
 "Throw In the Towel 
 Meaning: Giving up; to surrender.", 
 "Par For the Course
 Meaning: What you would expect to happen; something normal or common.", 
" A Piece of Cake
 Meaning: A task that is simple to accomplish.", 
 "Hands Down
 Meaning: Anything that's easy or has no difficulty; something that is a certainty.", 
"Right Out of the Gate 
 Meaning: Right from the beginning; to do something from the start.", 
 "Go For Broke 
 Meaning: To risk it all, even if it means losing everything. To go all out.", 
 "Lickety Split 
 Meaning: To go at a quick pace; no delaying!", 
 "Rain on Your Parade 
 Meaning: To spoil someone's fun or plans; ruining a pleasurable moment", 
 "Roll With the Punches 
 Meaning: To tolerate or endure through the unexpected mishappenings you may encounter from time to time.", 
 "Cut To The Chase 
 Meaning: To get to the point, leaving out all of the unnecessary details.", 
 "An Arm and a Leg 
 Meaning: Something that is extremely expensive.", 
 "Quality Time 
 Meaning: Spending time with another to strengthen the relationship.", 
 "High And Dry
 Meaning: To be left behind; abandoned. Being in a helpless situation without a way to recover.", 
" Keep Your Eyes Peeled 
 Meaning: To be watchful; paying careful attention to something.", 
" Keep On Truckin'
 Meaning: To keep going, pressing forward; never stopping.",
 "Fish Out Of Water 
 Meaning: Someone being in a situation that they are unfamiliar or unsuited for.", 
 "Jaws of Life 
 Meaning: Usually this references a tool used by rescuers when they pry or cut open a car to save the occupant.",
 "The Plot Thickens
 Meaning: A situation that has gotten way more serious or interesting due to recent complexities or developments.", 
" Cut The Mustard 
 Meaning: To cut the mustard is to meet a required standard, or to meet expectations.", 
 "Jack of All Trades Master of None 
 Meaning: Having suitable skill in multiple things, but not being an expert in any of them.", 
 "Back to Square One 
 Meaning: To go back to the beginning; back to the drawing board.",
 "Top Drawer 
 Meaning: High quality, exceptional; something that's very valuable.", 
 "If You Can't Stand the Heat, Get Out of the Kitchen
 Meaning: One should discontinue with a task if they are unable to cope with it due to pressure.",
" In a Pickle 
 Meaning: Being in a difficult predicament; a mess; an undesirable situation.",
" Hear, Hear
 Meaning: A shout of agreement, or to draw attention to a speaker.", 
" Love Birds
 Meaning: A pair of people who have a shared love for each other.", 
" A Fool and His Money are Soon Parted
 Meaning: It's easy for a fool to lose his/her money.", 
" Eat My Hat
 Meaning: Having confidence in a specific outcome; being almost sure about something." ,
" Close But No Cigar 
 Meaning: Coming close to a successful outcome only to fall short at the end.", 
" Tug of War
 Meaning: It can refer to the popular rope pulling game or it can mean a struggle for authority.", 
 "Talk the Talk
 Meaning: Supporting what you say, not just with words, but also through action or evidence.", 
" Break The Ice
 Meaning: Breaking down a social stiffness." ,
" Elvis Has Left The Building 
 Meaning: Something that is all over." ,
" Mountain Out of a Molehil 
 Meaning: One who escalates small things and turns them into big problems.", 
" On the Same Page
 Meaning: Thinking alike or understanding something in a similar way with others." ,
" Don't Count Your Chickens Before They Hatch
 Meaning: Do not rely on something you are not sure of." ,
 "Yada Yada
 Meaning: A way to notify a person that what they're saying is predictable or boring." ,
 "On the Ropes
 Meaning: Being in a situation that looks to be hopeless!" 
" Back To the Drawing Board
 Meaning: Starting over again on a new design from a previously failed attempt." ,
 "Greased Lightning
 Meaning: Very fast or quick." ,
 "What Goes Up Must Come Down 
 Meaning: Things that go up must eventually return to the earth due to gravity." ,
 "Jumping the Gun
 Meaning: Something that occurs too early before preparations are ready. Starting too soon." ,
 "Keep Your Shirt On 
 Meaning: Keeping calm. Usually said by someone who is trying to avoid making others upset." ,
 "A Dime a Dozen
 Meaning: Something that is extremely common." ,
 "Elephant in the Room
 Meaning: Ignoring a large, obvious problem or failing to address an issue that stands out in a major way." ,
 "Read 'Em and Weep
 Meaning: Often said by the winner in poker, as the others 'weep' over the loss." ,
 "It's Not Brain Surgery
 Meaning: A task that's easy to accomplish, a thing lacking complexity." ,
 "I Smell a Rat
 Meaning: A feeling that something is not quite right, or awry." ,
 "Quick On the Draw
 Meaning: Performing an action with the greatest of haste.")

function NetflixBinge 
{
param($StartTime=(get-date),[Parameter(mandatory=$true)][datetime]$EndTime)
$timeremaining = $EndTime - $StartTime

Write-Host "Starting Netflix Binge.`n"
Write-Host "Please sit tight and enjoy the show for the next $timeremaining. `n"

#loop
    while ($timeremaining -gt 0)
    {
    $comment = Get-Random -InputObject $RandomComments   
    Write-Host "$comment `n" 
    Start-Sleep -Seconds 10
    $timeremaining = $EndTime - (Get-Date)
    
    }

    "Welp, thats the end of the show. Thank you for watching."
}
function HuluBinge 
{
param($StartTime=(get-date),[Parameter(mandatory=$true)][datetime]$EndTime)
$timeremaining = $EndTime - $StartTime

Write-Host "Starting Hulu Binge.`n"
Write-Host "Please sit tight and enjoy the show for the next $timeremaining. `n"

#loop
    while ($timeremaining -gt 0)
    {
    $comment = Get-Random -InputObject $RandomComments  
    Write-Host "$comment `n"
    Start-Sleep -Seconds 10
    $timeremaining = $EndTime - (Get-Date)
    
    }
    "Welp, thats the end of the show. Thank you for watching."
}
function HBOBinge 
{
param($StartTime=(get-date),[Parameter(mandatory=$true)][datetime]$EndTime)
$timeremaining = $EndTime - $StartTime

Write-Host "Starting HBO Binge.`n"
Write-Host "Please sit tight and enjoy the show for the next $timeremaining. `n"

#loop
    while ($timeremaining -gt 0)
    {
    $comment = Get-Random -InputObject $RandomComments   
    Write-Host "$comment `n"
    Start-Sleep -Seconds 10
    $timeremaining = $EndTime - (Get-Date)
    
    }
    "Welp, thats the end of the show. Thank you for watching."
}
function AmazonPrimeBinge 
{
param($StartTime=(get-date),[Parameter(mandatory=$true)][datetime]$EndTime)
$timeremaining = $EndTime - $StartTime

Write-Host "Starting Amazon Prime Binge.`n"
Write-Host "Please sit tight and enjoy the show for the next $timeremaining. `n"

#loop
    while ($timeremaining -gt 0)
    {
    $comment = Get-Random -InputObject $RandomComments    
    Write-Host "$comment `n"
    Start-Sleep -Seconds 10
    $timeremaining = $EndTime - (Get-Date)

    }
    "Welp, thats the end of the show. Thank you for watching."
}
function StudyTime 
{
param($StartTime=(get-date),[Parameter(mandatory=$true)][datetime]$EndTime)
$timeremaining = $EndTime - $StartTime

Write-Host "Starting Study Time.`n"
Write-Host "Please sit tight and and be productive for the next $timeremaining. `n"

#loop
    while ($timeremaining -gt 0)
    {
    $comment = Get-Random -InputObject $RandomComments  
    Write-Host "$comment `n"  
    Start-Sleep -Seconds 10
    $timeremaining = $EndTime - (Get-Date)
    
    }

    "Welp, I hope you got shit done."
}

$invoke = get-random @(
{(NetflixBinge -StartTime $StartTime -EndTime $EndTime)},
{(HuluBinge -StartTime $StartTime -EndTime $EndTime)},
{(AmazonPrimeBinge -StartTime $StartTime -EndTime $EndTime)},
{(HBOBinge -StartTime $StartTime -EndTime $EndTime)},
{(StudyTime -StartTime $StartTime -EndTime $EndTime)}
) 
Invoke-Command -ScriptBlock $invoke

