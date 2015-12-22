#!/usr/bin/python2
# coding: utf-8

"""Split MySQL dump of database into single files for each table.

The infile is read only. The beginning of table data is identified by looking
for a special pattern. If the pattern ist not found, no outfile will be written.
Each outfile will start with the header section of the infile end end
with the infiles footer section.

(C) Martin Bless, martin.bless@gmail.com, http://mbless.de, MIT-License.

"""
# splitsql.py - modifications:
# mb 2008-08-19, small changes
# mb 2008-08-12, 2008-08-14

import os
import re
import StringIO
import sys
write = sys.stdout.write

f1name = 'INFILE'
fileExt = '.sql'
folderSuffix = '-TEMP'
fNameExtraInformation = '_some-generated-info.tmp.txt'
sizeHint = 2048 * 10
maxExpectedFooterLen = 1024 * 3
quiet = False
maxTables = None or 0 # testing: max # of output tables

patternLine1 = "--\n"
patternLine2 = r"^-- .*?`(.+?)`$\n"
patternLine2 = r"^-- Table structure for table `(.+?)`$\n"
patternLine3 = "--\n"

# these values are used to create a batch file
fNameShellFile = '_import.sh'
dbHost = '' or 'HOST'
dbUser = '' or 'USER'
dbPassword = '' or 'PASSWORD'
dbDatabase = '' or 'DATABASE'

license = """
The MIT License

Copyright (c) 2008 Martin Bless

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

"""

shortUsage = """
Usage:
  python %s INFILE
  python %s [option]

  option is one of: -h | --help | --license

"""
usage = """
Usage:
    python %s INFILE

The infile is read only. A folder './[infile]%s/' for output is created
if not existing. Each table of infile is written to a single file
named './[infile]%s/[tablename].sql'.

Example:
    mysqldump database [options] >sqldump.sql
    python %s sqldump.sql
    Outfiles created: ./sqldump.sql%s/[tablename].sql

Print license and help:
    python %s --license
    python %s -h | --help

(C) 2008 Martin Bless, martin.bless@gmail.com, http://mbless.de
Published under the MIT-License. See license for details.

"""

if 0 and "this demonstrates the pattern we are looking for":
    pattern = """\
--
-- Table structure for table `demo_table_name`
--
""".replace('\r\n','\n')
    line1, line2, line3, dummy = pattern.split('\n')
    reMatchObj = reCompObj.match(line2 + '\n')
    if reMatchObj:
        tableName = reMatchObj.groups()[0]
        print tableName
    sys.exit()


tableNames = []
tableLengths = []

basename = os.path.basename(sys.argv[0])
usageArgs = (basename,folderSuffix,folderSuffix,basename,folderSuffix,basename,basename)

if len(sys.argv) == 1:
    write(shortUsage % (basename,basename))
    sys.exit(0)

if len(sys.argv) > 2:
    write(shortUsage % (basename,basename))
    sys.exit(1)

f1name = sys.argv[1]
folderName = f1name + folderSuffix

if f1name == '--license':
    write(license)
    sys.exit()

if f1name in ['-h', '--help']:
    write(usage % usageArgs)
    sys.exit()

if not os.path.exists(f1name):
    write("%s not found.\n" % f1name)
    sys.exit(1)

if not os.path.exists(folderName):
    if not quiet:
        write("# creating './%s/'\n" % folderName)
    try:
        os.mkdir(folderName)
    except: # XXX add exception here
        pass
else:
    if not quiet:
        write("# exists: './%s/'\n" % folderName)

if not os.path.exists(folderName):
    write("could not create '%s'\n" % folderName)
    sys.exit(1)

reCompObj = re.compile(patternLine2, re.IGNORECASE | re.MULTILINE | re.UNICODE)

headerText = ""
footerText = ""

# read last lines of file
resetted = False
if 1 and "findFooterText":
    f1 = file(f1name,'rb')
    f1.seek(-maxExpectedFooterLen,os.SEEK_END)
    lines = []
    for line in f1:
        if not line.strip():
            lines.append(line)
            continue
        if line.startswith('/*!') or line.startswith('--'):
            if line.endswith('\r\n'):
                line = '%s\n' % line[:-2]
            lines.append(line)
        else:
            lines = []
            resetted = True
    f1.close()
    if resetted:
        footerText = ''.join(['\n']+lines)
        del lines
    else:
        write('footer seems to be longer than the expected %d bytes\n' % maxExpectedFooterLen)
        sys.exit(1)


threeLines = [None,None,None]
f1 = file(f1name)
if not quiet:
    write('# reading: %s\n' % f1name)
f2 = StringIO.StringIO('w')
while True:
    line = f1.readline(sizeHint)
    if not line:
        line = None
    threeLines.append(line)
    line = threeLines.pop(0)
    if line:
        f2.write(line)

    if (threeLines[0] == patternLine1 and threeLines[2] == patternLine3):
        reMatchObj = reCompObj.match(threeLines[1])
        if reMatchObj:
            tableName = reMatchObj.groups()[0]
            if not tableNames:
                headerText = f2.getvalue()
            else:
                tableLengths.append(f2.tell())
                f2.write(footerText)
            f2.close()
            if maxTables and (len(tableNames) == maxTables):
                break
            tableNames.append(tableName)
            f2name = '%s/%s%s' % (folderName,tableName,fileExt)
            if not quiet:
                write('# writing: %s\n' % f2name)
            f2 = file(f2name,'w')
            f2.write(headerText)
    if threeLines[2] is None:
        # we have EOF, dump rest of buffer
        while threeLines:
            line = threeLines.pop(0)
            if line:
                f2.write(line)
        break
f2.close()
f1.close()
if not quiet:
    write('# Some result information:\n')
    write('# tableNames = %r\n' % tableNames)
    write('# tableLengths = %r\n' % tableLengths)


fileExtraInformation = os.path.join(folderName,fNameExtraInformation)
if not quiet:
    f2 = file(fileExtraInformation,'w')
    f2.close()

if 1 and not quiet:
    f2 = file(fileExtraInformation,'a')
    f2.write('# -----The header we used ---------------- \n')
    f2.write('%s\n' % headerText)
    f2.write('# ---------------------------------------- \n')
    f2.close()

if 1 and not quiet:
    f2 = file(fileExtraInformation,'a')
    f2.write('# -----The footer we used ---------------- \n')
    f2.write('%s\n' % footerText)
    f2.write('# ---------------------------------------- \n')
    f2.close()

if 1 and not quiet and tableNames:
    f2 = file(fileExtraInformation,'a')
    maxLen1 = max([len(e) for e in tableNames])
    maxLen2 = max([len('%d' % e) for e in tableLengths])
    f2.write('# ---- file names and length as python tuple ------ \n')
    f2.write('(\n')
    for tableName,fileLen in zip(tableNames,tableLengths):
        filla = ' ' * max(maxLen1 - len(tableName),0)
        fillb = ' ' * max(maxLen2 - len('%d' % fileLen),0)
        f2.write("    ('%s'%s, %s%-d),\n" % (tableName,filla,fillb,fileLen))
    f2.write(')\n')
    f2.close()

if 1 and not quiet:
    fName = os.path.join(folderName,fNameShellFile)
    f2 = file(fName,'w')
    f2.write('#!/bin/bash\n')
    for tableName in tableNames:
        # mysql -h 127.0.0.1 -u USER -pPASSWORD  DATABASE <%s.sql
        f2.write("mysql -h %s -u %s -p%s  %s <'%s.sql'\n" % (
            dbHost, dbUser, dbPassword, dbDatabase, tableName,))
    f2.close()

if 0 and not quiet:
    # Hhm, why is this necessary?
    # Well, it isn't.
    f1 = file(fileExtraInformation,'rb')
    data = f1.read()
    f1.close()
    data = data.replace('\r\n','\n')
    f2 = file(fileExtraInformation,'wb')
    f2.write(data)
    f2.close()

if not quiet:
    write('# Done.\n')
