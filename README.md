# RoboticTools

## Paket in tar.gz packen
Wechseln Sie in das Verzeichnis, in dem sich der Ordner robotictools befindet und führen Sie in der Kommandozeile den Befehl

       tar cfvz robotictools.tar.gz robotictools

aus.     

## Installation in Octave
1. Starten Sie Octave (Octave CLI oder Octave GUI)
2. Wechseln Sie in das Verzeichnis, in dem sich das tar.gz-File des Paketes befindet.
3. Geben Sie im Befehlsfenster (Octave GUI) oder in der Konsole (Octave CLI) das Kommando

       pkg install robotictools

   ein und führen sie es aus.
4. Um das Paket verwenden zu können, muss es in Octave noch geladen werden. Führen Sie dazu das Kommando

       pkg load robotictools

   aus.

## Hinweise zur Nutzung des Paketes

1. Das Quaternion q = 1+2i+2j+3k wird durch

       q = quaternion ([1, 2, 3, 4])

    erzeugt.  
