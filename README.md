# Script shell example

This script shell is a good starting point to build a bash shell script.

-   Why bash instead of sh ?  
    Though sh is faster and should be prefered for large scale automation scripts,
    Bash has more functionalities and is kinder with humans.

-   Is there a linter for bash scripts ?  
    Yes, use shellcheck to validate your script :

```shellsession
$ shellcheck example.sh

In example.sh line 11:
RED=$(tput setaf 1)
^-^ SC2034: RED appears unused. Verify use (or export if used externally).


In example.sh line 12:
YELLOW=$(tput setaf 3)
^----^ SC2034: YELLOW appears unused. Verify use (or export if used externally).


In example.sh line 13:
GREEN=$(tput setaf 2)
^---^ SC2034: GREEN appears unused. Verify use (or export if used externally).


In example.sh line 14:
BOLD=$(tput bold)
^--^ SC2034: BOLD appears unused. Verify use (or export if used externally).

For more information:
  https://www.shellcheck.net/wiki/SC2034 -- BOLD appears unused. Verify use (...
```
