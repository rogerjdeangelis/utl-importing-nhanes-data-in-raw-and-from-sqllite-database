# utl-importing-nhanes-data-in-raw-and-from-sqllite-database
Importing nhanes data in raw and from sqllite relational database 
   %let pgm=utl-importing-nhanes-data-in-raw-and-from-sqllite-relational-database;

   Importing nhanes data in raw and from sqllite relational database

        CONTENTS
           1 r sqllite
           2 other nhanes data
           3 related repo


   github
   https://tinyurl.com/kyn337dm
   https://github.com/rogerjdeangelis/utl-importing-nhanes-data-in-raw-and-from-sqllite-database

   Solution by
   https://stackoverflow.com/users/7401037/daniel-j-iii

   StackOverflow R
   https://tinyurl.com/2jp28323
   https://stackoverflow.com/questions/79008050/how-to-read-the-content-of-a-db-file-in-r

   download this
   https://tinyurl.com/mrydzraj
   https://1drv.ms/u/c/bb0f3c4c9b1dc58b/EUsmkCts605Apx4vNCBiFVEB_5yj4hcu5ICEIVcRFK3Kvw?e=ktQ9Pu

   or go to and download

   https://r-survey.r-forge.r-project.org/svybook/
   https://r-survey.r-forge.r-project.org/svybook/nhanesimp.zip

   /*                   _
   (_)_ __  _ __  _   _| |_
   | | `_ \| `_ \| | | | __|
   | | | | | |_) | |_| | |_
   |_|_| |_| .__/ \__,_|\__|
           |_|
   */

   /*****************************************************************************************************************************/
   /*                                  |                                    |                                                   */
   /*                                  |                                    |                                                   */
   /*           INPUT                  |              PROCESS               |  OUTPUT SAS SD1.WANT OBS=33,994 & R DATAFRAME)    */
   /*           =====                  |              ========              |  =============================================    */
   /*                                  |                                    |                                                   */
   /*                                  |                                    |                                                   */
   /*  Download and unzip              | sqlite.driver <- dbDriver("SQLite")| NAME   TYPE    VA    NAME TYPE VAL NAME TYPE VAL  */
   /*                                  | db <- dbConnect(sqlite.driver      | ------------------   ------------- -------------- */
   /*  https://tinyurl.com/mrydzraj    |   ,dbname = "d:/db/imp.db")        |                    |              |               */
   /*                                  | readindb <- dbReadTable(db,"core") | EQN      N   21643 |  HFA7     N 2| HYD1IF   N 0  */
   /*  into                            |                                    | MPFSEQ   N    9477 |  HFA8     N 2| HYF2IF   N 0  */
   /*                                  |                                    | MPSTAT   N       1 |  HFA12    N 4| BDPFNDIF N 2  */
   /*  d:/zip                          |                                    | MARETHN  N       1 |  HAC1A    N 2| BDPINDIF N 2  */
   /*                                  |                                    | MARACER  N       1 |  HAC1B    N .| BDPKIF   N 2  */
   /*  d:/zip/nhanesimp.zip            |                                    | MAETHNR  N       3 |  HAC1C    N 2| BDPTOAIF N 2  */
   /*                                  |                                    | SSEX     N       1 |  HAC1D    N 2| BDPTODIF N 2  */
   /*                                  |                                    | SDOIMO   N       6 |  HAC1E    N 2| BDPTRDIF N 2  */
   /*  you can use r built in unzip    |                                    | SAGEIR   N      71 |  HAC1F    N 2| BDPWTDIF N 2  */
   /*                                  |                                    | SAGEU    N       2 |  HAC1G    N 2| BMPBUTIF N 2  */
   /*  unzip("d:/zip/nhanesimp.zip"    |                                    | SAITMOR  N     854 |  HAC1H    N 2| BMPHEAIF N 0  */
   /*    ,overwrite=TRUE,exdir="d:/db")|                                    | SFSIZER  N       1 |  HAC1I    N 2| BMPHTIF  N 2  */
   /*                                  |                                    | SHSIZER  N       1 |  HAC1J    N 2| BMPKNEIF N 2  */
   /*                                  |                                    | MPCNTYR  N     189 |  HAC1K    N 2| BMPRECIF N 0  */
   /*                                  |                                    | MPFIPSR  N      29 |  HAC1L    N 2| BMPSTHIF N 2  */
   /*                                  |                                    | MPMETRO  N       1 |  HAC1M    N 2| BMPSB1IF N 2  */
   /*                                  |                                    | MPCREGN  N       2 |  HAC1N    N 2| BMPSB2IF N 2  */
   /*                                  |                                    | DPPHASE  N       1 |  HAC1O    N 2| BMPSP1IF N 2  */
   /*                                  |                                    | DPPSU6   N       1 |  HAD1     N 2| BMPSP2IF N 2  */
   /*                                  |                                    | DPSTRA6  N      10 |  HAE2     N 2| BMPTR1IF N 2  */
   /*                                  |                                    | TPFQX6   N 4756.04 |  HAE4A    N .| BMPTR2IF N 2  */
   /*                                  |                                    | TPQRP1   N 7405.21 |  HAE4B    N .| BMPWSTIF N 2  */
   /*                                  |                                    | TPQRP2   N10987.55 |  HAE5A    N .| BMPWTIF  N 2  */
   /*                                  |                                    | TPQRP3   N 7947.04 |  HAE5B    N .| FEPIF    N 2  */
   /*                                  |                                    | TPQRP4   N 6314.18 |  HAE6     N 2| FRPIF    N 2  */
   /*                                  |                                    | TPQRP5   N  6701.2 |  HAE7     N .| HDPIF    N 2  */
   /*                                  |                                    | TPQRP6   N 5891.67 |  HAF1     N 2| HGPIF    N 2  */
   /*                                  |                                    | TPQRP7   N 7857.82 |  HAF10    N 2| HTPIF    N 2  */
   /*                                  |                                    | TPQRP8   N10488.55 |  HAG2     N 2| MCPSIIF  N 2  */
   /*                                  |                                    | TPQRP9   N10031.13 |  HAG3     N .| MHPIF    N 2  */
   /*                                  |                                    | TPQRP10  N 10785.3 |  HAG5A    N 2| MVPSIIF  N 2  */
   /*                                  |                                    | TPQRP11  N 6347.25 |  HAG5B    N 2| PBPIF    N 2  */
   /*                                  |                                    | TPQRP12  N 1097.48 |  HAG5C    N 2| PHPFSTIF N 2  */
   /*                                  |                                    | TPQRP13  N  1895.9 |  HAG11    N 2| PXPIF    N 2  */
   /*                                  |                                    | TPQRP14  N 1971.25 |  HAG12    N .| RCPIF    N 2  */
   /*                                  |                                    | TPQRP15  N 7403.87 |  HAN6HS   N 0| RWPIF    N 2  */
   /*                                  |                                    | TPQRP16  N10728.86 |  HAN6IS   N 0| SEPIF    N 2  */
   /*                                  |                                    | TPQRP17  N 9168.26 |  HAN6JS   N 0| TCPIF    N 2  */
   /*                                  |                                    | TPQRP18  N  8056.5 |  HAP1     N 2| TGPIF    N 2  */
   /*                                  |                                    | TPQRP19  N 1860.57 |  HAP1A    N .| TIPIF    N 2  */
   /*                                  |                                    | TPQRP20  N 2007.11 |  HAP2     N 1| FPPSUDIF N 2  */
   /*                                  |                                    | TPQRP21  N 1691.13 |  HAP3     N 1| FPPSUMIF N 2  */
   /*                                  |                                    | TPQRP22  N 2656.92 |  HAP10    N 2| FPPSURIF N 2  */
   /*                                  |                                    | TPQRP23  N  8979.7 |  HAP10A   N .| PEP6G1IF N 2  */
   /*                                  |                                    | TPQRP24  N    5305 |  HAR1     N 1| PEP6G2IF N 0  */
   /*                                  |                                    | TPQRP25  N 1533.42 |  HAR3     N 2| PEP6G3IF N 2  */
   /*                                  |                                    | TPQRP26  N 1188.37 |  HAR14    N 2| PEP6H1IF N 2  */
   /*                                  |                                    | TPQRP27  N  1438.2 |  HAR16    N .| PEP6H2IF N 0  */
   /*                                  |                                    | TPQRP28  N  3584.9 |  HAR23    N 1| PEP6H3IF N 2  */
   /*                                  |                                    | TPQRP29  N 8973.52 |  HAR24    N 2| PEP6I1IF N 2  */
   /*                                  |                                    | TPQRP30  N 8637.25 |  HAR26    N 1| PEP6I2IF N 0  */
   /*                                  |                                    | TPQRP31  N  1365.6 |  HAR27    N 2| PEP6I3IF N 2  */
   /*                                  |                                    | TPQRP32  N 1406.83 |  HYE1G    N .|               */
   /*                                  |                                    | TPQRP33  N 8393.79 |  HYE1H    N .|               */
   /*                                  |                                    | TPQRP34  N 5463.72 |  HYE6A    N .|               */
   /*                                  |                                    | TPQRP35  N 1706.41 |  HYE6B    N .|               */
   /*                                  |                                    | TPQRP36  N 2719.42 |  HYE15    N .|               */
   /*                                  |                                    | TPQRP37  N 1318.96 |  HYH2     N .|               */
   /*                                  |                                    | TPQRP38  N 1421.04 |  HYH10    N .|               */
   /*                                  |                                    | TPQRP39  N 8326.05 |  DMPPIRIF N 1|               */
   /*                                  |                                    | TPQRP40  N 4834.04 |  HFF1IF   N 1|               */
   /*                                  |                                    | TPQRP41  N 1290.85 |  HAB1IF   N 1|               */
   /*                                  |                                    | TPQRP42  N 4061.75 |  HAM5IF   N 1|               */
   /*                                  |                                    | TPQRP43  N 1414.84 |  HAM6IF   N 2|               */
   /*                                  |                                    | TPQRP44  N 1377.03 |  HAN6SRIF N 1|               */
   /*                                  |                                    | TPQRP45  N 7815.19 |  HAQ1IF   N 1|               */
   /*                                  |                                    | TPQRP46  N10862.63 |  HAR3RIF  N 1|               */
   /*                                  |                                    | TPQRP47  N 8682.86 |  HAT28IF  N 1|               */
   /*                                  |                                    | WTPQRP48 N 5858.37 |  HAZAK1IF N 1|               */
   /*                                  |                                    | WTPQRP49 N  1418.1 |  HAZAK5IF N 1|               */
   /*                                  |                                    | WTPQRP50 N 1238.38 |  HAZBK1IF N 1|               */
   /*                                  |                                    | WTPQRP51 N 1804.76 |  HAZCK1IF N 1|               */
   /*                                  |                                    | WTPQRP52 N 2362.58 |  HAZCK5IF N 1|               */
   /*                                  |                                                                                        */
   /*****************************************************************************************************************************/
   /*                    _ _ _ _         _                   _
   / |  _ __   ___  __ _| | (_) |_ ___  (_)_ __  _ __  _   _| |_
   | | | `__| / __|/ _` | | | | __/ _ \ | | `_ \| `_ \| | | | __|
   | | | |    \__ \ (_| | | | | ||  __/ | | | | | |_) | |_| | |_
   |_| |_|    |___/\__, |_|_|_|\__\___| |_|_| |_| .__/ \__,_|\__|
                      |_|                       |_|
   */

   /*****************************************************************************************************************************/
   /*                                                                                                                           */
   /*           INPUT                                                                                                           */
   /*           =====                                                                                                           */
   /*                                                                                                                           */
   /*                                                                                                                           */
   /*  Download and unzip                                                                                                       */
   /*                                                                                                                           */
   /*  https://tinyurl.com/mrydzraj                                                                                             */
   /*                                                                                                                           */
   /*  into                                                                                                                     */
   /*                                                                                                                           */
   /*  d:/zip                                                                                                                   */
   /*                                                                                                                           */
   /*  d:/zip/nhanesimp.zip                                                                                                     */
   /*                                                                                                                           */
   /*                                                                                                                           */
   /*  you can use r built in unzip                                                                                             */
   /*                                                                                                                           */
   /*  unzip("d:/zip/nhanesimp.zip"                                                                                             */
   /*    ,overwrite=TRUE,exdir="d:/db")                                                                                         */
   /*                                                                                                                           */
   /*****************************************************************************************************************************/

    /*
    _ __  _ __ ___   ___ ___  ___ ___
   | `_ \| `__/ _ \ / __/ _ \/ __/ __|
   | |_) | | | (_) | (_|  __/\__ \__ \
   | .__/|_|  \___/ \___\___||___/___/
   |_|
   */

   %utl_rbeginx;
   parmcards4;
   library(RSQLite)
   source("c:/oto/fn_tosas9x.R")
   unzip("d:/zip/nhanesimp.zip",overwrite=TRUE,exdir="d:/db");
   sqlite.driver <- dbDriver("SQLite")
   db <- dbConnect(sqlite.driver,dbname = "d:/db/imp.db")
   readindb <- dbReadTable(db,"core")
   head(readindb, 6)
   str(readindb)
   fn_tosas9x(
         inp    = readindb
        ,outlib ="d:/sd1/"
        ,outdsn ="want"
        )
   ;;;;
   %utl_rendx;

   libname sd1 "d:/sd1";
   proc print data=sd1.want(obs=6);
   run;quit;

   /**************************************************************************************************************************/
   /*                                                                                                                        */
   /* R                                                                                                                      */
   /* =                                                                                                                       */
   /*  str(readindb)                                                                                                         */
   /*                                                                                                                        */
   /*  data.frame 33,994 obs 200 variables                                                                                   */
   /*                                                                                                                        */
   /*  $ row_names: chr  "1" "2" "3" "4" ...                                                                                 */
   /*  $ SEQN     : num  3 4 7 9 10 11 12 13 14 16 ...                                                                       */
   /*  $ DMPFSEQ  : num  3872 4115 855 4064 5386 ...                                                                         */
   /*  $ DMPSTAT  : num  2 2 2 2 2 2 2 2 2 2 ...                                                                             */
   /*  $ DMARETHN : num  3 3 2 1 1 3 1 1 1 3 ...                                                                             */
   /*  $ DMARACER : num  1 1 2 1 1 1 1 1 1 1 ...                                                                             */
   /*  $ DMAETHNR : num  1 1 3 3 3 1 3 3 3 1 ...                                                                             */
   /*  ...                                                                                                                   */
   /*  $ HAE4B    : num  2 NA NA NA 1 NA NA NA NA NA ..                                                                      */
   /*  $ HAE5A    : num  NA NA NA NA NA NA NA NA NA NA                                                                       */
   /*  $ HAE5B    : num  NA NA NA NA 8 NA NA NA NA NA .                                                                      */
   /*  $ HAE6     : num  2 2 NA 1 1 2 NA NA NA NA ...                                                                        */
   /*                                                                                                                        */
   /* SAS                                                                                                                    */
   /* ===                                                                                                                    */
   /*  The CONTENTS Procedure                                                                                                */
   /*                                                                                                                        */
   /*  Data Set Name        SD1.WANT                      Observations          33994                                        */
   /*  Member Type          DATA                          Variables             201                                          */
   /*                                                                                                                        */
   /*    Variables in Creation Order                                                                                         */
   /*                                                                                                                        */
   /*    #    Variable     Type    Len                                                                                       */
   /*                                                                                                                        */
   /*    1    ROWNAMES     Num       6                                                                                       */
   /*    2    ROW_NAMES    Char      5                                                                                       */
   /*    3    SEQN         Num       6                                                                                       */
   /*    4    DMPFSEQ      Num       4                                                                                       */
   /*                                                                                                                        */
   /*   ...                                                                                                                  */
   /*                                                                                                                        */
   /*  199    PEP6I1IF     Num       3                                                                                       */
   /*  200    PEP6I2IF     Num       3                                                                                       */
   /*  201    PEP6I3IF     Num       3                                                                                       */
   /*                                                                                                                        */
   /**************************************************************************************************************************/

   /*___          _   _                       _                                _       _
   |___ \    ___ | |_| |__   ___ _ __   _ __ | |__   __ _ _ __   ___  ___   __| | __ _| |_ __ _
     __) |  / _ \| __| `_ \ / _ \ `__| | `_ \| `_ \ / _` | `_ \ / _ \/ __| / _` |/ _` | __/ _` |
    / __/  | (_) | |_| | | |  __/ |    | | | | | | | (_| | | | |  __/\__ \| (_| | (_| | || (_| |
   |_____|  \___/ \__|_| |_|\___|_|    |_| |_|_| |_|\__,_|_| |_|\___||___/ \__,_|\__,_|\__\__,_|


   see datasection
   https://r-survey.r-forge.r-project.org/svybook/

   MS onedrive
   https://tinyurl.com/y94a95de
   https://1drv.ms/u/s!AoqaX8I7j_icglh1a2X0e2NKRsCU?e=vTYcjD

   google drive
   https://tinyurl.com/y88hwomh
   https://drive.google.com/file/d/1Vd-sfUACNYqSO3vZzpH1b8woXKxq70hO/view?usp=sharing

   For more information on body measurements, see
   http://www.cdc.gov/nchs/nhanes/nhanes2009-2010/BMX_F.htm and
   http://www.cdc.gov/nchs/nhanes/nhanes2011-2012/BMX_G.htm

   macros
   https://tinyurl.com/y9nfugth
   https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

   /*____            _       _           _
   |___ /   _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___
     |_ \  | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \
    ___) | | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) |
   |____/  |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/
                                                     |_|
   */

   related repo
   https://github.com/rogerjdeangelis/utl-NHANES-full-raw-demographic-and-health-data-R-Package

   /*              _
     ___ _ __   __| |
    / _ \ `_ \ / _` |
   |  __/ | | | (_| |
    \___|_| |_|\__,_|

   */
