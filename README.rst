
=================================
How to split an SQLdump by tables
=================================

This is about a Python script that reads a big dump
created by 'mysqldump' and splits it into many files that only
deal with one table each.

See german blogpost ...

SQL-Dump zerlegen
=================

|splitsql.png| SQL-Dumps kommen üblicherweise als Textfile daher. Und haben
häufig die unangenehme Eigenschaft,
riesig zu werden. Dieser Beitrag stellt ein kleines Python-Script vor und zur Verfügung,
mit dem sich der Dump einer MySQL-Datenbank in mehrere Dateien zerlegen lässt, die jeweils
nur noch die Daten einer einzelnen Tabelle enthalten. Eine MySQL-Datenbank mit all ihren
Tabellen lässt sich zum Beispiel so prima exportieren::

   mysqldump --opt -h 127.0.0.1 -u DBUSER -pDBPASSWD DATABASE >dump.sql

Was aber tun, wenn :file:`dump.sql` viel größer als gewünscht ist? Nun, zerlegen wir
die Datei doch in kleinere Häppchen. Das lässt sich per Hand mit einem Editor bewältigen,
ist dann aber schnell Sklavenarbeit und dazu noch fehleranfällig. Dann lieber ein Tool nehmen,
dass diese Arbeit maschinell erledigt. Vermutlich gibt es dieses Tool bereits zuhauf -
ich habe nicht danach gesucht. Wer so ein Tool kennt möge mir doch eine Zeile schreiben.

In meinem Fall hatte ich nicht die große Allround-Lösung im Sinn. Auch habe ich mich nicht
damit beschäftigt, welche syntaktischen Klimmzüge das Programm da bei den Kommentaren im
Dump hinterlässt. Vielmehr habe ich ein Tool geschrieben, dass mir genau die Arbeit abnimmt,
die ich sonst per Hand gemacht hätte: Database-Dump nehmen, jeden Abschnitt daraus, der eine
Tabelle enthält, in eine eigene Datei stecken, die 'tabellenname.sql' heißt, und dafür sorgen,
dass auch hier die Kommentare am Anfang und am Ende der Datei wieder vorhanden sind.

So ist splitsql.py entstanden, ein Python Opensource Programm, das beliebig verwendet werden
darf. Beispieldaten kann man sich hier anschauen. Was Spaß macht: Es lässt sich leicht
modifizieren, und so ist es nicht schwer, ihm beizubringen, zusätzliche Informationen
auszugeben, wie etwa die Vorlage für ein Shellscript oder Texte, die man wieder in den
Quelltext einbauen kann. Viel Spaß!
