#!/bin/bash

find . -type f | grep -v -E "Android|IOS|COS|Web|\.git|target|^\.\/meituan\/" | xargs grep -E "192\.168\.0\.174|192\.168\.0\.188" -l 2>/dev/null > "`date '+%Y%m%d'`"
