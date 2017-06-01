# fastblast: functions for Mothur fasta files and BLAST
Marcus W. Beck, beck.marcus@epa.gov  

[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/fawda123/fastablast?branch=master&svg=true)](https://ci.appveyor.com/project/fawda123/fastablast)
[![Travis-CI Build Status](https://travis-ci.org/fawda123/fastablast.svg?branch=master)](https://travis-ci.org/fawda123/fastablast)

This is the development repository for the fastablast package. Functions within this package can be used to format [Mothur](https://www.mothur.org/) fasta files for use with Blast and retrieval of information from [Blast](https://blast.ncbi.nlm.nih.gov/Blast.cgi) output files.

## Installing the package

The development version of this package can be installed as follows:


```r
install.packages('devtools')
library(devtools)
install_github('fawda123/fastblast')
library(fastblast)
```


## Using the functions

Format a fasta file for BLAST with `formfst`:


```r
# path to input file
flin <- 'inst/fst_ex.fasta'

# execute
formfst(flin)
```

```
##  [1] ">Otu000001"                                                                                                                                                                                                                                                                                                                                                                                                               
##  [2] "GG-T-A----C-ACA-C-C-G-C-CC--GT-C---G---CA--C-CT-AC-CG-A-TT--GAA-T-GG-TC-CG-G--T-GA--A--G-A-CT--C--G-G-G-A------T-T-GT-G-AG----------TG--TT------G---CC-----T--------------------------------------------T-CA-C------------------------------------------T---G--G-T--G--AT-G----------------------------------------T--T--T-GC--A--A----GA-A--C--------T--T-G-T--C--TA--A-A--C-C----T-T--A-T-CA-TT-T---AG-A-GG-A-A---GG-TG"
##  [3] ">Otu000002"                                                                                                                                                                                                                                                                                                                                                                                                               
##  [4] "GG-T-A----C-ACA-C-C-G-C-CC--GT-C---G---CT--A-TT-AC-CG-A--C--GAA-T-TA-TT-TA-G--T-GA--G--A-T-CT--C--T-G-G-AG-----G-T-GA-A-CA----------CG--AC------GG--TG-----TT-------------------------------------------T-CG-G-----------------------------------------CA---C--TGTT-G--TT-G----------------------------------------C--T--T-CG--C--C----AA-A--G--------T--T-G-A--T--CA--A-A--C-T----T-G--A-T-GA-TT-T---GG-A-GG-A-A---AT-AA"
##  [5] ">Otu000003"                                                                                                                                                                                                                                                                                                                                                                                                               
##  [6] "GG-T-A----C-ACA-C-C-G-C-CC--GT-C---G---CT--T-TT-AC-CG-A-TT--GAG-T-GT-TC-AG-G--T-GA--G--T-C-TT--C--T-T-G-A------T-A-GT-T---------------------------------------------------------------------------------G-CA-A-----------------------------------------------------------------------------------------------------------A-AT--T--A----AA-A--A--------T--T-A-A--A--CA--A-A--C-C----T-T--A-G-CA-CT-T---AG-A-GG-A-A---AA-AG"
##  [7] ">Otu000004"                                                                                                                                                                                                                                                                                                                                                                                                               
##  [8] "GG-T-A----C-ACA-C-C-G-C-CC--GT-C---G---CT--C-CT-AC-CG-A-TT--GGG-T-GT-GC-TG-G--T-GA--A--G-T-GT--T--C-G-G-A------T-T-GG-A-GG----------CGT-GC------TG--GT-----G--------------------------------------------G-TT-C------------------------------------------C---A--CTA--G--CC-G----------------------------------------C--T--T-TC--G--A----GA-A--G--------T--T-C-A--T--TA--A-A--C-C----C-T--C-C-CA-CC-T---AG-A-GG-A-A---GG-AG"
##  [9] ">Otu000005"                                                                                                                                                                                                                                                                                                                                                                                                               
## [10] "GG-T-A----C-ACA-C-C-G-C-CC--GT-C---G---CA--C-CT-AC-CG-A-TT--GAA-T-GG-TC-CG-G--T-GA--A--G-C-CT--C--G-G-G-A------T-T-GT-G-AC----------GA--TT------TC--CC-----T--------------------------------------------T-TA-T------------------------------------------T---G--GGA--G--GT-T----------------------------------------G--T--T-GC--G--A----GA-A--C--------T--T-G-T--C--TA--A-A--C-C----T-T--A-T-CA-TT-T---AG-A-GG-A-A---GG-TG"
```

Save the file:


```r
# file name
flout <- 'out.txt'

# execute
formfst(flin, flout)
```

Retrieve relevant info from BLAST file with `formbls`:


```r
# path to input file
flin <- 'inst/bls_ex.txt'

# execute
formbls(flin)
```

```
##          otu   sequence
## 1  Otu000001 LC037442.1
## 2  Otu000001 KJ961664.1
## 3  Otu000001 KJ961663.1
## 4  Otu000001 KJ011666.1
## 5  Otu000001 KJ011665.1
## 6  Otu000001 KJ011659.1
## 7  Otu000001 KJ011658.1
## 8  Otu000001 KJ011655.1
## 9  Otu000001 KJ011654.1
## 10 Otu000001 KJ011653.1
## 11 Otu000002 AB704954.1
## 12 Otu000002 KC177280.1
## 13 Otu000002   X99212.1
## 14 Otu000002 AY821866.1
## 15 Otu000002 AJ586561.1
## 16 Otu000002 AB704953.1
## 17 Otu000002 LN833602.1
## 18 Otu000002 AB704950.1
## 19 Otu000002 AB704948.1
## 20 Otu000002 AB704958.1
## 21 Otu000003 KF524419.1
## 22 Otu000003 KF524413.1
## 23 Otu000003 KF524385.1
## 24 Otu000003 KF524384.1
## 25 Otu000003 KF524376.1
## 26 Otu000003 GU187050.1
## 27 Otu000003 GU586185.1
## 28 Otu000003 AF401526.1
## 29 Otu000003 AF429894.1
## 30 Otu000003 KF524417.1
## 31 Otu000004 KM020182.1
## 32 Otu000004 KM020163.1
## 33 Otu000004 KM020160.1
## 34 Otu000004 FN824399.1
## 35 Otu000004 AF182820.1
## 36 Otu000004 FN824398.1
## 37 Otu000004 KC145436.1
## 38 Otu000004 FN824397.1
## 39 Otu000004 EF024750.1
## 40 Otu000004 EF024307.1
## 41 Otu000005 KJ961709.1
## 42 Otu000005 KJ961707.1
## 43 Otu000005 KJ961706.1
## 44 Otu000005 KJ961699.1
## 45 Otu000005 KJ961698.1
## 46 Otu000005 KJ961695.1
## 47 Otu000005 KJ961693.1
## 48 Otu000005 KJ961692.1
## 49 Otu000005 KJ961691.1
## 50 Otu000005 KJ961688.1
##                                                    descrip score_bits
## 1    Gomphonema parvulum gene for 18S ribosomal RNA, pa...        226
## 2    Gomphonema sp. 117 18S ribosomal RNA gene, partial...        226
## 3    Gomphonema sp. 12 18S ribosomal RNA gene, partial ...        226
## 4    Gomphonema subclavatum strain FD108 18S ribosomal ...        226
## 5    Gomphonema subclavatum strain FD98 18S ribosomal R...        226
## 6    Gomphonema parvulum strain FD240 18S ribosomal RNA...        226
## 7    Gomphonema intricatum strain FD383 18S ribosomal R...        226
## 8    Gomphonema dichotomum strain FD288 18S ribosomal R...        226
## 9    Gomphonema carolinense strain FD285 18S ribosomal ...        226
## 10   Gomphonema brebissonii strain FD373 18S ribosomal ...        226
## 11   Tanytarsus sp. ent10 genes for 18S rRNA, ITS1 and ...        193
## 12   Chironomus tepperi 18S ribosomal RNA gene, partial...        158
## 13 Chironomus tentans partial 18S rRNA gene, 5.8S rRNA ...        158
## 14   Dicrotendipes fumidus 18S ribosomal RNA gene, part...        152
## 15   Acricotopus lucens partial 18S rRNA gene, clone Al...        152
## 16   Polypedilum tamanigrum genes for 18S rRNA, ITS1 an...        137
## 17   Clunio marinus genomic DNA sequence contains 18S r...        132
## 18   Polypedilum cultellatum genes for 18S rRNA, ITS1 a...        132
## 19   Paraborniella tonnoiri genes for 18S rRNA, ITS1 an...        126
## 20   Paratanytarsus grimmii genes for 18S rRNA, ITS1 an...        124
## 21   Vorticella campanula isolate Whpop4 18S ribosomal ...        189
## 22   Vorticella cf. campanula isolate Dupop 18S ribosom...        189
## 23   Vorticella campanula isolate Qdpop2 18S ribosomal ...        189
## 24   Vorticella campanula isolate Qdpop1 18S ribosomal ...        189
## 25   Vorticella campanula isolate Gepop 18S ribosomal R...        189
## 26   Vorticella sp. SP-2009-3 18S ribosomal RNA gene, p...        189
## 27   Vorticella sp. 18 PPS-2010 18S ribosomal RNA gene,...        189
## 28   Ophrydium versatile small subunit ribosomal RNA ge...        189
## 29   Ophrydium versatile 18S ribosomal RNA gene, partia...        189
## 30   Vorticella campanula isolate Qdpop3 18S ribosomal ...        183
## 31   Schizomeris leibleinii strain SAG 42.96 18S riboso...        215
## 32   Schizomeris leibleinii strain SAG 44.84 18S riboso...        215
## 33   Schizomeris leibleinii strain SAG 24.88 18S riboso...        215
## 34   Schizomeris leibleinii partial 18S rRNA gene, cult...        215
## 35   Schizomeris leibleinii strain UTEXLB1228 18S ribos...        196
## 36   Aphanochaete elegans partial 18S rRNA gene, cultur...        176
## 37   Sphaeropleales sp. KF-2013d strain SAG 2265 18S ri...        171
## 38   Aphanochaete repens partial 18S rRNA gene, culture...        171
## 39   Eimeriidae environmental sample clone Elev_18S_124...        171
## 40   Eimeriidae environmental sample clone Elev_18S_713...        171
## 41   Eunotia sp. 63 18S ribosomal RNA gene, partial seq...        230
## 42   Eunotia sp. 62 18S ribosomal RNA gene, partial seq...        230
## 43   Eunotia sp. 60 18S ribosomal RNA gene, partial seq...        230
## 44   Eunotia sp. 30 18S ribosomal RNA gene, partial seq...        230
## 45   Eunotia sp. 11 18S ribosomal RNA gene, partial seq...        230
## 46   Eunotia sp. 18 18S ribosomal RNA gene, partial seq...        230
## 47   Eunotia sp. 56 18S ribosomal RNA gene, partial seq...        230
## 48   Eunotia sp. 116 18S ribosomal RNA gene, partial se...        230
## 49   Eunotia sp. 28 18S ribosomal RNA gene, partial seq...        230
## 50   Eunotia sp. 5 LKM-2015 18S ribosomal RNA gene, par...        230
##    e_value identities  gaps
## 1    9e-56    122/122 0/122
## 2    9e-56    122/122 0/122
## 3    9e-56    122/122 0/122
## 4    9e-56    122/122 0/122
## 5    9e-56    122/122 0/122
## 6    9e-56    122/122 0/122
## 7    9e-56    122/122 0/122
## 8    9e-56    122/122 0/122
## 9    9e-56    122/122 0/122
## 10   9e-56    122/122 0/122
## 11   9e-46    104/104 0/104
## 12   3e-35    114/128 1/128
## 13   3e-35    114/128 1/128
## 14   2e-33    114/129 3/129
## 15   2e-33    113/128 1/128
## 16   4e-29     95/105 1/105
## 17   2e-27    110/129 2/129
## 18   2e-27     93/104 0/104
## 19   1e-25     94/106 3/106
## 20   3e-25      82/89  2/89
## 21   1e-44    102/102 0/102
## 22   1e-44    102/102 0/102
## 23   1e-44    102/102 0/102
## 24   1e-44    102/102 0/102
## 25   1e-44    102/102 0/102
## 26   1e-44    102/102 0/102
## 27   1e-44    102/102 0/102
## 28   1e-44    102/102 0/102
## 29   1e-44    102/102 0/102
## 30   6e-43    101/102 0/102
## 31   2e-52    122/125 0/125
## 32   2e-52    122/125 0/125
## 33   2e-52    122/125 0/125
## 34   2e-52    122/125 0/125
## 35   7e-47    106/106 0/106
## 36   9e-41    117/127 4/127
## 37   4e-39    116/127 4/127
## 38   4e-39    115/126 2/126
## 39   4e-39    115/126 2/126
## 40   4e-39    115/126 2/126
## 41   7e-57    124/124 0/124
## 42   7e-57    124/124 0/124
## 43   7e-57    124/124 0/124
## 44   7e-57    124/124 0/124
## 45   7e-57    124/124 0/124
## 46   7e-57    124/124 0/124
## 47   7e-57    124/124 0/124
## 48   7e-57    124/124 0/124
## 49   7e-57    124/124 0/124
## 50   7e-57    124/124 0/124
```

Save the file:


```r
# file name
flout <- 'out.txt'

# execute
formbls(flin, flout)
```

