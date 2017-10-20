@echo off
rem This is designed to compile the application and set up the appropriate systems for it to run.
rem The application will be placed on the C drive.
rem ASSUMPTION: You have the C: drive as your primary drive.

echo == [ Cleaning ]
cd Build
call clean_project.bat
cd ..

echo.
echo == [ Compiling ]
::if not exist "_build_files" mkdir _build_files THIS LINE IS COMMENTED OUT
mkdir _build_files
cd Build
call compile_ahk_offline_plugin.bat
cd ..

echo.
echo == [ Moving application to C:\Appurl\ ]
if not exist "C:\AppURL\" mkdir C:\AppURL
copy "_build_files\appurl.exe" "C:\AppURL\appurl.exe"

echo.
echo == [ Merging Registry ]
cd Build
call call merge_registry_key.bat
cd ..

echo.
echo == [ Complete. Exiting... ]
timeout 10
