# Priority_Encoder_UVM_Verification
+++++++++++++++++++++++++++++++++++++++++++++
++++++++++       REPORT INFO       ++++++++++
+++++++++++++++++++++++++++++++++++++++++++++


SUMMARY
===============================================
|     Property     |          Value           |
===============================================
| User             | runner                   |
| Host             | 17e625a6d4db             |
| Tool             | Riviera-PRO 2023.04      |
| Report file      | /home/runner/cov.txt     |
| Report date      | 2025-01-16 22:51         |
| Report arguments | -verbose                 |
| Input file       | /home/runner/fcover.acdb |
| Input file date  | 2025-01-16 22:51         |
| Number of tests  | 1                        |
===============================================


TEST DETAILS
==============================================
| Property |              Value              |
==============================================
| Test     | fcover.acdb:fcover              |
| Status   | Ok                              |
| Args     | asim +access+r                  |
| Simtime  | 1040 ns                         |
| Cputime  | 4.584 s                         |
| Seed     | 1                               |
| Date     | 2025-01-16 22:51                |
| User     | runner                          |
| Host     | 17e625a6d4db                    |
| Host os  | Linux64                         |
| Tool     | Riviera-PRO 2023.04 (simulator) |
==============================================


+++++++++++++++++++++++++++++++++++++++++++++
++++++++++     DESIGN HIERARCHY    ++++++++++
+++++++++++++++++++++++++++++++++++++++++++++


CUMULATIVE SUMMARY
=============================================
|    Coverage Type    | Weight | Hits/Total |
=============================================
| Covergroup Coverage |      1 |   100.000% |
|---------------------|--------|------------|
| Types               |        |      1 / 1 |
=============================================
CUMULATIVE INSTANCE-BASED COVERAGE: 100.000%
COVERED INSTANCES: 1 / 1
FILES: 1


CLASS - /\package pkg\/enc_coverage : work.pkg/\pkg enc_coverage \


    SUMMARY
    =============================================
    |    Coverage Type    | Weight | Hits/Total |
    =============================================
    | Covergroup Coverage |      1 |   100.000% |
    |---------------------|--------|------------|
    | Types               |        |      1 / 1 |
    =============================================
    WEIGHTED AVERAGE LOCAL: 100.000%


    COVERGROUP COVERAGE
    =======================================================================
    |             Covergroup              |   Hits   |  Goal /  | Status  |
    |                                     |          | At Least |         |
    =======================================================================
    | TYPE /\package pkg\/enc_coverage/cg | 100.000% | 100.000% | Covered |
    =======================================================================
    | INSTANCE <UNNAMED1>                 | 100.000% | 100.000% | Covered |
    |-------------------------------------|----------|----------|---------|
    | COVERPOINT <UNNAMED1>::tr.D         | 100.000% | 100.000% | Covered |
    |-------------------------------------|----------|----------|---------|
    | bin low_priority                    |      107 |        1 | Covered |
    | bin mid_priority                    |      418 |        1 | Covered |
    | bin high_priority                   |      475 |        1 | Covered |
    |-------------------------------------|----------|----------|---------|
    | COVERPOINT <UNNAMED1>::tr.y         | 100.000% | 100.000% | Covered |
    |-------------------------------------|----------|----------|---------|
    | bin all_y[0]                        |        1 |        1 | Covered |
    | bin all_y[1]                        |        1 |        1 | Covered |
    | bin all_y[2]                        |        8 |        1 | Covered |
    | bin all_y[3]                        |       14 |        1 | Covered |
    | bin all_y[4]                        |       39 |        1 | Covered |
    | bin all_y[5]                        |       87 |        1 | Covered |
    | bin all_y[6]                        |      246 |        1 | Covered |
    | bin all_y[7]                        |      605 |        1 | Covered |
    =======================================================================


+++++++++++++++++++++++++++++++++++++++++++++
++++++++++       DESIGN UNITS      ++++++++++
+++++++++++++++++++++++++++++++++++++++++++++


CUMULATIVE SUMMARY
=============================================
|    Coverage Type    | Weight | Hits/Total |
=============================================
| Covergroup Coverage |      1 |   100.000% |
|---------------------|--------|------------|
| Types               |        |      1 / 1 |
=============================================
CUMULATIVE DESIGN-BASED COVERAGE: 100.000%
COVERED DESIGN UNITS: 1 / 1
FILES: 1


CLASS - work.pkg/\pkg enc_coverage \


    SUMMARY
    =============================================
    |    Coverage Type    | Weight | Hits/Total |
    =============================================
    | Covergroup Coverage |      1 |   100.000% |
    |---------------------|--------|------------|
    | Types               |        |      1 / 1 |
    =============================================
    WEIGHTED AVERAGE: 100.000%


    COVERGROUP COVERAGE
    =======================================================================
    |             Covergroup              |   Hits   |  Goal /  | Status  |
    |                                     |          | At Least |         |
    =======================================================================
    | TYPE /\package pkg\/enc_coverage/cg | 100.000% | 100.000% | Covered |
    =======================================================================
    | INSTANCE <UNNAMED1>                 | 100.000% | 100.000% | Covered |
    |-------------------------------------|----------|----------|---------|
    | COVERPOINT <UNNAMED1>::tr.D         | 100.000% | 100.000% | Covered |
    |-------------------------------------|----------|----------|---------|
    | bin low_priority                    |      107 |        1 | Covered |
    | bin mid_priority                    |      418 |        1 | Covered |
    | bin high_priority                   |      475 |        1 | Covered |
    |-------------------------------------|----------|----------|---------|
    | COVERPOINT <UNNAMED1>::tr.y         | 100.000% | 100.000% | Covered |
    |-------------------------------------|----------|----------|---------|
    | bin all_y[0]                        |        1 |        1 | Covered |
    | bin all_y[1]                        |        1 |        1 | Covered |
    | bin all_y[2]                        |        8 |        1 | Covered |
    | bin all_y[3]                        |       14 |        1 | Covered |
    | bin all_y[4]                        |       39 |        1 | Covered |
    | bin all_y[5]                        |       87 |        1 | Covered |
    | bin all_y[6]                        |      246 |        1 | Covered |
    | bin all_y[7]                        |      605 |        1 | Covered |
    =======================================================================


