##Usage##
1. Run generate-commands.sql and export the result into as a excel file.
2. Copy the content of last column in all rows and save them as a new shell script file, let's say we save them as run-commands.sh
3. execute run-commands.sh as os user (e.g applmgr) on application tier to generate all target forms' doc file(format: <FORM_NAME>.txt)
4. run extract-result.sh to go over all doc files and get the result.
