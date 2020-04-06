@echo off

chcp 65001

for %%A IN (%*) DO (
    cls
    echo.%%A:
    echo.
    type "%%A" | more
    pause
)
pause

exit