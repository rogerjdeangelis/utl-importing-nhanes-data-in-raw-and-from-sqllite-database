/* utl-importing-nhanes-data-in-raw-and-from-sqllite-database
 *
 * Adapted from rogerjdeangelis' script for a self-contained run on Jenner.
 *
 * The upstream script imports the NHANES "imp" data from an external SQLite
 * database (d:/db/imp.db) through an R bridge (%utl_rbeginx / %utl_rendx +
 * fn_tosas9x.R), lands it as SD1.WANT (33,994 obs x 201 vars), then prints
 * the first six observations:
 *
 *     libname sd1 "d:/sd1";
 *     proc print data=sd1.want(obs=6);
 *     run;quit;
 *
 * The SQLite DB, the R bridge, and the d:/ Windows paths are not portable, so
 * here WANT is built inline with the exact NHANES demographic variable shape
 * documented in the upstream str(readindb) / PROC CONTENTS output
 * (ROWNAMES, ROW_NAMES, SEQN, DMPFSEQ, DMPSTAT, DMARETHN, DMARACER, DMAETHNR),
 * seeded with the SEQN / DMPFSEQ sample values the author records
 * (SEQN 3 4 7 9 10 11 ; DMPFSEQ 3872 4115 855 4064 5386 ...).
 * The author's own OBS=6 PROC PRINT step is then run unmodified.
 */

data want;
  length row_names $5;
  input rownames row_names $ seqn dmpfseq dmpstat dmarethn dmaracer dmaethnr;
datalines;
1 1 3 3872 2 3 1 1
2 2 4 4115 2 3 1 1
3 3 7 855 2 2 2 3
4 4 9 4064 2 1 1 3
5 5 10 5386 2 1 1 3
6 6 11 4890 2 3 1 1
7 7 12 5301 2 1 1 3
8 8 13 6120 2 1 1 3
9 9 14 3744 2 1 1 3
10 10 16 2087 2 3 1 1
;
run;

proc print data=want(obs=6);
run;quit;
