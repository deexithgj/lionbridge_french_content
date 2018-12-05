### French Content ###
Zip file and sanitization script for Lionbridge translation file.

The unzipped file does not seem to be any one single encoding standard is some corruption of iso-8859-1 (Latin charset) or windows-1252 (windows superset). 

Script unzips file, replaces corrupted Côte d'voire name and replaces private use unicode hexcodes leftover most likely from [copying and pasting involving Microsoft Word smart quotes](https://superuser.com/questions/199799/vim-shows-strange-characters-91-92)
- fixes corruption of quote characters of latin-1 iso-8859-1 encoding left quote: “ as `â <80> <9C>` in `by clicking`... translation
- removes `^M` contol characters from DOS line endings
- private use hexcodes corresponding to smart quotes single left quote `<91>`, single right quote: `<92>`, double left quote: `<93>`, double right quote: `<94>` 

Some useful resources:
- [look up unicode characters](https://www.charbase.com/)
- [look up unicode and other encoding by hex codes](http://www.ltg.ed.ac.uk/~richard/utf-8.cgi?input=92&mode=hex)
- [unicode debug table](https://www.i18nqa.com/debug/utf8-debug.html)

Includes content for codebases:
 - ClientService
 - Narwhal
 - CxCore
 - Platform (crm, receipt, application/resolution center)
 - Portal
 - Caribou (hardcoded component content)
 - iOS (loc-strings repository)
 - Android (loc-strings repository)
 - MobilePHP

To run:
`./fr_fix_csv.sh`
