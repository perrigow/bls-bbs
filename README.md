# BLS to Bowling Brackets / Sidepots
Helper script for converting BLS rosters into a Bowling Brackets / Sidepots
(B*BS) compatible import file.

The script is written as a Windows batch file. It takes in a weekly
report from BLS and a Regulars file to produce a B*BS compatible CSV (comma
separated value) file.

The script performs the following:
* Removes the bk (book avg indicator) from the beginning of average
* Sets the team to '0' for subs, those not in the Requlars file (see below)
* Removes next weeks lane assignment for subs

BLS - developed by CDE Software, https://www.cdesoftware.com/.

Bowling Brackets / Sidepots - developed by Better Office Business Systems -
Robert Valentino, https://www.bowlingbrackets.com/.

---

## Requirements
* BLS Weekly Report
* Regulars file

---

## BLS Configuration
1. Open League in BLS
2. Click 'Reports' -> 'View & Print More Reports'
3. Select a user defined report on the left and modify it
4. Click 'Change Style of This Report' button
5. I Have 'More Bowler Styles' -> 'Bowler Style #41' selected
6. Update report to include the following columns (in order):
    * Name (First Last)
    * Bowler's Team Number
    * Bowler's Sex
    * Average
    * Lane Number Next Week
7. Options:
    * Spacing: Narrow
    * Headings: Small
    * Data Size: Small
    * Columns: 1

---

## Produce BLS Weekly Report
1. Run Report
2. Click 'Export' -> 'Various Exports'
3. Configure Export:
    * Name: name of report, must match txtfile in script
    * File Type and Extension: *.TXT - text file
    * File Format: Comma and Quote Delimited
    * Export Drive and Directory (update to location of script and
    Regulars.txt file)
4. Click 'Export'
5. Click 'Ok' to close the dialog
6. Click 'Done'

---

## Update default Regulars.txt file
This file will need to be updated/replaced with a list of your regular bowlers.
This file in necessary to reset the team number and lane assignment for subs.

---

## Script Configuration
Edit the variables in the fix_sidepots.cmd script to match your environment.
* txtfile - The weekly report from BLS, a TXT file of quoted values
* regulars - The regulars file, a text file list of regular bowlers
* csvfile - The resulting file, a B*BS compatible CSV file

---

## Example
The script can be run a number of ways, one being to double-click on the
fix_sidepots.cmd

```
Run 'fix_sidepots.cmd' in Command Prompt
```
```
Run '.\fix_sidepots.cmd' in Windows PowerShell
```