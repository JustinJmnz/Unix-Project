BEGIN { FS=OFS=":" }
NR==1 {
    for (i=4;i<NF;i++) {
        name = substr($i,1,1) "T"
        nr2name[i] = name
        if (!seen[name]++) {
            names[++numNames] = name
        }
    }

    printf "%s", $0
    for (nameNr=1; nameNr<=numNames; nameNr++) {
        printf "%s%s", names[nameNr], OFS
    }
    print ""
    next
}
{
    delete tot
    for (i=4;i<NF;i++) {
        name = nr2name[i]
        tot[name] += $i
    }

    printf "%s", $0
    for (nameNr=1; nameNr<=numNames; nameNr++) {
        printf "%s%s", tot[names[nameNr]], OFS
    }
    print ""
} 
