# This script is no longer necessary, as we have our in-house themes/academic directory (not a submodule anymore) 

#!/usr/bin/env bash

# Display available updates to Academic.
cd themes/academic
git fetch
git log --pretty=oneline --abbrev-commit --decorate HEAD..origin/master
cd ../../

# Update Academic.
git submodule update --remote --merge
