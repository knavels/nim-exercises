import dmidecode, tables

let sample = """
# dmidecode 3.1
Getting SMBIOS data from sysfs.
SMBIOS 2.6 present.

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
        Vendor: LENOVO
        Version: 29CN40WW(V2.17)
        Release Date: 04/13/2011
        ROM Size: 2048 kB
        Characteristics:
                PCI is supported
                BIOS is upgradeable
                BIOS shadowing is allowed
                Boot from CD is supported
                Selectable boot is supported
                EDD is supported
                Japanese floppy for NEC 9800 1.2 MB is supported (int 13h)
                Japanese floppy for Toshiba 1.2 MB is supported (int 13h)
                5.25"/360 kB floppy services are supported (int 13h)
                5.25"/1.2 MB floppy services are supported (int 13h)
                3.5"/720 kB floppy services are supported (int 13h)
                3.5"/2.88 MB floppy services are supported (int 13h)
                8042 keyboard services are supported (int 9h)
                CGA/mono video services are supported (int 10h)
                ACPI is supported
                USB legacy is supported
                BIOS boot specification is supported
                Targeted content distribution is supported
        BIOS Revision: 1.40
"""

var obj: Table[string, dmidecode.Section]
obj = parseDMI(sample)
for secname, sec in obj:
    echo secname & " with " & $len(sec.props)
    for k, p in sec.props:
        echo "k : " & k & " => " & p.val
        if len(p.items) > 0:
            for i in p.items:
                echo "\t\t I: ", i
