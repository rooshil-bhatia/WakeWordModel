@echo off

REM Check if Python is installed
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Python is not installed. Please install Python and try again.
    exit /b 1
)

REM Check if virtual environment exists
IF EXIST venv (
    echo Virtual environment already exists.
    REM Activate the virtual environment
    echo Activating virtual environment...
    call venv\Scripts\activate

    REM Check if the required libraries are installed
    echo Verifying installed libraries...
    pip check >nul 2>&1
    IF ERRORLEVEL 1 (
        echo Some libraries are missing or outdated. Installing missing libraries...
        pip install -r requirements.txt
    ) ELSE (
        echo All required libraries are already installed.
    )
) ELSE (
    REM Create a virtual environment named venv
    echo Creating virtual environment...
    python -m venv venv

    REM Activate the virtual environment
    echo Activating virtual environment...
    call venv\Scripts\activate

    REM Check if requirements.txt exists
    IF NOT EXIST requirements.txt (
        echo requirements.txt not found. Please make sure it exists in the current directory.
        exit /b 1
    )

    REM Install libraries from requirements.txt
    echo Installing libraries from requirements.txt...
    pip install -r requirements.txt
)

REM Create a folder named audio_data
IF NOT EXIST audio_data (
    echo Creating folder audio_data...
    mkdir audio_data
) ELSE (
    echo Folder audio_data already exists.
)

REM Create a folder named background_sound
IF NOT EXIST background_sound (
    echo Creating folder background_sound...
    mkdir background_sound
) ELSE (
    echo Folder background_sound already exists.
)

REM Create a folder named final_audio_data_csv
IF NOT EXIST final_audio_data_csv (
    echo Creating folder final_audio_data_csv...
    mkdir final_audio_data_csv
) ELSE (
    echo Folder final_audio_data_csv already exists.
)




echo Setup complete.
echo Virtual environment is active. You can now use the command prompt.
echo 1) Prepare Data
echo 2) pre process data
echo 3) train data
echo 4) predictions 
cmd /k
