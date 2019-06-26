#!/bin/bash

. $HOME/.bash_profile

verify() {
    echo ${PWD}/$1/*
    existing_emulators=$($ANDROID_HOME/tools/emulator -list-avds)
    for emu in ${PWD}/$1/* ; do
        emuname="$(basename $emu)"
        echo $test
        if [[ ! $existing_emulators =~ $emuname ]]; then
            echo "Emulator NOT found: " $emuname;
            create $emuname
        else
            echo "Emulator: $emuname exists!";
        fi
        
        find ~/.android/avd/$emuname.avd -type f -name 'config.ini' -exec bash -c 'echo $0 && echo "hw.lcd.density=240" | tee -a $0 && echo "skin.name=480x800" | tee -a $0 && echo "hw.gpu.enabled=yes"  | tee -a $0 && echo "hw.keyboard=no" | tee -a $0 && cat $0 '  {} \;
    done
}

print_and_execute() {
    echo "sdkmanager $1" # print
    yes | $ANDROID_HOME/tools/bin/sdkmanager "$1" # execute
}

update_system_images() {
    for emu in ${PWD}/$1/* ; do
        emuname="$(basename $emu)"
        echo $test
        if [[ ! $existing_emulators =~ $emuname ]]; then
            download_system_image $emuname
        else
            echo "adv exists: $emuname exists!";
        fi
    done
}

download_system_image(){
    case "$1" in
        "Emulator-Api17-Default")
            print_and_execute "system-images;android-17;default;x86"
        ;;
        "Emulator-Api18-Default")
            print_and_execute "system-images;android-18;default;x86"
        ;;
        "Emulator-Api19-Default")
            print_and_execute "system-images;android-19;default;x86"
        ;;
        "Emulator-Api19-Google")
            print_and_execute "system-images;android-19;google_apis;x86"
        ;;
        "Emulator-Api21-Default")
            print_and_execute "system-images;android-21;default;x86"
        ;;
        "Emulator-Api21-Google")
            print_and_execute "system-images;android-21;google_apis;x86"
        ;;
        "Emulator-Api22-Default")
            print_and_execute "system-images;android-22;default;x86"
        ;;
        "Emulator-Api23-Google")
            print_and_execute "system-images;android-23;default;x86"
        ;;
        "Emulator-Api23-Default")
            print_and_execute "system-images;android-23;default;x86"
        ;;
        "Emulator-Api24-Default")
            print_and_execute "system-images;android-24;default;x86"
        ;;
        "Emulator-Api25-Google")
            print_and_execute "system-images;android-25;google_apis;x86"
        ;;
        "Emulator-Api26-Google")
            print_and_execute "system-images;android-26;google_apis;x86"
        ;;
        "Emulator-Api27-Google")
            print_and_execute "system-images;android-27;google_apis;x86"
        ;;
        "Emulator-Api28-Google")
            print_and_execute "system-images;android-28;google_apis;x86"
        ;;
        *)
            echo $"Usage: $0 {Emulator-Api18-Default
                Emulator-Api19-Default|
                Emulator-Api21-Default|
                Emulator-Api22-Default|
                Emulator-Api23-Default|
                Emulator-Api24-Default|
                Emulator-Api25-Google|
                Emulator-Api26-Google|
                Emulator-Api27-Google|
            Emulator-Api28-Google|all}"
            exit 1
    esac
}

create() {
    case "$1" in
        "Emulator-Api17-Default")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-17;default;x86" -b default/x86 -c 900M -f
        ;;
        "Emulator-Api18-Default")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-18;default;x86" -b default/x86 -c 900M -f
        ;;
        "Emulator-Api19-Default")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-19;default;x86" -b default/x86 -c 900M -f
        ;;
        "Emulator-Api19-Google")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-19;google_apis;x86" -b google_apis/x86 -c 900M -f
        ;;
        "Emulator-Api21-Default")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-21;default;x86" -b default/x86 -c 900M -f
        ;;
        "Emulator-Api21-Google")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-21;google_apis;x86" -b google_apis/x86 -c 900M -f
        ;;
        "Emulator-Api22-Default")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-22;default;x86" -b default/x86 -c 900M -f
        ;;
        "Emulator-Api22-Google")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-22;google_apis;x86" -b google_apis/x86 -c 900M -f
        ;;
        "Emulator-Api23-Default")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-23;default;x86" -b default/x86 -c 2048M -f
        ;;
        "Emulator-Api24-Default")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-24;default;x86" -b default/x86 -c 900M -f
        ;;
        "Emulator-Api25-Google")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-25;google_apis;x86" -b google_apis/x86 -c 900M -f
        ;;
        "Emulator-Api26-Google")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-26;google_apis;x86" -b google_apis/x86 -c 900M -f
        ;;
        "Emulator-Api27-Google")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-27;google_apis;x86" -b google_apis/x86 -c 900M -f
        ;;
        " Emulator-Api28-Google")
            echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n "$1" -k "system-images;android-28;google_apis;x86" -b google_apis/x86 -c 900M -f
        ;;
        all)
            Emulator-Api18-Default
            Emulator-Api19-Default
            Emulator-Api21-Default
            Emulator-Api22-Default
            Emulator-Api23-Default
            Emulator-Api24-Default
            Emulator-Api25-Google
            Emulator-Api26-Google
            Emulator-Api27-Google
            Emulator-Api28-Google
        ;;
        
        *)
            echo $"Usage: $0 {Emulator-Api18-Default
                Emulator-Api19-Default|
                Emulator-Api21-Default|
                Emulator-Api22-Default|
                Emulator-Api23-Default|
                Emulator-Api24-Default|
                Emulator-Api25-Google|
                Emulator-Api26-Google|
                Emulator-Api27-Google|
                Emulator-Api28-Google|all}"
            exit 1
    esac
}

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Provide --app [appName]!"
    exit 1
fi

while [[ $# -gt 0 ]]
do
    key="${1}"
    case ${key} in
        -u|--should_update_system_images)
            update_system_images
            shift # past argument
            shift # past value
        ;;
        --app)
            app="${2}"
            shift # past argument
            shift # past value
        ;;
        *) 
            echo "Unknow option ${1}"
            echo $"Usage: $0 --app [appName] -u|--should_update_system_images"
            exit 1
            shift
        ;;
    esac
done

echo $app
verify $app

. $HOME/.bash_profile
