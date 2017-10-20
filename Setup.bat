echo make build directory and change to be in the correct folder to run the batch file, then compiling.
if not exist "_build_files" mkdir _build_files
cd Build
call compile_ahk_offline_plugin.bat
cd ..

echo Making a link on the C drive. This may need tweaking.
if not exist "C:\AppURL\" mkdir C:\AppURL
copy "_build_files\appurl.exe" "C:\AppURL\appurl.exe"

timeout 10