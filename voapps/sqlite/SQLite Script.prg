/*
TEXTBLOCK SQL_Script
/-*

SAVE THIS as vo_sql.sql 

TO RUN THIS SCRIPT, at the command prompt type:

sqlite3 joe  (starts sqlite, opens  or creates joe.db and sets the cursor at the SQLite command prompt)

.read vo_sql.sql  (starts this script)


This script creates two SQLite tables:

MASTER
TRANS_HIST

... from master.csv and trans_hist.csv, created in from the DBF files.  
Obviously the record layout of each CSV file must match the record layout of each CREATE statement

"Collate nocase" is a useful clause -- no need to be concerned about Upper( ) when you're sorting or seeking
The "primary key" constraint is a UNIQUE constraint.  In the case of the Master file, the FANO (client number) field is
unique.  In the transaction file, the FQ (unique ID) field is unique.

Indexes affect performance but presumably those issues have been worked out in the DBF system. The syntax is similar.
Our suggestion is to use the same indexing scheme, demonstrated below, as in the DBF file system

Zero-value numeric fields are updated with zeros.  This helps eliminate NULL errors

*-/

/-*  REMOVE THIS COMMENT TAG BEFORE RUNNING THE FILE

.print "creating tables"


CREATE TABLE MASTER 
(FKEY        VARCHAR(1),
FANO        NUMERIC(7, 0) PRIMARY KEY, 
FLOOKUP     VARCHAR(50) COLLATE NOCASE,  
FPREF       VARCHAR(20) COLLATE NOCASE,
FLAST       VARCHAR(20) COLLATE NOCASE,
FFIRST      VARCHAR(20) COLLATE NOCASE,
FMIDDLE     VARCHAR(20) COLLATE NOCASE,
FSUFF       VARCHAR(15) COLLATE NOCASE,
FTITLE      VARCHAR(50),
FCOMPANY    VARCHAR(70) COLLATE NOCASE,
FADDR1      VARCHAR(34) COLLATE NOCASE,
FADDR2      VARCHAR(34),
FCITY       VARCHAR(22) COLLATE NOCASE,
FSTATE      VARCHAR(2),
FZIP        VARCHAR(10),
FQ          VARCHAR(11),
FDT         VARCHAR(13) );


CREATE TABLE TRANS_HIST 
( OANO     NUMERIC(7, 0),
OCODE    CHAR(10) COLLATE NOCASE,
ODESC    VARCHAR(60),
OCAT     VARCHAR(5),
OPROG    VARCHAR(10),
OTYPE    VARCHAR(2),
ODATE    CHAR(8),
ODUE     CHAR(8),
OPGYR    VARCHAR(5),
OCCI     CHAR(1),
OAMT     NUMERIC(12, 2),
ODR      VARCHAR(10),
OCR      VARCHAR(10),
OCOMMNT  VARCHAR(50),
OCHECK   NUMERIC(6, 0),
OTRANS   NUMERIC(7, 0),
OTRANS2  VARCHAR(4),
OTRANS3  VARCHAR(4),  
OBACKREF NUMERIC(7, 0),
OPLG     VARCHAR(8),
OCHILD   CHAR(1),
OCHTYPE  VARCHAR(2),
OANO2    NUMERIC(7, 0),
OLOG     VARCHAR(15),
FBRANCH  NUMERIC(3, 0),
FQ       VARCHAR(11) PRIMARY KEY,
FDT      VARCHAR(13),
FOREIGN KEY(OANO) REFERENCES MASTER(FANO) );

.print "IMPORTING"
.import TRANS_HIST.CSV TRANS_HIST 
.import MASTER.CSV MASTER 

BEGIN TRANSACTION;
.print "REPLACING NULLS"
-- fill IN the NULL numeric values
UPDATE TRANS_HIST SET OANO     =0 WHERE OANO = "";
UPDATE TRANS_HIST SET OAMT     =0 WHERE OAMT     = "";
UPDATE TRANS_HIST SET OCHECK   =0 WHERE OCHECK   = "";
UPDATE TRANS_HIST SET OTRANS   =0 WHERE OTRANS   = "";
UPDATE TRANS_HIST SET OBACKREF =0 WHERE OBACKREF = "";
UPDATE TRANS_HIST SET OANO2    =0 WHERE OANO2    = "";
UPDATE TRANS_HIST SET FBRANCH  =0 WHERE FBRANCH  = "";

UPDATE master SET FANO        =0 WHERE FANO    = "";



.print "INDEXING"

CREATE INDEX MAS_FILE ON master( FANO );
CREATE INDEX MAS_NAME ON master( FLOOKUP );
CREATE INDEX MAS_KEYFILE ON master( FKEY, FANO );
CREATE INDEX MAS_KEYNAME ON master( FKEY, FLOOKUP );

CREATE INDEX TRANS_FILE ON TRANS_HIST(OANO, ODATE);
CREATE INDEX TRANS_CODE ON TRANS_HIST(OCODE, ODATE, OTRANS, OCHILD);
CREATE INDEX TRANS_DATE ON TRANS_HIST(ODATE, OANO, OTRANS, OCHILD);
CREATE INDEX TRANS_TRANS ON TRANS_HIST(OTRANS, OCHILD);
CREATE INDEX TRANS_CHECK ON TRANS_HIST(OCR, OCHECK);
CREATE INDEX TRANS_TYPE ON TRANS_HIST(OTYPE, ODATE);
CREATE INDEX TRANS_BACKREF ON TRANS_HIST(OBACKREF);

-- show the master file count
select count(*) from master AS mascount;
.print mascount

END TRANSACTION;


-- type .quit TO EXIT SQLite


REMOVE THIS COMMENT TAG BEFORE RUNNING THE SCRIPT *-/


*/
